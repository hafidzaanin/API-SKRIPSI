<?php
require_once 'connect.php';

    $sql = "SELECT * FROM tb_jadwal LEFT JOIN tb_petugas ON tb_jadwal.id_petugas=tb_petugas.id_petugas 
    LEFT Join tb_kendaraan ON tb_jadwal.id_kendaraan=tb_kendaraan.id_kendaraan
    LEFT Join tb_jalur ON tb_jadwal.id_jalur=tb_jalur.id_jalur
    ORDER BY awal_kerja DESC ";
    //WHERE awal_kerja >= DATE(NOW())
    
    $query = mysqli_query($conn, $sql);
    while( $row = mysqli_fetch_array($query) ){ 
        $result[] = array(    
            'id'=>$row['id_jadwal'], 
            'waktu'=>$row['awal_kerja'], 
            //'jam' => date('h:i:s', $row['awal_kerja']),
            //'tanggal' => date('yyyy:mm:dd', $row['awal_kerja']),
            'kendaraan'=>$row['kendaraan'],          
            'keterangan'=>$row['keterangan']
        );
    }

    $json = array (
        'status' => 'true',
        'result' => $result
    );

    echo json_encode($json);  


mysqli_close($conn);
?>