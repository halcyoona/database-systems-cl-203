<html>
<head>
	<title>Student Registeration</title>
</head>
<body>
	<form action="register_try.php" method="post">
		<table align="center">
			<th colspan="2">Student's Registeration</th>
			<tr>
				<td>
					Roll No
				</td>
				<td>
					<input type="text" name="txtRollNo" required>
				</td>
			</tr>
			<tr>
				<td>
					Name
				</td>
				<td>
					<input type="text" name="txtName" required>
				</td>
			</tr>
			<tr>
				<td>
					Father's Name
				</td>
				<td>
					<input type="text" name="txtFName" required>
				</td>
			</tr>
			<tr>
				<td>
					Gender
				</td>
				<td>
					<select name="sGender" required>
						<option value="Male">Male</option>
						<option value="Female">Female</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					Contact No.
				</td>
				<td>
					<input type="text" name="txtContact" required>
				</td>
			</tr>
			<tr>
				<td>
					Address
				</td>
				<td>
					<textarea name="txtAddress" required></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="Register">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<?php
						if (isset($_GET["Message"])) {
							echo $_GET["Message"];
						}
					?>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
