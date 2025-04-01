<?php

require 'ConnectionSettings.php';

// Check connection
if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
}

//user variables
$cardID = $_POST["cardID"];

$path = "http://localhost/SchmingusTCG/Cards/" . $cardID . ".png";

$image = file_get_contents($path);

echo $image;

$conn->close();

?>