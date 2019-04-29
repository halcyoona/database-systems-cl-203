<html>
<head>
	<title>Register</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bclr{
            background: #EEEEEE;
        }
    </style>
</head>
<body class="bclr">
	<form action="register_try.php" method="post">
        <div class="page-header mb-5" align="center">
            <h2>Register</h2>
        </div>
        <div class="form-group row">
            <div class="col-sm-4"></div>
            <input type="text" name="first_name" class="form-control col-sm-4" placeholder="First Name" required>
            <div class="col-sm-4"></div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-4"></div>
                <input type="text" name="last_name" class="form-control col-sm-4" placeholder="Last Name" required>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group row">
            <div class="col-sm-4"></div>
                <input type="date" name="date" class="form-control col-sm-4"  required>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group row">
            <div class="col-sm-4"></div>
                <input type="text" name="phone" class="form-control col-sm-4" placeholder="Phone Number" required>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group row">
            <div class="col-sm-4"></div>
                <input type="email" name="email" class="form-control col-sm-4" placeholder="Email" required>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group row">
            <div class="col-sm-4"></div>
                <input type="password" name="user_pass" class="form-control col-sm-4" placeholder="Password" required>
            <div class="col-sm-4"></div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-4"></div>
            <input type="submit" value="Register" class="btn btn-primary col-sm-4">
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
</body>
</html>