<?php
	include "connect.php";
?>

<!DOCTYPE html>
<html>
<head>
	<title>Student's Record</title>
</head>
<body>
	<form action="st_records.php" method="post">
		<table align="center">
			<th colspan="2">Search Student</th>
			<tr>
				<td>
					Roll No
				</td>
				<td>
					<input type="text" name="RollNo" required>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="Search">
				</td>
			</tr>
		</table>
	</form>
	<?php
		
		if (isset($_GET["Message"])) {
			$msg = $_GET["Message"];
			unset($_GET["Message"]);
			$r = "<br><div align = center><h3>".$msg."</h3></div>";
			echo $r;
		}

		if (isset($_POST["RollNo"])) {
			$roll = $_POST["RollNo"];
			$qry1 = "SELECT * FROM student WHERE roll_no = '".$roll."'";
			$res1 = $con->query($qry1);
			$result1 = "";
			if ($res1->num_rows>0) {
				$result1 .= "<table align='center' border=1px>";
				$result1 .= "<th>Roll No</th><th>Name</th><th>Father's Name</th><th>Gender</th><th>Contact No</th><th>Address</th>";
				while ($row = $res1->fetch_assoc()) 
				{
					//one row
					$result1 .= "<tr>
									<td>
										".$row['roll_no']."
									</td>
									<td>
										".$row['st_name']."
									</td>
									<td>
										".$row['f_name']."
									</td>
									<td>
										".$row['gender']."
									</td>
									<td>
										".$row['contact']."
									</td>
									<td>
										".$row['address']."
									</td>
								</tr>";
				}
				$result1 .= "</table>";
			}
			echo $result1;

			$qry2 = "SELECT courses.course_id, courses.course_name, courses.credits
						FROM courses INNER JOIN enrollment ON enrollment.course_id = courses.course_id
						WHERE enrollment.roll_no = '".$roll."'";
			$res2 = $con->query($qry2);
			$result2 = "<hr><div align=center><h2>Registered Courses</h2></div>";

			if ($res2->num_rows>0) {
				$result2 .= "<table align='center' border = 1px>";
				$result2 .= "<th>Code</th><th>Course Name</th><th>Credits</th>";
				while ($row = $res2->fetch_assoc()) 
				{
					$result2 .= "<tr>
									<td>
										".$row['course_id']."
									</td>
									<td>
										".$row['course_name']."
									</td>
									<td>
										".$row['credits']."
									</td>
								</tr>";
				}
				$result2 .= "</table>";
			}
			echo $result2;

			$qry3 = "SELECT * FROM courses";
			$res3 = $con->query($qry3);
			$result3 = "<hr><div align=center><h2>Available Courses</h2></div>";

			if ($res3->num_rows>0) {
				$result3 .= "<table align='center' border = 1px>";
				$result3 .= "<th>Code</th><th>Course Name</th><th>Credits</th><th></th>";
				while ($row = $res3->fetch_assoc()) 
				{
					$result3 .= "<tr>
									<td>
										".$row['course_id']."
									</td>
									<td>
										".$row['course_name']."
									</td>
									<td>
										".$row['credits']."
									</td>
									<td>
										<a href=reg.php?id=$roll&code=".$row['course_id']."><input type=button value=Register></a>
									</td>
								</tr>";
				}
				$result3 .= "</table>";
			}
			echo $result3;

		}
	?>
</body>
</html>