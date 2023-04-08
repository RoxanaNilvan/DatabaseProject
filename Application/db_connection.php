<?php

function OpenCon()
{
    $db_host = "localhost";
    $db_username = "root";
    $db_pass = "";
    $db = "colocviu_partial";

    $conn = new mysqli($db_host, $db_username, $db_pass, $db) or die("Connect failed: %s\n" . $conn->error);

    return $conn;
}

function CloseCon($conn)
{
    $conn->close();
}