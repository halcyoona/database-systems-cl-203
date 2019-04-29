<?php
    include "connect.php";

    $num = $_POST["user_phone"];
    $pass = $_POST["user_pass"];
    
    $qry = "SELECT * FROM users WHERE phone='".$num."'";
    //echo $qry;
    $res = $con->query($qry);
    $msg = "";
    if($res->num_rows > 0)
    {
        //user exists
        $row = $res->fetch_assoc();
        if($row["pass"] == $pass)
        {
            session_start();
            $_SESSION["num"] = $num;
            header("Location:home.php");
        }
        else
        {            
            $msg = "Invalid password".$pass;
            header("Location:login.php?Message=$msg");
        }
    }
    else
    {
        $msg = "The Username: ".$num." does not exist!";
        header("Location:login.php?Message=$msg");
    }
?>