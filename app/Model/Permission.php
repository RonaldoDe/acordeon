<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    protected $table = 'permission';
    public $timestamps=false;
    protected $fillable = [
        'name', 'description', 'route'
    ];
}
