<?php
session_start();
include 'connectionDB.php';

if ($_POST['csrf_token'] !== $_SESSION['csrf_token']) {
    die("Invalid CSRF token");
}

if (isset($_GET['id'])) { 
    $stmt = $pdo->prepare("UPDATE students SET deleted_at = NOW() WHERE id = ?");  
    $stmt->execute([$_GET['id']]);  
    echo "Student marked as deleted!";
} else {
    echo "No student ID specified!";
} 
?>
