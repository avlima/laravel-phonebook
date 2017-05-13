<?php

namespace App\Providers;


use App\Contracts\ContactInterface;
use App\Services\ContactService;
use Illuminate\Support\ServiceProvider;

class ContactProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(ContactInterface::class, function () {
            return new ContactService();
        });
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return [ContactInterface::class];
    }
}