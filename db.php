<?php
$host = "localhost";
$user = "root";
$pass = "1029"; // o la que definas
$dbname = "huntechdb";

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>
