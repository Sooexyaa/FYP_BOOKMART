<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
<<<<<<< HEAD
use Illuminate\Support\Facades\Schema;
=======

>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
<<<<<<< HEAD
     *
     * @return void
     */
    public function register()
=======
     */
    public function register(): void
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
    {
        //
    }

    /**
     * Bootstrap any application services.
<<<<<<< HEAD
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
=======
     */
    public function boot(): void
    {
        //
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
    }
}
