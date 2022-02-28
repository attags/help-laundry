<?php

function siswaSeeder()
{
    $siswa = [
        [
            'nama' => 'Andi',
            'id_kelas' => 1,
        ],
        [
            'nama' => 'Budi',
            'id_kelas' => 2,
        ],
        [
            'nama' => 'Siti',
            'id_kelas' => 3,
        ],
    ];

    $sql = 'INSERT INTO `siswa` (nama, id_kelas) VALUES';
    $values = [];

    foreach ($siswa as $item) {
        $nama = $item['nama'];
        $idKelas = $item['id_kelas'];

        $values[] = "('$nama', '$idKelas')";
    }

    $sql .= implode(',', $values);

    $GLOBALS['mysqli']->query($sql);
}
