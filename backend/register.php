<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods,Authorization,X-Requested-With');

include_once 'db_config.php';

// Get posted data
$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if(isset($data->name) && isset($data->email) && isset($data->password)) {
        $name = $data->name;
        $email = $data->email;
        $password = $data->password;
        
        try {
            $stmt = $pdo->prepare("INSERT INTO students (name, email, password) VALUES (?, ?, ?)");
            $stmt->execute([$name, $email, $password]);
            $id = $pdo->lastInsertId();
            
            echo json_encode([
                'success' => true,
                'id' => $id,
                'name' => $name,
                'email' => $email
            ]);
        } catch(PDOException $e) {
            echo json_encode([
                'success' => false,
                'error' => $e->getMessage()
            ]);
        }
    } else {
        echo json_encode([
            'success' => false,
            'error' => 'Missing required fields'
        ]);
    }
}
