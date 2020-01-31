<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('login', 'Api\Login\LoginController@login');
Route::post('register', 'Api\Login\LoginController@register');

Route::middleware(['auth:api'])->group(function () {
    Route::apiResource('song', 'Api\Song\SongController');
    Route::put('activated_song/{id}', 'Api\Song\SongController@activatedSong');
    Route::apiResource('category', 'Api\Other\CategoryController');
    Route::get('song_state', 'Api\Other\FreeListController@songState');
    Route::apiResource('song_category', 'Api\Other\SongCategoryController');
});

