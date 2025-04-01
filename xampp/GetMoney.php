<?php

require 'ConnectionSettings.php';

$userID = $_POST["userID"];

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT money FROM user WHERE id = '" . $userID . "'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo $row["money"];
    }
} else {
    echo "0";
}

$conn->close();
?>
