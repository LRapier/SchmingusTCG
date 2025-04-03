<?php

require 'ConnectionSettings.php';

$userID = $_POST["userID"];

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id, cardid, edition FROM userscards WHERE userid = '" . $userID . "'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    $rows = array();
    while ($row = $result->fetch_assoc()) {
        $rows[] = $row;
    }
    echo json_encode($rows);
} else {
    echo "0 results";
}

$conn->close();
?>
