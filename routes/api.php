<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


//============ CURSOS ===========================//
Route::get('/cursos','App\Http\Controllers\CursoController@index');
Route::get('/curso/{id}','App\Http\Controllers\CursoController@curso');
Route::post('/cursos','App\Http\Controllers\CursoController@store');
Route::put('/cursos/{id}','App\Http\Controllers\CursoController@update');
Route::delete('/cursos/{id}','App\Http\Controllers\CursoController@destroy');
Route::post('/upload_image/{id}','App\Http\Controllers\CursoController@store_imagen');
Route::post('/cursos/buscar','App\Http\Controllers\CursoController@buscar');

//=============USUARIOS =============================//
Route::get('/users','App\Http\Controllers\UserController@index');
Route::post('/users/login','App\Http\Controllers\UserController@login');
Route::get('/users/verify/{id}','App\Http\Controllers\UserController@verify');
Route::post('/users','App\Http\Controllers\UserController@store');
Route::post('/users/upload_image/{id}','App\Http\Controllers\UserController@store_imagen');
Route::put('/users/{id}','App\Http\Controllers\UserController@update');
Route::delete('/users/{id}','App\Http\Controllers\UserController@destroy');

//=================== CALIFICACION =============================//
Route::get('/calificacion','App\Http\Controllers\CalificacionController@index');

//================== CALIFICA CURSO ==================================//
Route::post('/calificaCurso','App\Http\Controllers\CalificaCursoController@store');
