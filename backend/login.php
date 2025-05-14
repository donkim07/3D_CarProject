<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods,Authorization,X-Requested-With');

include_once 'db_config.php';

// Get posted data
$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if(isset($data->email) && isset($data->password)) {
        $email = $data->email;
        $password = $data->password;
        
        $stmt = $pdo->prepare("SELECT * FROM students WHERE email = ? AND password = ?");
        $stmt->execute([$email, $password]);
        $user = $stmt->fetch();
        
        if($user) {
            echo json_encode([
                'success' => true,
                'id' => $user['id'],
                'name' => $user['name'],
                'email' => $user['email']
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'error' => 'Invalid credentials'
            ]);
        }
    } else {
        echo json_encode([
            'success' => false,
            'error' => 'Missing required fields'
        ]);
    }
}
