<?php
$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "module_system";

$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT modulecode,examresults,stuID, moduletitle FROM pastperformance";
$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam results</title>
    <link rel="stylesheet" href="style.css">
    <style>
    body {
       font-family: Arial, sans-serif;
       background-color:#fff;
       width:100%;
       position:relative;
       margin:0px;
    }
        table {
            width: 90%;
            border-collapse: collapse;
            margin-left:70px;
            margin-top:10px;
            color:black;
        }
        table, td,th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
            color:black;
        }
        td,th {
            background-color: #fff;
            color: clack;
        }
    </style>
</head>
<body>
    <div class="heading">
    <h1>Exam results</h1>
    </div>
    <table>
        <tr>
            <th>Student ID</th>
            <th>Module Code</th>
            <th>Module Title</th>
            <th>Exam Results</th>

        </tr>
        <a href="home.html">&laquo;Back</a>
        <?php

        if ($result->num_rows > 0) {

            while($row = $result->fetch_assoc()) {
                echo "<tr>
                        <td>" . $row["stuID"] . "</td>
                        <td>" . $row["modulecode"] . "</td>
                        <td>" . $row["moduletitle"] . "</td>
                        <td>" . $row["examresults"] . "</td>
                    </tr>";
            }
        } else {
            echo "<tr><td colspan='7'>No records found</td></tr>";
        }

        // Close the database connection
        $conn->close();
        ?>
    </table>
</body>
</html>
