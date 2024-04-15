<?php

namespace App\Http\Middleware;

use App\Providers\RouteServiceProvider;
use Closure;
<<<<<<< HEAD
use Illuminate\Support\Facades\Auth;
=======
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
<<<<<<< HEAD
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (Auth::guard($guard)->check()) {
            return redirect(RouteServiceProvider::HOME);
=======
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, string ...$guards): Response
    {
        $guards = empty($guards) ? [null] : $guards;

        foreach ($guards as $guard) {
            if (Auth::guard($guard)->check()) {
                return redirect(RouteServiceProvider::HOME);
            }
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
        }

        return $next($request);
    }
}
