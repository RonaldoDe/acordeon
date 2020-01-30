<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class SongCategory extends Model
{
    protected $table = 'song_category';
    public $timestamps=false;
    protected $fillable = [
        'song_id', 'category_id', 'order_by', 'created_at'
    ];
}
