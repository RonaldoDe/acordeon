<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class SongRating extends Model
{
    protected $table = 'song_rating';
    public $timestamps=false;
    protected $fillable = [
        'song_id', 'user_id', 'rating', 'created_at'
    ];
}
