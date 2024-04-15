<?php

<<<<<<< HEAD
/**
 * Laravel - A PHP Framework For Web Artisans
 *
 * @package  Laravel
 * @author   Taylor Otwell <taylor@laravel.com>
 */
=======
use Illuminate\Contracts\Http\Kernel;
use Illuminate\Http\Request;
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc

define('LARAVEL_START', microtime(true));

/*
|--------------------------------------------------------------------------
<<<<<<< HEAD
=======
| Check If The Application Is Under Maintenance
|--------------------------------------------------------------------------
|
| If the application is in maintenance / demo mode via the "down" command
| we will load this file so that any pre-rendered content can be shown
| instead of starting the framework, which could cause an exception.
|
*/

if (file_exists($maintenance = __DIR__.'/../storage/framework/maintenance.php')) {
    require $maintenance;
}

/*
|--------------------------------------------------------------------------
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
| Register The Auto Loader
|--------------------------------------------------------------------------
|
| Composer provides a convenient, automatically generated class loader for
<<<<<<< HEAD
| our application. We just need to utilize it! We'll simply require it
| into the script here so that we don't have to worry about manual
| loading any of our classes later on. It feels great to relax.
=======
| this application. We just need to utilize it! We'll simply require it
| into the script here so we don't need to manually load our classes.
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
|
*/

require __DIR__.'/../vendor/autoload.php';

/*
|--------------------------------------------------------------------------
<<<<<<< HEAD
| Turn On The Lights
|--------------------------------------------------------------------------
|
| We need to illuminate PHP development, so let us turn on the lights.
| This bootstraps the framework and gets it ready for use, then it
| will load up this application so that we can run it and send
| the responses back to the browser and delight our users.
=======
| Run The Application
|--------------------------------------------------------------------------
|
| Once we have the application, we can handle the incoming request using
| the application's HTTP kernel. Then, we will send the response back
| to this client's browser, allowing them to enjoy our application.
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
|
*/

$app = require_once __DIR__.'/../bootstrap/app.php';

<<<<<<< HEAD
/*
|--------------------------------------------------------------------------
| Run The Application
|--------------------------------------------------------------------------
|
| Once we have the application, we can handle the incoming request
| through the kernel, and send the associated response back to
| the client's browser allowing them to enjoy the creative
| and wonderful application we have prepared for them.
|
*/

$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);

$response = $kernel->handle(
    $request = Illuminate\Http\Request::capture()
);

$response->send();
=======
$kernel = $app->make(Kernel::class);

$response = $kernel->handle(
    $request = Request::capture()
)->send();
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc

$kernel->terminate($request, $response);
