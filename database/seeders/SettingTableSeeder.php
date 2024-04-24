<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SettingTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data=array(
            'description'=>"BOOKMART is the best Bookstore for a reader. Please FOLLOW us and get updated of all kinds of COURSE BOOKS,LITERARY BOOKS as well as STATIONERIES.",
            'short_des'=>"Here at Book Mart you can get all kinds of Academic, fiction and non- fiction books and stationaries. We also buy and sell second hand books in reasonable price",
            'photo'=>"image.jpg",
            'logo'=>'logo.jpg',
            'address'=>"Gairapatan,Pokhara",
            'email'=>"bookmart@gmail.com",
            'phone'=>"9846362500",
        );
        DB::table('settings')->insert($data);
    }
}
