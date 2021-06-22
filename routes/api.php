<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ArticleController;

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('articles', [ArticleController::class, 'index']);

Route::get('article/{id}', [ArticleController::class, 'show']);

Route::post('article', [ArticleController::class, 'store']);

Route::put('article/{id}', [ArticleController::class, 'update']);

Route::delete('article/{id}', [ArticleController::class,'destroy']);
