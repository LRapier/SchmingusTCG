<?php

require 'ConnectionSettings.php';

//user variables
$loginUser = $_POST["loginUser"];
$loginPass = $_POST["loginPass"];

// Check connection
if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT username FROM users WHERE username = '" . $loginUser . "'";

$result = $conn->query($sql);

if ($result->num_rows > 0) 
{
    echo "Username taken.";
} 
else 
{
    echo "Creating User...";
    //Insert user and pass into DB
    $sql2 = "INSERT INTO users (username, password, money) VALUES ('" . $loginUser . "' , '" . $loginPass . "', 0)";
    if ($conn->query($sql2) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    
}

$conn->close();
?>
