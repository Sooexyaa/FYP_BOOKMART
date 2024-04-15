<?php

namespace Tests\Feature;

<<<<<<< HEAD
use Illuminate\Foundation\Testing\RefreshDatabase;
=======
// use Illuminate\Foundation\Testing\RefreshDatabase;
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
use Tests\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
<<<<<<< HEAD
     *
     * @return void
     */
    public function testBasicTest()
=======
     */
    public function test_the_application_returns_a_successful_response(): void
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }
}
