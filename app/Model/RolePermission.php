<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class RolePermission extends Model
{
    protected $table = 'role_permission';
    public $timestamps=false;
    protected $fillable = [
        'role_id', 'permission_id', 'per_show', 'per_update', 'per_create', 'per_delete'
    ];
}
