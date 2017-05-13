<?php

namespace App\Contracts;

use App\Models\Agenda;
use Illuminate\Database\Eloquent\Collection;

interface AgendaInterface
{
    /**
     * @return Collection|static[]
     */
    public function getAll();
    /**
     * @param int $id
     * @return Agenda
     */
    public function getById(int $id): Agenda;

    /**
     * @param array|null $criteria
     * @return Collection|static[]
     */
    public function getByCriteria(?array $criteria);

    /**
     * @param array $data
     * @return Agenda
     */
    public function create(array $data): Agenda;

    /**
     * @param array $data
     * @param int $id
     * @return Agenda
     */
    public function update(array $data, int $id): Agenda;

    /**
     * @param int $id
     * @return int|mixed
     */
    public function delete(int $id);
}