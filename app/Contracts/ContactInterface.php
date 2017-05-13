<?php

namespace App\Contracts;


use App\Models\Contact;
use Illuminate\Database\Eloquent\Collection;

interface ContactInterface
{
    /**
     * @return Collection|static[]
     */
    public function getAll();
    /**
     * @param int $id
     * @return Contact
     */
    public function getById(int $id): Contact;

    /**
     * @param array $data
     * @return Contact
     */
    public function create(array $data): Contact;

    /**
     * @param array $data
     * @param int $id
     * @return Contact
     */
    public function update(array $data, int $id): Contact;

    /**
     * @param int $id
     * @return int|mixed
     */
    public function delete(int $id);
}