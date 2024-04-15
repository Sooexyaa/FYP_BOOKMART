<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
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
