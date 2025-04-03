<?php

require 'ConnectionSettings.php';

//user variables
$ID = $_POST["ID"];
$cardID = $_POST["cardID"];
$userID = $_POST["userID"];

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT price FROM cards WHERE id = '" . $cardID . "'";

$result = $conn->query($sql);

if($result->num_rows > 0)
{
    $cardPrice = $result->fetch_assoc()["price"];

    $sql2 = "SELECT edition FROM userscards WHERE id = '" . $ID . "'";
    $result2 = $conn->query($sql2);
    if($result2)
    {
        if($result->fetch_assoc()["edition"] == "holo")
            $cardPrice = (int)$cardPrice * 2;
        else if($result->fetch_assoc()["edition"] == "foil")
            $cardPrice = (int)$cardPrice * 1.25;

        $sql3 = "DELETE FROM userscards WHERE id = '" . $ID . "'";

        $result3 = $conn->query($sql3);
        if($result3)
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
        echo "Couldn't get edition";
    }
}
else
{
    echo "0";
}
$conn->close();
?>