<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods,Authorization,X-Requested-With');

include_once 'db_config.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    try {
        $stmt = $pdo->query("SELECT * FROM models");
        $models = $stmt->fetchAll();
        
        echo json_encode([
            'success' => true,
            'models' => array_map(function($model) {
                return [
                    'id' => $model['id'],
                    'name' => $model['name'],
                    'file_path' => 'assets/models/' . $model['name'],
                    'description' => $model['description']
                ];
            }, $models)
        ]);
    } catch(PDOException $e) {
        echo json_encode([
            'success' => false,
            'error' => $e->getMessage()
        ]);
    }
}
