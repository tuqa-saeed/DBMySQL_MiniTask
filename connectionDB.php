<?php
/* $servername = "localhost";  
$username = "root";     
$password = "";     
$dbname = "dbdesign";  

$conn = new mysqli($servername, $username,$password  ,$dbname);

if(!$conn){
    die("Connection failed: " . mysqli_connect_error());
} */

/* if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully"; */
?>
<?php
$host = "localhost"; 
$dbname = "dbdesign"; 
$username = "root"; 
$password = ""; 

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>

<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $email = $_POST["email"];
    $dob = $_POST["date_of_birth"];
    $gender = $_POST["gender"];
    $major = $_POST["major"];
    $enrollment_year = $_POST["enrollment_year"];

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
}
?>

<?php
$stmt = $pdo->query("SELECT * FROM students WHERE deleted_at IS NULL");
echo "<table><tr><th>Name</th><th>Email</th><th>Major</th><th>Actions</th></tr>";
while ($row = $stmt->fetch()) {
    echo "<tr>
            <td>" . $row['first_name'] . " " . $row['last_name'] . "</td>
            <td>" . $row['email'] . "</td>
            <td>" . $row['major'] . "</td>
            <td><a href='update_student.php?id=" . $row['id'] . "'>Update</a> | 
                <a href='delete_student.php?id=" . $row['id'] . "' onclick='return confirm(\"Are you sure?\")'>Delete</a></td>
          </tr>";
}
echo "</table>";
?>
<?php
$pdo = new PDO("mysql:host=localhost;dbname=dbdesign", "root", "");
$stmt = $pdo->prepare("UPDATE students SET deleted_at = NOW() WHERE id = ?");
$stmt->execute([$_GET['id']]);
echo "Student marked as deleted!";
?>
<?php
$pdo = new PDO("mysql:host=localhost;dbname=dbdesign", "root", "");
$stmt = $pdo->prepare("SELECT * FROM students WHERE id = ?");
$stmt->execute([$_GET['id']]);
$student = $stmt->fetch();
?>
<form action="update_student.php" method="POST">
    <input type="hidden" name="id" value="<?php echo $student['id']; ?>">
    <input type="text" name="first_name" value="<?php echo $student['first_name']; ?>" required>
    <input type="text" name="last_name" value="<?php echo $student['last_name']; ?>" required>
    <input type="email" name="email" value="<?php echo $student['email']; ?>" required>
    <input type="text" name="major" value="<?php echo $student['major']; ?>" required>
    <input type="submit" value="Update">
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $pdo = new PDO("mysql:host=localhost;dbname=dbdesign", "root", "");
    $id = $_POST["id"];
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $email = $_POST["email"];
    $major = $_POST["major"];
    
    $stmt = $pdo->prepare("UPDATE students SET first_name = ?, last_name = ?, email = ?, major = ?, updated_at = NOW() WHERE id = ?");
    $stmt->execute([$first_name, $last_name, $email, $major, $id]);
    echo "Student updated successfully!";
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
</head>
<body>
    <h2 style="background-color:orange">insert student information and save it in student table</h2>
    <form method="post" action="">
        <label>First Name:</label>
        <input type="text" name="first_name" placeholder="First Name" required><br><br>

        <label>Last Name:</label>
        <input type="text" name="last_name" placeholder="Last Name" required><br><br>

        <label>Email:</label>
        <input type="email" name="email"  placeholder="email" required><br><br>

        <label>Date of Birth:</label>
        <input type="date" name="date_of_birth" placeholder="Date of Birth"  required><br><br>

        <label>Gender:</label>
        <select name="gender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select><br><br>

        <label>Major:</label>
        <input type="text" name="major" placeholder="major"><br><br>

        <label>Enrollment Year:</label>
        <input type="number" name="enrollment_year" required min="2000" max="2099"><br><br>

        <button type="submit" 
    style="background-color:orange; color: white; border: none; padding: 10px 20px; 
    font-size: 16px; font-weight: bold; border-radius: 8px; cursor: pointer; 
    transition: background-color 0.3s, transform 0.2s;"
    onmouseover="this.style.backgroundColor='#orange'; this.style.transform='scale(1.05)';" 
    onmouseout="this.style.backgroundColor='#white'; this.style.transform='scale(1)';"
    onmousedown="this.style.backgroundColor='#black'; this.style.transform='scale(0.95)';"
    onmouseup="this.style.backgroundColor='#orange'; this.style.transform='scale(1.05)';">
    Submitt 
</button>
    </form>
</body> 
</html> 