<?php 
	include "connect.php";
 ?>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<div align="center">
		<form action="courses_enter_try.php " align = center method="post">
		  <label>Course Code :</label>
		  <input type="text" name="c_code" ><br>
		  <label>Course Name:</label> 
		  <input type="text" name="c_name" ><br>
		  <label>Credits   :</label>
		  <input type="text" name="c_cred" ><br><br>
		  <input type="submit" value="Add">
		</form>
	</div>
</body>
</html>