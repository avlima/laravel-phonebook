<?php

namespace App\Models;

use HipsterJazzbo\Landlord\BelongsToTenants;
use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Contact
 *
 * @property int $id
 * @property int $user_id
 * @property string $name
 * @property string $phone
 * @property string $email
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @mixin \Eloquent
 */
class Contact extends Model
{
    use BelongsToTenants;

    public $tenantColumns = ['user_id'];

    protected $hidden = ['user_id'];

    public static function boot()
    {
        parent::boot();

        static::deleting(function ($model) {
            if (Agenda::where('contact_id', $model->id)->count() > 0) {
                throw new \Exception("O registro '{$model->name}' possui um relacionamento e por isso não pode ser excluído.", 23000);
            }
        });
    }
}
