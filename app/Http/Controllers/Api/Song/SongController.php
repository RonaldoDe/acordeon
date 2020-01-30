<?php

namespace App\Http\Controllers\Api\Song;

use App\Http\Controllers\Controller;
use App\Model\Song\Song;
use App\Model\SongRating;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SongController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = User::find(Auth::id());
        if($user->category == 'registered'){
            $songs = Song::whereIn('allow_to', ['free', 'premiun'])
            ->category(request('category_id'))
            ->get();
        }else{
            $songs = Song::whereIn('allow_to', ['free'])
            ->category(request('category_id'))
            ->get();
        }

        foreach ($songs as $song) {
            $prom = 0;
            $rating = SongRating::select('song_rating.rating')
            ->join('song as s', 'song_rating.song_id', 's.id')
            ->where('s.id', $song->id)
            ->get();

            $total = collect($rating)->sum('rating');

            if(count($rating) > 0){
                $prom = $total / count($rating);
            }

            $song->rating = $prom;

        }



        return response()->json(['response' => $songs], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator=\Validator::make($request->all(),[
            'name' => 'required|min:1|max:75',
    		'description' => 'required|min:1|max:75',
    		'data' => 'required|numeric',
    		'image' => 'required',
    		'state_id' => 'required|numeric',
    		'allow_to' => 'required|max:11'

        ]);

        if($validator->fails())
        {

          return response()->json( $errors=$validator->errors()->all(), 400);
        }

        $last = Song::max('order_by');

        $song = Song::create([
            'data' => request('data'),
            'created_by' => Auth::id(),
            'order_by' => $last + 1,
            'name' => request('name'),
            'description' => request('description'),
            'image' => request('image'),
            'state_id' => request('state_id'),
            'allow_to' => request('allow_to'),
        ]);

        return response()->json(['response' => 'Operación exitosa.'], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $song = Song::select('song.data', 'song.created_at', 'song.name', 'song.description', 'song.image', 'song.state_id', 'u.name as user_name', 'u.last_name as user_last_name')
                ->join('users as u', 'song.created_by', 'u.id')
                ->find($id);

        return response()->json(['response' => $song], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator=\Validator::make($request->all(),[
            'name' => 'required|min:1|max:75',
    		'description' => 'required|min:1|max:75',
    		'data' => 'required|numeric',
    		'image' => 'required',
    		'state_id' => 'required|numeric',
    		'allow_to' => 'required|max:11'

        ]);

        if($validator->fails())
        {

          return response()->json( $errors=$validator->errors()->all(), 400);
        }

        $song = Song::find($id);

        if(!$song){
            return response()->json(['response' => ['error' ['Canción no encontrada.']]], 400);
        }

        $song->name = request('name');
        $song->description = request('description');
        $song->data = request('data');
        $song->image = request('image');
        $song->state_id = request('state_id');
        $song->allow_to = request('allow_to');
        $song->update();

        return response()->json(['response' => 'Operación excitosa.'], 200);



    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $song = Song::find($id);

        if(!$song){
            return response()->json(['response' => 'Canción no encontrada'], 400);
        }

        $song->state_id = 2;
        $song->update();

        return response()->json(['response' => 'Canción eliminada'], 200);
    }
}
