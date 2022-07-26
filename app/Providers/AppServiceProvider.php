<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use TCG\Voyager\Facades\Voyager;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
         // Enable custom actions
         Voyager::addAction(\App\Actions\CountryStatusAction::class);
         Voyager::addAction(\App\Actions\CityStatusAction::class);
         Voyager::addAction(\App\Actions\CenterStatusAction::class);
         Voyager::addAction(\App\Actions\EducationLevelStatus::class);
         Voyager::addAction(\App\Actions\EnglishTestStatus::class);
    }
}
