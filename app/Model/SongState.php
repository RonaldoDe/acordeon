<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class SongState extends Model
{
    protected $table = 'song_state';
    public $timestamps=false;
    protected $fillable = [
        'name', 'description'
    ];
}
