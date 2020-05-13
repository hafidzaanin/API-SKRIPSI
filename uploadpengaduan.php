<?php 
	
	//Constants for database connection
	define('DB_HOST','localhost');
	define('DB_USER','root');
	define('DB_PASS','');
	define('DB_NAME','skripsweet');
 
	//We will upload files to this folder
	//So one thing don't forget, also create a folder named uploads inside your project folder i.e. MyApi folder
	define('UPLOAD_PATH', 'uploads/');
	
	//connecting to database 
	$conn = new mysqli(DB_HOST,DB_USER,DB_PASS,DB_NAME) or die('Unable to connect');
	
 	$latitude = $_POST['latitude'];
 	$longitude = $_POST['longitude'];
 	$keterangan = $_POST['keterangan'];
	//An array to display the response
	$response = array();
				
				//first confirming that we have the image and tags in the request parameter
				if(isset($_FILES['pic']['name'])){
					
					//uploading file and storing it to database as well 
					try{
						move_uploaded_file($_FILES['pic']['tmp_name'], UPLOAD_PATH . $_FILES['pic']['name']);
						$stmt = $conn->prepare("INSERT INTO tb_pengaduan (id_pelanggan, id_petugas, latitude, longitude, ket_pengaduan, gambar) VALUES ('101','101','$latitude','$longitude','$keterangan','".$_FILES['pic']['name']."')");
						if($stmt->execute()){
							$response['error'] = false;
							$response['message'] = 'File uploaded successfully';
						}else{
							throw new Exception("Could not upload file");
						}
					}catch(Exception $e){
						$response['error'] = true;
						$response['message'] = 'Could not upload file';
					}
					
				}else{
					$response['error'] = true;
					$response['message'] = "Required params not available";
				}
		
	
	//displaying the response in json 
	header('Content-Type: application/json');
	echo json_encode($response);