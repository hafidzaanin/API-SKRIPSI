<?php
require_once 'connect.php';

$type = $_GET['item_type']; // memeriksa data yang dikirim melalui GET

if ($type == 'users') { // jika $_GET['item_type'] yaitu tb_user, maka akan menjalankan kode dibawahnya

    $query = "SELECT * FROM tb_user";
    $result = mysqli_query($conn, $query);

    $response = array();

    while( $row = mysqli_fetch_assoc($result) ){ // perulangan dari fetching asosiativ

        array_push($response,
        array(
            'id'=>$row['id_pelanggan'], 
            'name'=>$row['nama_pelanggan'], 
            'nik'=>$row['nik'],
            'username'=>$row['username'],
            'alamat'=>$row['alamat'],
            'id_kelurahan'=>$row['id_kelurahan'],
            'id_kecamatan'=>$row['id_kecamatan'],
            'no_telp'=>$row['no_telp']) 
        );
    }

    echo json_encode($response);  // enchoding kedalam JSON dari array
}

mysqli_close($conn); // menutup koneksi mysql
?>