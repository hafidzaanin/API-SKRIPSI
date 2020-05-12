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
    $idjalur = $_POST['id_jalur'];

    $query = "INSERT INTO tb_pengajuan SET
               latitude = '".$lat."', longitude = '".$long."', id_jalur = '".$idjalur."'";
        
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