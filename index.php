<?php
    require 'db.php';
    require './vendor/autoload.php';

    $defaultDate = \Carbon\Carbon::now();
    $tahun = $_GET['tahun'] ?? $defaultDate->year;
    $bulan = $_GET['bulan'] ?? $defaultDate->month;
    $minggu = $_GET['minggu'] ?? $defaultDate->weekNumberInMonth;

    if (!empty($_GET['tahun']) && !empty($_GET['bulan']) && !empty($_GET['minggu'])) {
        $date = \Carbon\Carbon::parse("$tahun-$bulan-01");

        $tempDate = $date->copy()->firstOfMonth();

        $tempDate = $tempDate->addWeeks($minggu - 1);

        $date = $tempDate;
    } else {
        $date = $defaultDate;
    }

    $weekStarts = $date->copy()->startOfWeek();
    $weekEnds = $date->copy()->endOfWeek();

    $curYear = $date->year;
    $curMonth = $date->month;
    $curWeek = $date->weekNumberInMonth;

    $stmt = $mysqli->prepare('SELECT `siswa`.`nama` as `nama`, berat_kg, DAYNAME(`tanggal`) as `hari` FROM `laundry` INNER JOIN `siswa` ON `siswa`.`id`=`laundry`.`id_siswa` WHERE `tanggal` BETWEEN ? AND ?');
    $stmt->bind_param('ss', $weekStarts, $weekEnds);
    $stmt->execute();
    $stmt->bind_result($siswa, $totalBerat, $hari);

    $data = [];
    while ($stmt->fetch()) {
        $data[] = [
            'siswa' => $siswa,
            'berat' => $totalBerat,
            'hari' => $hari,
        ];
    }

    if (count($data) > 0) {

        foreach ($data as $item) {
            $laundries[$item['hari']][] = $item['siswa'];
        }

        /**
         * Convert array agar baris bisa ditampilkan dalam bentuk tabel
         * 
         * dari
         * [
         *     "senin" => [1, 2, 3, 4],
         *     "selasa" => [5, 6]
         * ]
         * 
         * jadi
         * [
         *     [1, 5],
         *     [2, 6],
         *     [3],
         *     [4]
         * ]
         */
        $largestSize = 0;
        foreach ($laundries as $key => $value) {
            if ($largestSize < count($value)) {
                $largestSize = count($value);
            }
        }

        for ($i = 0; $i < $largestSize; $i++) {
            foreach ($laundries as $key => $value) {
                $rows[$i][] = $laundries[$key][$i] ?? null;
            }
        }
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jadwal Minggu 1</title>
    <style>
        table {
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid;
            padding: .25em;
        }
    </style>
</head>

<body>
    <form>
        <label for="tahun">Tahun</label>
        <input type="text" id="tahun" name="tahun" value="<?= $curYear ?>">
        <label for="bulan">Bulan</label>
        <input type="text" id="bulan" name="bulan" value="<?= $curMonth ?>">
        <label for="minggu">Minggu</label>
        <input type="text" id="minggu" name="minggu" value="<?= $curWeek ?>">
        <button>Submit</button>
    </form>

    <?php if (count($data) > 0) : ?>
        <table>
            <thead>
                <tr>
                    <?php foreach ($laundries as $hari => $siswa) : ?>
                        <th><?= $hari ?></th>
                    <?php endforeach ?>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($rows as $row) : ?>
                    <tr>
                        <?php foreach ($row as $siswa) : ?>
                            <td><?= $siswa ?></td>
                        <?php endforeach ?>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    <?php else : ?>
        Tidak ada data pada periode ini
    <?php endif ?>
</body>

</html>