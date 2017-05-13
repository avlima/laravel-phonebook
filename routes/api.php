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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => ['auth:api', 'auth.phonebook']], function () {
    Route::get('/contacts', 'ContactController@index');
    Route::get('/contacts/{id}', 'ContactController@show');
    Route::post('/contacts', 'ContactController@store');
    Route::put('/contacts/{id}', 'ContactController@update');
    Route::delete('/contacts/{id}', 'ContactController@destroy');
});
