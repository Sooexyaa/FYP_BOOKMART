<?php

namespace Tests;

use Illuminate\Contracts\Console\Kernel;
<<<<<<< HEAD
=======
use Illuminate\Foundation\Application;
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc

trait CreatesApplication
{
    /**
     * Creates the application.
<<<<<<< HEAD
     *
     * @return \Illuminate\Foundation\Application
     */
    public function createApplication()
=======
     */
    public function createApplication(): Application
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
    {
        $app = require __DIR__.'/../bootstrap/app.php';

        $app->make(Kernel::class)->bootstrap();

        return $app;
    }
}
