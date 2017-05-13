<?php

namespace App\Models;

use HipsterJazzbo\Landlord\BelongsToTenants;
use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Contact
 *
 * @property int $id
 * @property int $user_id
 * @property int $contact_id
 * @property string $description
 * @property \Carbon\Carbon $date
 * @property string $completed
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @mixin \Eloquent
 */
class Agenda extends Model
{
    use BelongsToTenants;

    public $tenantColumns = ['user_id'];

    protected $hidden = ['user_id'];

    /**
     * Get the Contact
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function contact()
    {
        return $this->hasOne(Contact::class, 'id', 'contact_id');
    }
}
