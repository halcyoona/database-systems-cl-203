<?php 
	include 'connect.php';
	$roll = $_GET['id'];
	$code = $_GET['code'];
 	$qry = "INSERT INTO enrollment (course_id, roll_no) VALUES ('".$code."','".$roll."')";
 	if ($con->query($qry)) {
 		$msg = "Student Enrolled Successfully";
 		header("Location:st_records.php?Message=".$msg);
 	}
 	else{
 		echo "Error";
 	}
 ?>