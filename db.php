<?php
$host = "127.0.0.1"; // o "localhost"
$user = "root";
$pass = "1029"; // sin contraseña por defecto
$dbname = "huntechdb";

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>

