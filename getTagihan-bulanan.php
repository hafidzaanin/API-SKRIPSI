<?php
require_once 'connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nik = $_POST['nik'];

    $sql = "SELECT * FROM tb_bayarbulanan 
	LEFT JOIN tb_pengajuanbulanan ON tb_bayarbulanan.id_pengajuanbulanan=tb_pengajuanbulanan.id_pengajuanbulanan
    LEFT Join tb_user ON tb_pengajuanbulanan.id_pelanggan=tb_user.id_pelanggan
    WHERE tb_bayarbulanan.status_bayar='Belum Bayar' AND tb_user.nik=$nik";
    
    
    $query = mysqli_query($conn, $sql);
    while( $row = mysqli_fetch_array($query) ){ 
        $result[] = array(
            'id'=>$row['id_bayar'],               
            'total'=>$row['total'],
            'totalpembayaran'=>$row['totalpembayaran']
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