<?php
$host = getenv("DB_HOST") ?: "huntech-db";
$user = getenv("DB_USER") ?: "root";
$pass = getenv("DB_PASSWORD") ?: "1029";
$dbname = getenv("DB_NAME") ?: "huntechdb";

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>

