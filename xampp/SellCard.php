<?php

require 'ConnectionSettings.php';

//user variables
$cardID = $_POST["cardID"];
$userID = $_POST["userID"];
$ID = $_POST["ID"];

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT price FROM cards WHERE id = '" . $cardID . "'";

$result = $conn->query($sql);

if($result->num_rows > 0)
{
    $cardPrice = $result->fetch_assoc()["price"];

    $sql2 = "DELETE FROM userscards WHERE id = '" . $ID . "'";

    $result2 = $conn->query($sql2);
    if($result2)
    {
        $sql3 = "UPDATE `users` SET `money`= money + '" . $cardPrice . "' WHERE `id` = '" . $userID . "'";
        $conn->query($sql3);
    }
    else
    {
        echo "error: could not delete card";
    }
}
else
{
    echo "0";
}
$conn->close();
?>