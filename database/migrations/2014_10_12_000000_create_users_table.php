<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

<<<<<<< HEAD
class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
=======
return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
<<<<<<< HEAD
            $table->string('email')->unique()->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->nullable();
            $table->string('photo')->nullable();
            $table->enum('role',['admin','user'])->default('user');
            $table->string('provider')->nullable();
            $table->string('provider_id')->nullable();
            $table->enum('status',['active','inactive'])->default('active');
            $table->rememberToken()->nullable();
=======
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
<<<<<<< HEAD
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
=======
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
