<?php
/**
 * Created by PhpStorm.
 * User: alberto
 * Date: 5/11/17
 * Time: 11:07 PM
 */

namespace App\Services;


use App\Contracts\ContactInterface;
use App\Models\Contact;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Auth;

class ContactService implements ContactInterface
{

    /**
     * @return Collection|static[]
     */
    public function getAll()
    {
        return Contact::all();
    }

    /**
     * @param int $id
     * @return Contact
     */
    public function getById(int $id): Contact
    {
        return Contact::findOrFail($id);
    }

    /**
     * @param array $data
     * @return Contact
     */
    public function create(array $data): Contact
    {
        $contact = new Contact();

        $contact->user_id = Auth::user()->id;
        $contact->name = $data['name'];
        $contact->phone = $data['phone'];
        $contact->email = $data['email'];

        $contact->save();

        return $contact;
    }

    /**
     * @param array $data
     * @param int $id
     * @return Contact
     */
    public function update(array $data, int $id): Contact
    {
        /** @var Contact $contact */
        $contact = Contact::findOrFail($id);

        $contact->user_id = Auth::user()->id;
        $contact->name = $data['name'];
        $contact->phone = $data['phone'];
        $contact->email = $data['email'];

        $contact->save();

        return $contact;
    }

    /**
     * @param int $id
     * @return int|mixed
     */
    public function delete(int $id)
    {
        return Contact::destroy($id);
    }

}