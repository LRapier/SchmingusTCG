<?php

require 'ConnectionSettings.php';

//user variables
$userID = $_POST["userID"];

// Check connection
if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
}

$rng = rand(1,10000);
if($rng <= 100)
{
    $rarity = "mythical"
}
else if ($rng <= 500)
{
    $rarity = "legendary"
}
else if ($rng <= 1000)
{
    $rarity = "epic"
}
else if ($rng <= 2500)
{
    $rarity = "rare"
}
else if ($rng <= 5000)
{
    $rarity = "uncommon"
}
else
{
    $rarity = "common"
}

$sql = "SELECT id FROM cards WHERE rarity = '" . $rarity . "'";

$result = $conn->query($sql);

if ($result->num_rows > 0) 
{
    $sql2 = "INSERT INTO users (username, password, money) VALUES ('" . $loginUser . "' , '" . $loginPass . "', 0)";
    if ($conn->query($sql2) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} 
else 
{
    echo "0";
}

$conn->close();
?>