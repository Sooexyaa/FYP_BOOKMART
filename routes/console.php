<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;

/*
|--------------------------------------------------------------------------
| Console Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of your Closure based console
| commands. Each Closure is bound to a command instance allowing a
| simple approach to interacting with each command's IO methods.
|
*/

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
<<<<<<< HEAD
})->describe('Display an inspiring quote');
=======
})->purpose('Display an inspiring quote');
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
