
<?php
include 'connect.php';
session_start();
if(isset($_POST['logout'])){
    session_destroy();
    header("Location:login.php");
}


if(isset($_POST['submit'])){
	$file = $_FILES["fileToUpload"]['name'];
	$msg;
	$target_dir = "uploads/";
	if (!empty($file)) {
		
		$arr = explode(".", $file);
		$imageFileType = $arr[1];
		$file = $arr[0];
	// Allow certain file formats
		if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
		&& $imageFileType != "gif" ) {
		    $msg = "only JPG, JPEG, PNG & GIF files are allowed.";
		    header("Location:home.php?Message=$msg");
		}
		else {

			$num = $_SESSION["num"];
			$phone = $num;
			$time = time();
			$num .= $time . $file .".". $imageFileType;
			$target_dir .= $num;
			$qry = "INSERT INTO pic (phone, img) VALUES ('".$phone."', '".$num."')";
			if ($con->query($qry)) 
			{
				move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_dir); 
				$msg = "image is uploaded";
			    header("Location:home.php?Message=$msg");
			}
			else
			{
				$msg = "Image is not uploaded";
				header("Location:home.php?Message=$msg");
			}
		}
	}
	else
	{
		$msg = "No File is Selected.";
		header("Location:home.php?Message=$msg");
	}	
}
?>