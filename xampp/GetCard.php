<?php

require 'ConnectionSettings.php';

// Check connection
if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
}

//user variables
$cardID = $_POST["cardID"];

$sql = "SELECT name, rarity, price, imgVer FROM cards WHERE id = '" . $cardID . "'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    $rows = array();
    while ($row = $result->fetch_assoc()) {
        $rows[] = $row;
    }
    echo json_encode($rows);
} else {
    echo "0";
}
$conn->close();

?>