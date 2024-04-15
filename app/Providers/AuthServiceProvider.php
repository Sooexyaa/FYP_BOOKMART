<?php

namespace App\Providers;

<<<<<<< HEAD
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
=======
// use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc

class AuthServiceProvider extends ServiceProvider
{
    /**
<<<<<<< HEAD
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
=======
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        //
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
    ];

    /**
     * Register any authentication / authorization services.
<<<<<<< HEAD
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

=======
     */
    public function boot(): void
    {
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
        //
    }
}
