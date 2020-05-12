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
    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "SELECT * FROM tb_petugas
              WHERE username = '".$username."'";
        
    $result = mysqli_query($conn, $query);
    //cek user
    if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        $hashPassword = $row['password'];
        $response = array("error"=> false, "message" => "Login Berhasil", "Data Petugas" =>  array("Id" => $row['id_petugas'],
                    "Nama" => $row['nama'],
                    "No Telp" => $row['no_telepon'], 
                    "Alamat" => $row['alamat'], 
                    "Awal Kerja" => $row['awal_kerja'])
        );
      }
    }
    
    else {
        //echo "0 results";
    }
     //cek password   
        if($hashPassword==$password) {
            $result = mysqli_query($conn, $query);
            //output jika user dan password benar
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