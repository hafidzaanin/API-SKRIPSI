<?php
require_once 'connect.php';


    $sql = "SELECT * FROM tb_jalur";
    
    
    $query = mysqli_query($conn, $sql);
    while( $row = mysqli_fetch_array($query) ){ 
        $result[] = array(
            'id'=>$row['id_jalur'],    
            'jalur'=>$row['jalur'],
            'ket_jalur'=>$row['keterangan']
        );
    }

    $json = array (
        'status' => 'true',
        'result' => $result
    );

    echo json_encode($json);  


mysqli_close($conn); 
?>