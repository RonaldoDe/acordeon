<?php

namespace App\Model\Song;

use Illuminate\Database\Eloquent\Model;

class Song extends Model
{
    protected $table = 'song';
    public $timestamps=false;
    protected $fillable = [
        'data', 'created_at', 'created_by', 'order_by', 'name', 'description', 'image', 'state_id', 'allow_to'
    ];
}
