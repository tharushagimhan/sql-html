<?php
$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "module_system";

$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>delete</title>
    <link rel="stylesheet" href="style.css">
    <style>
    body {
       font-family: Arial, sans-serif;
       background-color: #fff;
       width:100%;
       position:relative;
       margin:0px;
    }
        table {
            width: 70%;
            border-collapse: collapse;
            margin:auto;
            margin-top:40px;
            color:black;
        }
        table, td,th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
            color:black;
        }
        td,th {
            background-color: white;
            color: black;
        }
        .button {
         background-color: #007BFF;
         color: black;
          border: none;
          font-size: 18px;
        margin-left: 40px;
        cursor: pointer;
        border-radius: 5px;
        width: 200px;
        height:100px;
    }
    .btnprimary{
        background-color:red;
        border:none;
        color:black;
        padding:5px;
        font-size: 15px;
    }
    </style>
</head>
<div class="heading">
    <h1>Delete Details</h1>
    </div>
<body>

    <table>
    <thead>
      <tr>
      <th>Student Name</th>
            <th>Student ID</th>
            <th>Birth Day</th>
            <th>Email</th>
            <th>Diploma ID</th>
            <th>Module Code</th>
            <th>Action</th>

     </tr>
    </thead>
<tbody>
<a href="home.html">&laquo;Back</a>
    <?php
$sql = "SELECT stuname,Bdate,email,diplomaID,modulecode,stuID FROM student";
$result = mysqli_query($conn, $sql);
if(!$result){
    die('query Failed'.mysqli_error());
}
else{
   while($row=mysqli_fetch_assoc($result)){
    ?>
         <tr>
            <td><?php echo $row['stuID']; ?></td>
            <td><?php echo $row['stuname']; ?></td>
            <td><?php echo $row['Bdate']; ?></td>
            <td><?php echo $row['email']; ?></td>
            <td><?php echo $row['diplomaID']; ?></td>
            <td><?php echo $row['modulecode']; ?></td>
            <td><a href="delete.php?id=<?php echo $row['stuID']; ?>" class="btnprimary">Delete</a></td>


        </tr>
    <?php
   }
}
?>