<?php

require 'ConnectionSettings.php';

$userID = $_POST["userID"];
$moneyToAdd = $_POST["moneyToAdd"];

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT money FROM users WHERE id = '" . $userID . "'";

$result = $conn->query($sql);

if($result->num_rows > 0)
{
    $sql2 = "UPDATE `users` SET `money`= money + '" . $moneyToAdd . "' WHERE `id` = '" . $userID . "'";
    $conn->query($sql2);
    while ($row = $result->fetch_assoc()) {
        echo $row["money"];
    }
}
else
{
    echo "0";
}

$conn->close();
?>