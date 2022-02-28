<?php

function laundrySeeder()
{
    $dayCount = date('t');

    $sql = 'INSERT INTO `laundry` (id_siswa, berat_kg, tanggal) VALUES';
    $values = [];

    for ($i = 0; $i < $dayCount; $i++) {
        $idSiswa1 = $i % 3 + 1;
        $idSiswa2 = rand(1, 3);
        $beratKg = rand(1, 20);
        $beratKg2 = rand(1, 20);
        $day = $dayCount - 1 - $i;
        $tanggal = date('Y-m-d', strtotime("-$day days"));

        $values[] = "('$idSiswa1', '$beratKg', '$tanggal')";
        $values[] = "('$idSiswa2', '$beratKg2', '$tanggal')";
    }

    $sql .= implode(',', $values);

    $GLOBALS['mysqli']->query($sql);
}
