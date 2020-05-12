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
    $lat = $_POST['latitude'];
    $long = $_POST['longitude'];
    $gambar = $_POST['gambar'];
    $ket = $_POST['ket_pengaduan'];

    $query = "INSERT INTO tb_pengaduan SET
               latitude = '".$lat."', longitude = '".$long."', gambar = '".$gambar."', ket_pengaduan = '".$ket."'";
        
    $result = mysqli_query($conn, $query);
    //cek user
    if ($result != 0) {
        echo json_encode( array("error"=> false, "message" => "Pengajuan Berhasil"));
    }
    else {
        echo json_encode(array("error"=>true, "message" => "Pengajuan Gagal"));
    }
}
$conn->close();
?>