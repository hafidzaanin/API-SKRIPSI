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
    $password = $_POST['password'];

    $query = "SELECT * FROM tb_user
              WHERE nik = '".$nik."' AND password = '".$password."'";
        
    $result = mysqli_query($conn, $query);
    //cek user
    if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
    
        $response = array("error"=> false, "message" => "Login Berhasil", "User" =>  array("Id" => $row['id_pelanggan'],
                    "Nik" => $row['nik'], 
                    "Nama" => $row['nama_pelanggan'],
                    "Id Jenis" => $row['id_jenisPelanggan'],
                    "No Telp" => $row['no_telp'],
                    "Id Jalur" => $row['id_jalur'],
                    "Kecamatan" => $row['kecamatan'],
                    "Kelurahan" => $row['kelurahan'])
        );
      }   
    
    echo json_encode($response); 
        }
        
        else {
            echo json_encode(array("error"=>true, "message" => "Data username tidak terdaftar atau password salah"));
            }
        }
        else {
      echo json_encode(array("error"=>true, "message" => "request tidak valid"));
    }
$conn->close();
?>