<?php

namespace App\Http\Controllers\Api\Other;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SongRatingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            'song_id' => 'required|numeric|exists:song,id',
            'rating' => 'required|numeric',
        ]);

        if($validator->fails())
        {
          return response()->json( $errors=$validator->errors()->all(), 400);
        }

        $rating = SongCategory::create([
            'song_id' => request('song_id'),
            'category_id' => request('category_id'),
            'order_by' => $song_category,
        ]);

        return response()->json(['response' => 'Operación exitosa'], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        //
    }
}
