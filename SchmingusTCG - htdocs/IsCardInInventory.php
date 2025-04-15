<?php

require 'ConnectionSettings.php';

// Check connection
if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
}

//user variables
$userID = $_POST["userID"];
$cardID = $_POST["cardID"];
$edition = $_POST["edition"];

$sql = "SELECT id FROM userscards WHERE userid = '" . $userID . "' AND cardid = '" . $cardID . "' AND edition = '" . $edition . "'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "1";
} else {
    echo "0";
}
$conn->close();

?>