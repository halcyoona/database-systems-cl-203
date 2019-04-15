<?php 


	include "connect.php";
 


$cCode = $_POST["c_code"];
$cName = $_POST["c_name"];
$cCred = $_POST["c_cred"]

$qry  = "INSERT INTO courses(course_id, course_name, credits)values('".$cCode."','".$cName."','".$cCred."')";

if ($con->query($qry)) {
	$msg = "New course Enter";
}
else
{
	$msg = "Error!";
}
	echo $msg;
 ?>