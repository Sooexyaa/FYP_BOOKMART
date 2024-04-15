<?php

namespace App\Http\Middleware;

use Illuminate\Cookie\Middleware\EncryptCookies as Middleware;

class EncryptCookies extends Middleware
{
    /**
     * The names of the cookies that should not be encrypted.
     *
<<<<<<< HEAD
     * @var array
=======
     * @var array<int, string>
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
     */
    protected $except = [
        //
    ];
}
