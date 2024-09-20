<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Establish a database connection (replace with your actual database credentials)
    $servername = "127.0.0.1";
    $username = "root";
    $password = "";
    $dbname = "module_system";
    
    // Create a new mysqli connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Retrieve data from the form
    $StudentName = $_POST["StudentName"];
    $dob = $_POST["dob"];
    $Email = $_POST["Email"];
    $ModuleCode=$_POST["ModuleCode"];
    $DiplomaID=$_POST["DiplomaID"];
 

 
  //  $ModuleCode = $_POST["ModuleCode"];

    // SQL query to insert data into the correct table
    $sql = "INSERT INTO student (stuname, Bdate, email,diplomaID,modulecode) VALUES ('$StudentName', '$dob', '$Email','$DiplomaID','$ModuleCode')";
    
    // Execute the query and check for success
    if ($conn->query($sql) === TRUE) {
        echo "Record inserted successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    
    // Close the database connection
    $conn->close();
} else {
    // Redirect back to the form if accessed directly
    header("Location: insert.html");
    exit;
}
?>
