<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "skripsi";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

//method post
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nik = $_POST['nik'];
    $nama = $_POST['nama_pelanggan'];
    $notelp = $_POST['no_telp'];
    $idjpelanggan = $_POST['id_jenisPelanggan'];
    $kec = $_POST['kecamatan'];
    $kel = $_POST['kelurahan'];
    $namajalan = $_POST['nama_jalan_rt_rw'];
    $password = $_POST['password'];

    $query = "INSERT INTO tb_user SET
              nik = '".$nik."', nama_pelanggan = '".$nama."', no_telp = '".$notelp."', id_jenisPelanggan = '".$idjpelanggan."',
              kecamatan = '".$kec."', kelurahan = '".$kel."', nama_jalan_rt_rw = '".$namajalan."', password = '".$password."'";
        
    $result = mysqli_query($conn, $query);
    //cek user
    if ($result != 0) {
        echo json_encode( array("error"=> false, "message" => "Register Berhasil"));
    }
    else {
        echo json_encode(array("error"=>true, "message" => "Register Gagal", "nik"=> $nik, "nama_pelanggan"=> $nama, "no_telp"=> $notelp,
        "id_jenisPelanggan"=> $idjpelanggan ));
    }
}
$conn->close();
?>