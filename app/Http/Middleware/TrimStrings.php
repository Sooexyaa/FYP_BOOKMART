<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\TrimStrings as Middleware;

class TrimStrings extends Middleware
{
    /**
     * The names of the attributes that should not be trimmed.
     *
<<<<<<< HEAD
     * @var array
     */
    protected $except = [
=======
     * @var array<int, string>
     */
    protected $except = [
        'current_password',
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
        'password',
        'password_confirmation',
    ];
}
