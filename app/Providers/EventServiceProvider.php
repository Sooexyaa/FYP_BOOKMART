<?php

namespace App\Providers;

use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;

class EventServiceProvider extends ServiceProvider
{
    /**
<<<<<<< HEAD
     * The event listener mappings for the application.
     *
     * @var array
=======
     * The event to listener mappings for the application.
     *
     * @var array<class-string, array<int, class-string>>
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
    ];

    /**
     * Register any events for your application.
<<<<<<< HEAD
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }
=======
     */
    public function boot(): void
    {
        //
    }

    /**
     * Determine if events and listeners should be automatically discovered.
     */
    public function shouldDiscoverEvents(): bool
    {
        return false;
    }
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
}
