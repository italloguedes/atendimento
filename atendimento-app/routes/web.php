<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AtendimentoController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/cadastrar', [AtendimentoController::class, 'create']);
Route::post('/cadastrar', [AtendimentoController::class, 'store']);

