<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "skripsi";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

function insertUser($tb_user){ 		
	$gambar_ktp=$tb_user["gambar_ktp"];


	$query="
		INSERT INTO ".$this->tb_user." 
		SET gambar_ktp='".$gambar_ktp."'";
	if( mysqli_query($conn, $query)) {
		$messgae = "Insert image Successfully.";
		$status = 1;			
	} else {
		$messgae = "Insert image failed.";
		$status = 0;			
	}
	$response = array(
		'status' => $status,
		'status_message' => $messgae
	);
	header('Content-Type: application/json');
	echo json_encode($empResponse);
}
?>