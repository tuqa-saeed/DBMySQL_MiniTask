<?php
/* session_start();
include 'connectionDB.php';

$stmt = $pdo->query("SELECT * FROM students WHERE deleted_at IS NULL");

echo "<table border='1'><tr><th>Name</th><th>Email</th><th>Major</th><th>Actions</th></tr>";

while ($row = $stmt->fetch()) {
    echo "<tr>
            <td>" . htmlspecialchars($row['first_name']) . " " . htmlspecialchars($row['last_name']) . "</td>
            <td>" . htmlspecialchars($row['email']) . "</td>
            <td>" . htmlspecialchars($row['major']) . "</td>
            <td>
                <a href='update_student.php?student_id=" . urlencode($row['student_id']) . "'>Update</a> | 
                <a href='delete_student.php?student_id=" . urlencode($row['student_id']) . "' onclick='return confirm(\"Are you sure?\")'>Delete</a>
            </td>
          </tr>";
}
echo "</table>";  */
?>
