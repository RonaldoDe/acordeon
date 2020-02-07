<?php

namespace App\Model\Song;

use Illuminate\Database\Eloquent\Model;

class Song extends Model
{
    protected $table = 'song';
    public $timestamps=false;
    protected $fillable = [
        'data', 'created_at', 'created_by', 'order_by', 'name', 'description', 'image', 'state_id', 'allow_to', 'register', 'keys_amount'
    ];

    public function scopeCategory($query, $category_id)
    {
    	if(!empty($category_id)){
    		return $query->select('song.data', 'song.created_at', 'song.created_by', 'song.order_by', 'song.name', 'song.description', 'song.image', 'song.register', 'song.keys_amount', 'song.state_id', 'song.allow_to', 'c.name as category_name', 'c.description as category_description')
    		->join('song_category as sc', 'song.id', 'sc.song_id')
    		->join('category as c', 'sc.category_id', 'c.id')
        	->where('c.id', $category_id);
    	}
        
    }
}
