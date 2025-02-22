<?php
session_start();
include 'connectionDB.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST["id"];  // استخدام $_POST['id'] من النموذج

    // باقي الحقول التي تريد تحديثها
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $email = $_POST["email"];
    $major = $_POST["major"];

    try {
        // تحديث بيانات الطالب
        $stmt = $pdo->prepare("UPDATE students SET first_name = ?, last_name = ?, email = ?, major = ?, updated_at = NOW() WHERE id = ?");
        $stmt->execute([$first_name, $last_name, $email, $major, $id]);

        echo "<p style='color: green;'>Student updated successfully!</p>";
        header("Location: students_list.php"); 
        exit;
    } catch (PDOException $e) {
        echo "<p style='color: red;'>Error: " . $e->getMessage() . "</p>";
    }
} else {
    if (isset($_GET['id'])) {
        $stmt = $pdo->prepare("SELECT * FROM students WHERE id = ?");
        $stmt->execute([$_GET['id']]);
        $student = $stmt->fetch();
    } else {
        echo "Student ID not found!";
        exit;
    }
}

?>

/*<!DOCTYPE html>
<html lang="en">
<!-- <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student</title>
</head>
<body>
   
</body>
</html>

