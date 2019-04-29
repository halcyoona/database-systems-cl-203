<?php
    include "connect.php";
    $fname = $_POST["first_name"];
    $lname = $_POST["last_name"];
    $dat = $_POST["date"];
    $ph = $_POST["phone"];
    $email = $_POST["email"];
    $pass = $_POST["user_pass"];
    
    $qry = "INSERT INTO users (Fname, Lname, dob, phone, email, pass) VALUES ('".$fname."', '".$lname."','".$dat."', '".$ph."', '".$email."', '".$pass."')";
    echo $qry;
    // $res = $con->query($qry);

    $msg = "";
    if($con->query($qry))
    {
            $msg = "Registered Successfully";
            header("Location:register.php?Message=$msg");
    }
    else
    {
        $msg = "User exists";
        header("Location:register.php?Message=$msg");
    }
?>