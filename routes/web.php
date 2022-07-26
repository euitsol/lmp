<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\StudentController;
use App\Http\Controllers\CountryController;
use App\Http\Controllers\CenterController;
use App\Http\Controllers\StudentDetailController;
use App\Http\Controllers\StudentProfileController;
use App\Http\Controllers\EduLevelController;
use App\Http\Controllers\EnglishTestController;


$namespacePrefix = '\\'.config('voyager.controllers.namespace').'\\';
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


//Test Routes
Route::get('/test/{r}', [StudentController::class, 'test'])->name('test');


Route::get('/', function () {
    return view('welcome');
});

Route::get('login', ['uses' => $namespacePrefix.'VoyagerAuthController@login',     'as' => 'login']);

Route::group(['prefix' => 'admin'], function () {
    Route::get('countries/status', [CountryController::class, 'status'])->name('countries.status');
    Route::get('cities/status/{id}', [CountryController::class, 'status'])->name('cities.status');
    Route::get('centers/status/{id}', [CenterController::class, 'status'])->name('centers.status');
    Route::get('education-levels/status/{id}', [EduLevelController::class, 'status'])->name('edu_level.status');
    Route::get('english-tests/status/{id}', [EnglishTestController::class, 'status'])->name('eng_test.status');

    Route::get('student-details/details/{id}', [StudentDetailController::class, 'details'])->name('admin.student.details');
    Voyager::routes();
});


// Student Routes

//Student login,registration

Route::group(['prefix' => 'student', 'as' => 'student.'], function () {

    Route::get('/register', [StudentController::class, 'register'])->name('register');
    Route::post('/register/store', [StudentController::class, 'register_store'])->name('register.store');
    Route::post('/countries', [StudentController::class, 'countries'])->name('countries');
    Route::post('/cities', [StudentController::class, 'cities'])->name('cities');
    Route::post('/reference', [StudentController::class, 'reference'])->name('reference');
    Route::get('/', [StudentController::class, 'dashboard'])->name('dashboard');

    Route::get('/profile', [StudentProfileController::class, 'profile'])->name('profile');
    Route::post('/profile/update', [StudentProfileController::class, 'profile_update'])->name('profile.update');
    Route::post('/education/update', [StudentProfileController::class, 'edu_update'])->name('education.update');
    Route::post('/education-levels', [StudentProfileController::class, 'levels'])->name('edu_level.level');
    Route::post('/english-tests', [StudentProfileController::class, 'eng_tests'])->name('eng_test');

});
