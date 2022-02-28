<?php

function kelasSeeder()
{
    $kelas = [
        '1 A',
        '1 B',
        '1 C',
    ];

    $sql = 'INSERT INTO `kelas` (nama) VALUES';
    $values = [];

    foreach ($kelas as $item) {
        $values[] = "('$item')";
    }

    $sql .= implode(',', $values);

    $GLOBALS['mysqli']->query($sql);
}
