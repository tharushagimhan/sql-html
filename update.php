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
    if(isset($_GET['id'])){
        $id= $_GET['id'];
    

    $sql = "SELECT * FROM `student` WHERE `stuID`='$id'";
    $result = mysqli_query($conn, $sql);
   
    if(!$result){
        die("query Failed". mysqli_error());
    }
    else{
        $row= mysqli_fetch_assoc($result);
    }
 }
?>
<html>
    <head>
    <title>update</title>
    <link rel="stylesheet" href="style.css">
    <div class="heading">
    <h1>Update Student</h1>
    </div>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin:0;
            background-color: #fff;
            text-align: center;
            width:100%;
            position:relative;
        }

        form {
            background-color: white;
            padding: 40px;
            width:60%;
            margin:auto;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="number"], input[type="date"] {
            width: 80%;
            padding: 10px;
            margin: 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    </head>
    <?php
        if(isset($_POST['update_student'])){
            if(isset($_GET['id_new'])){
                $idnew=$_GET['id_new'];
            }
            $stuname=$_POST['stuname'];
            $Bdate=$_POST['Bdate'];
            $email=$_POST['email'];
            $modulecode=$_POST['modulecode'];
            $diplomaID=$_POST['diplomaID'];

            $sql = " UPDATE 'student' set 'stuname'='$stuname','Bdate'='$Bdate','email'='$email','diplomaID'='$diplomaID','modulecode'='$modulecode' WHERE 'stuID'='$idnew'";

            $result = mysqli_query($conn, $sql);
   
            if(!$result){
                die("query Failed". mysqli_error());
            }

            else{
                header('location:insert.php?update_msg=You have successfully updated');
            }
        }
    ?>
    <form action="update.php? id_new=<?php echo $id; ?>"method="post">
        <label for="StudentName">StudentName:</label><br>
        <input type="text" name="stuname" value="<?php echo $row['stuname'] ?>"><br>

        <label for="dob">BirthDay:</label><br>
        <input type="date"name="Bdate" value="<?php echo $row['Bdate'] ?>"><br>

 
        <label for="Email">Email:</label><br>
        <input type="text" name="email" value="<?php echo $row['email'] ?>"><br>

 
        <label for="ModuleCode">ModuleCode:</label><br>
        <input type="text" name="modulecode" value="<?php echo $row['modulecode'] ?>"><br>

        <label for="DiplomaID">DiplomaID:</label><br>
        <input type="text" name="diplomaID" value="<?php echo $row['diplomaID'] ?>"><br>

        <input type="submit" value="UPGRADE" name="upgrade_student">
    </form>
    </html>