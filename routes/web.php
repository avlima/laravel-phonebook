<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::group(['middleware' => ['auth', 'auth.phonebook']], function () {
    Route::get('/home', 'HomeController@index')->name('home');

    Route::get('/contacts', 'ContactController@index')->name('contacts');
    Route::get('/contacts/create', 'ContactController@create')->name('contacts.create');
    Route::get('/contacts/edit/{id}', 'ContactController@edit')->name('contacts.edit');
    Route::post('/contacts/{id}', 'ContactController@update')->name('contacts.update');
    Route::post('/contacts', 'ContactController@store')->name('contacts.store');
    Route::get('/contacts/delete/{id}', 'ContactController@destroy')->name('contacts.destroy');

    Route::get('/agendas', 'AgendaController@index')->name('agendas');
    Route::get('/agendas/create', 'AgendaController@create')->name('agendas.create');
    Route::get('/agendas/edit/{id}', 'AgendaController@edit')->name('agendas.edit');
    Route::post('/agendas/{id}', 'AgendaController@update')->name('agendas.update');
    Route::post('/agendas', 'AgendaController@store')->name('agendas.store');
    Route::get('/agendas/delete/{id}', 'AgendaController@destroy')->name('agendas.destroy');
});
