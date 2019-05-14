<?php
    include 'connect.php';
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
        
        
	</form>
    <br>
    <?php
        $name = 'mehmood';
        $pass = '123456';
        $email= '';
        $qry = "CALL update_password('".$name."', '".$pass."',".$email."')";
        if ($con->query($qry)) 
            echo "Password Updated. Email is :".$email;
        else
            echo "Error"
    ?>
</body>
</html>

