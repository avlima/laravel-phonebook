<?php

namespace Tests;

use App\Models\Contact;
use Illuminate\Foundation\Testing\TestCase as BaseTestCase;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication;

    public function setUp()
    {
        factory(Contact::class)->create();
    }
}
