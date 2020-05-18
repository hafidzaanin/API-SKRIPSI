<?php
require_once 'connect.php';

$type = $_GET['item_type']; 

if ($type == 'tagihan') { 

    $query = "SELECT * FROM tb_bayarbulanan 
	LEFT JOIN tb_pengajuanbulanan ON tb_bayarbulanan.id_pengajuanbulanan=tb_pengajuanbulanan.id_pengajuanbulanan
    LEFT Join tb_user ON tb_pengajuanbulanan.id_pelanggan=tb_user.id_pelanggan";
    $result = mysqli_query($conn, $query);

    $response = array();

    while( $row = mysqli_fetch_assoc($result) ){ 

        array_push($response,
        array(
            'id'=>$row['id_pelanggan'], 
            'name'=>$row['nama_pelanggan'], 
            'nik'=>$row['nik'],
            'alamat'=>$row['alamat'],
            'no_telp'=>$row['no_telp']) 
        );
    }

    echo json_encode($response); 
}

mysqli_close($conn); 
?>