<?php
$host = "127.0.0.1";
$user = "huntech";
$pass = "1029";
$dbname = "huntechdb";

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>
