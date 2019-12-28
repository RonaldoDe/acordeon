<?php

namespace App\Http\Controllers\Api\Song;

use App\Http\Controllers\Controller;
use App\Model\Song\Song;
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
            ->get();
        }else{
            $songs = Song::whereIn('allow_to', ['free'])
            ->get();
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
            /*'name' => 'required|min:1|max:75',
    		'last_name' => 'required|min:1|max:75',
    		'phone' => 'required|numeric',
    		'address' => 'required',
    		'dni' => 'required|max:11',
    		'email' => 'required|unique:users,email',
    		'password' => 'required|min:6',*/
    		#'role_id' => 'required|numeric',

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
        //
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
