<?php
/* session_start();
include 'connectionDB.php';

if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["first_name"], $_POST["last_name"], $_POST["email"], $_POST["date_of_birth"])) {
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $email = $_POST["email"];
    $dob = $_POST["date_of_birth"];
    $gender = $_POST["gender"];
    $major = $_POST["major"];
    $enrollment_year = $_POST["enrollment_year"];

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "<p style='color: red;'>Invalid email format!</p>";
        return;
    }

    if ($enrollment_year < 2000 || $enrollment_year > 2099) {
        echo "<p style='color: red;'>Enrollment year must be between 2000 and 2099!</p>";
        return;
    }

    try {
        $stmt = $pdo->prepare("INSERT INTO students (first_name, last_name, email, date_of_birth, gender, major, enrollment_year) 
                               VALUES (:first_name, :last_name, :email, :dob, :gender, :major, :enrollment_year)");

        $stmt->execute([
            ":first_name" => $first_name,
            ":last_name" => $last_name,
            ":email" => $email,
            ":dob" => $dob,
            ":gender" => $gender,
            ":major" => $major,
            ":enrollment_year" => $enrollment_year
        ]);

        echo "<p style='color: green;'>Student added successfully!</p>";
    } catch (PDOException $e) {
        echo "<p style='color: red;'>Error: " . $e->getMessage() . "</p>";
    }
} */
?>

<!DOCTYPE html>

<body>
    
</body>
</html>
