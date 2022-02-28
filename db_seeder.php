<?php

require 'db.php';
require 'seeder/kelas.php';
require 'seeder/siswa.php';
require 'seeder/laundry.php';

try {
    // reset auto_increment
    foreach (['kelas', 'siswa', 'laundry'] as $item) {
        $GLOBALS['mysqli']->query("DELETE FROM `$item`");
        $GLOBALS['mysqli']->query("ALTER TABLE `$item` AUTO_INCREMENT = 1");
    }

    kelasSeeder();
    siswaSeeder();
    laundrySeeder();

    echo "seeding sukses!";
} catch (\Throwable $th) {
    throw $th;
}
