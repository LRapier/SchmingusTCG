<?php

require 'ConnectionSettings.php';

//user variables
$userid = $_POST["userid"];
$cost = $_POST["cost"];

// Check connection
if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
}

$rng = rand(1,10000);
if($rng <= 100)
    $rarity = "mythical";
else if ($rng <= 500)
    $rarity = "legendary";
else if ($rng <= 1000)
    $rarity = "epic";
else if ($rng <= 2500)
    $rarity = "rare";
else if ($rng <= 5000)
    $rarity = "uncommon";
else
    $rarity = "common";

$rng = rand(1,10000);
if($rng <= 1000)
    $edition = "holo";
else if($rng <= 3000)
    $edition = "foil";
else
    $edition = "none";

$sql5 = "UPDATE `users` SET `money`= money - '" . $cost . "' WHERE `id` = '" . $userid . "'";
$conn->query($sql5);

$sql = "SELECT id FROM cards WHERE rarity = '" . $rarity . "'";

$result = $conn->query($sql);

if ($result->num_rows > 0) 
{
    $cardids = array();
    while ($row = $result->fetch_assoc()) {
        $cardids[] = $row["id"];
    }
    $cardid = $cardids[rand(0, sizeof($cardids) - 1)];

    $sql2 = "INSERT INTO userscards (userid, cardid, edition) VALUES ('" . $userid . "' , '" . $cardid . "' , '" . $edition . "')";
    $result = $conn->query($sql2);
    if ($result)
    {
        $sql3 = "SELECT LAST_INSERT_ID()";
        $result = $conn->query($sql3);
        if($result->num_rows > 0)
        {
            $id = $result->fetch_array()[0] ?? '';
            $sql4 = "SELECT id, cardid, edition FROM userscards WHERE id = '" . $id . "'";
            $result = $conn->query($sql4);
            if ($result->num_rows > 0)
            {
                $rows = array();
                while ($row = $result->fetch_assoc()) {
                    $rows[] = $row;
                }
                echo json_encode($rows);
            }
        }
        else
        {
            echo "Couldn't get last inserted id";
        }
    }
    else
    {
        echo "Could Not Insert";
    }
} 
else 
{
    echo "0";
}

$conn->close();
?>