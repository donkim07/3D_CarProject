<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods,Authorization,X-Requested-With');

include_once 'db_config.php';

$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if(isset($data->student_id) && isset($data->content)) {
        try {
            $stmt = $pdo->prepare("INSERT INTO feedback (student_id, content) VALUES (?, ?)");
            $stmt->execute([$data->student_id, $data->content]);
            $id = $pdo->lastInsertId();
            
            echo json_encode([
                'success' => true,
                'id' => $id,
                'content' => $data->content
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
