<?php
// Database connection
$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "module_system";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$id = $_GET["id"];
$sql = "DELETE FROM `student` WHERE stuID = $id";
$result = mysqli_query($conn, $sql);

if ($result) {
  header("Location: student2.php?msg=Data deleted successfully");
} else {
  echo "Failed: " . mysqli_error($conn);
}