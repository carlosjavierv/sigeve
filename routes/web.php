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

Route::resource('/api/usuario','UserController');
Route::post('/api/login','UserController@login');
Route::resource('/api/unidad','UnidadController');
Route::resource('/api/vehiculo','VehiculoController');
Route::get('/api/vehiculos','VehiculoController@vehiculos');
Route::resource('/api/conductor','ConductorController');
Route::resource('/api/rol','RolController');
Route::resource('/api/ubicacion','UbicacionController');
