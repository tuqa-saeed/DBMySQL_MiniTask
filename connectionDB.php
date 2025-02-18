<?php 
$server = "localhost";
$username = "your_username";
$password = "your_password";
$db = "dbdesign";

$conn = mysqli_connect($server, $username, $password); 

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$select_db = mysqli_select_db($conn, $db); 

if (!$select_db) {
    die "Error selecting database: " . mysqli_error($conn);
}
echo "Database selected successfully";
?>