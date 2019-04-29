<?php
    include 'connect.php';
    session_start();
    if (!isset($_SESSION["num"])) {
        header("Location:login.php");
    }
?>
<html>
<head>
	<title>Home</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bclr{
            background: #EEEEEE;
        }
    </style>
</head>
<style type="text/css">
    img {
        border: 2px solid;
        padding: 15px;
        width: 200px;
        height: 150px;
    }
    img:hover{
        height: 400px;
        width: 600px;
    }
</style>
<body class="bclr">
	<form action="upload.php" method="post" enctype="multipart/form-data">
        <div class="page-header mb-5" align="center">
            <h2>Welcome Home</h2>
        </div>
        <div class="form-group row">
            <div class="col-sm-10"></div>
                <input type="submit" name="logout" class="btn btn-primary col-sm-2" align="rights" value="Logout">
        </div>
        <br>
        <div class="form-group row">
            <div class="col-sm-4"></div>
            <input type="file" name="fileToUpload" class="form-control col-sm-4" >
            <div class="col-sm-4"></div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-4"></div>
            <input type="submit" value="Upload Image" class="btn btn-primary col-sm-4" name="submit">
            <div class="col-sm-4"></div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-4"></div>
            <?php

                if (isset($_GET["Message"])) {
                    echo "<div class='col-sm-4 alert alert-danger' align='center'>";
                    echo $_GET["Message"];
                    echo "</div>";
                }
            ?>
            
            </div>
            <div class="col-sm-4"></div>
        </div>
        
	</form>
    <br>
    <?php
        $num = $_SESSION["num"];
        $qry = "SELECT * FROM pic WHERE phone='".$num."'";
        if ($res=$con->query($qry)) {
            while ($row = $res->fetch_assoc()) 
            {
                $photo = $row["img"];
                // echo $photo;
                echo "<img src='uploads/".$photo."'>";
            }
        }
    ?>
</body>
</html>

