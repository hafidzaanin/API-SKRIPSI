<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "skripsi2";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

//method post
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nama = $_POST['nama_pelanggan'];
    $nik = $_POST['nik'];
    $email = $_POST['email'];
    $alamat = $_POST['alamat'];
    $kec = $_POST['id_kecamatan'];
    $kel = $_POST['id_kelurahan'];
    $notelp = $_POST['no_telp'];
    $password = $_POST['password'];

    $query = "INSERT INTO tb_user SET
               nama_pelanggan = '".$nama."',nik = '".$nik."', email = '".$email."', alamat = '".$alamat."', 
              id_kecamatan = '".$kec."', id_kelurahan = '".$kel."', no_telp = '".$notelp."', password = '".$password."'";
        
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