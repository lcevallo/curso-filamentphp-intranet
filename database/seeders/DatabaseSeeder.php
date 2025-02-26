<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Database\Seeders\WorldTableSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        // User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        DB::table('users')->insert(
           [
                [
                'name' => 'Administrator',
                'email' => 'admin@example.com',
                'password' => Hash::make('Passw0rd')
                ],
                [
                    'name' => 'Luis Cevallos',
                    'email' => 'lcevallosc@ulvr.edu.ec',
                    'password' => Hash::make('Passw0rd')
                ],
                [
                    'name' => 'Administrator',
                    'email' => 'jcatagua@ulvr.edu.ec',
                    'password' => Hash::make('Passw0rd')
                ]
           ]
        );


        // $this->call(WorldTableSeeder::class);
    }
}
