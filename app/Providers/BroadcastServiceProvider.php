<?php

namespace App\Providers;

use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\ServiceProvider;

class BroadcastServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
<<<<<<< HEAD
     *
     * @return void
     */
    public function boot()
=======
     */
    public function boot(): void
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
    {
        Broadcast::routes();

        require base_path('routes/channels.php');
    }
}
