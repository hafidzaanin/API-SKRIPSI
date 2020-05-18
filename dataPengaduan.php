<?php
require_once 'connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nik = $_POST['nik'];

    $sql = "SELECT * FROM tb_pengaduan 
    LEFT JOIN tb_user ON tb_pengaduan.id_pelanggan=tb_user.id_pelanggan
    WHERE tb_user.nik=$nik";
    
    
    $query = mysqli_query($conn, $sql);
    while( $row = mysqli_fetch_array($query) ){ 
        $result[] = array(
            'id'=>$row['id_pengaduan'],    
            'tanggal'=>$row['tgl_pengaduan'],
            'latitude'=>$row['lati'],
            'longitude'=>$row['longi'],
            'status_pengaduan'=>$row['status'],
            'foto'=>$row['foto'],
            'ket_pengaduan'=>$row['ket_pengaduan']
        );
    }

    $json = array (
        'status' => 'true',
        'result' => $result
    );

    echo json_encode($json);  

}

mysqli_close($conn); 
?>