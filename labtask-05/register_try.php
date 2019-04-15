<?php
	include "connect.php";

	//echo "You are here, you have a quiz?";

	$roll = $_POST["RollNo"];
	$name = $_POST["Name"];
	$fname = $_POST["FName"];
	$gender = $_POST["sGender"];
	$contact = $_POST["Contact"];
	$address = $_POST["Address"];

	$qry = "INSERT INTO student VALUES('".$roll."','".$name."', '".$fname."', '".$gender."', '".$contact."', '".$address."')";

	//echo $qry;
	//$con->query($qry);
    if ($con->query($qry)) {
		$msg = "Student Registered";
	}
	else
		$msg = "Error!";

    // echo $msg;
        
	header("Location:index.html?Message=$msg");
    
?>










