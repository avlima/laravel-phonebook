<?php

namespace App\Providers;


use App\Contracts\AgendaInterface;
use App\Services\AgendaService;
use Illuminate\Support\ServiceProvider;

class AgendaProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(AgendaInterface::class, function () {
            return new AgendaService();
        });
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return [AgendaInterface::class];
    }
}