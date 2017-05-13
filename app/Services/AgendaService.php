<?php

namespace App\Services;


use App\Contracts\AgendaInterface;
use App\Enum\SituationEnum;
use App\Models\Agenda;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Auth;

class AgendaService implements AgendaInterface
{
    /**
     * @return Collection|static[]
     */
    public function getAll()
    {
        return Agenda::with('contact')->get();
    }

    /**
     * @param int $id
     * @return Agenda
     */
    public function getById(int $id): Agenda
    {
        return Agenda::findOrFail($id);
    }

    /**
     * @param array|null $criteria
     * @return Collection|static[]
     */
    public function getByCriteria(?array $criteria)
    {
        if (!is_null($criteria) && count($criteria) > 0) {
            return Agenda::where(function ($query) use ($criteria) {
                foreach ($criteria as $criterion) {
                    $query->where($criterion['column'], $criterion['operator'], $criterion['value']);
                }
            });
        }

        return $this->getAll();
    }

    /**
     * @param array $data
     * @return Agenda
     */
    public function create(array $data): Agenda
    {
        $contact = new Agenda();

        $contact->user_id = Auth::user()->id;
        $contact->contact_id = $data['contact_id'];
        $contact->description = $data['description'];
        $contact->date = Carbon::createFromFormat('d/m/Y', $data['date'])->format('Y-m-d');

        $contact->save();

        return $contact;
    }

    /**
     * @param array $data
     * @param int $id
     * @return Agenda
     */
    public function update(array $data, int $id): Agenda
    {
        /** @var Agenda $contact */
        $contact = Agenda::findOrFail($id);

        $contact->user_id = Auth::user()->id;
        $contact->contact_id = $data['contact_id'];
        $contact->description = $data['description'];
        $contact->date = Carbon::createFromFormat('d/m/Y', $data['date'])->format('Y-m-d');
        $contact->completed = array_get($data, 'completed', SituationEnum::NO);

        $contact->save();

        return $contact;
    }

    /**
     * @param int $id
     * @return int|mixed
     */
    public function delete(int $id)
    {
        return Agenda::destroy($id);
    }
}