<?php include("db.php"); ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Panel Admin</title>
  <link rel="stylesheet" href="style.css">
  <style>
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 1em;
    }
    th, td {
      border: 1px solid #ccc;
      padding: 0.5em;
      text-align: left;
    }
    th {
      background-color: #f0f0f0;
    }
    form {
      margin: 1em 0;
    }
  </style>
</head>
<body>
  <header>
    <h1>Panel Administrativo</h1>
    <nav>
      <a href="index.html">Inicio</a>
      <a href="admin.php">Admin</a>
    </nav>
  </header>

  <main>
    <h2>Visualizar tablas de huntechdb</h2>

    <!-- Selector de tabla -->
    <form method="get" action="admin.php">
      <label for="tabla">Selecciona una tabla:</label>
      <select name="tabla" id="tabla">
        <option value="productos">Productos</option>
        <option value="servicios_tecnicos">Servicios Técnicos</option>
        <option value="ventas">Ventas</option>
        <option value="categorias">Categorías</option>
        <option value="detalles_venta">Detalles de Venta</option>
      </select>
      <button type="submit">Ver</button>
    </form>

    <?php
    if (isset($_GET['tabla'])) {
        $tabla = $_GET['tabla'];

        // Consulta genérica: selecciona todo
        $sql = "SELECT * FROM $tabla";
        $result = $conn->query($sql);

        if ($result && $result->num_rows > 0) {
            echo "<table><thead><tr>";

            // Encabezados dinámicos
            $fields = $result->fetch_fields();
            foreach ($fields as $field) {
                echo "<th>".htmlspecialchars($field->name)."</th>";
            }
            echo "</tr></thead><tbody>";

            // Filas dinámicas
            while($row = $result->fetch_assoc()) {
                echo "<tr>";
                foreach ($row as $value) {
                    echo htmlspecialchars($row['campo'] ?? '');
                }
                echo "</tr>";
            }

            echo "</tbody></table>";
        } else {
            echo "<p>No hay datos en la tabla seleccionada.</p>";
        }
    }

    $conn->close();
    ?>
  </main>

  <footer>
    <p>&copy; 2025 Huntech</p>
  </footer>
</body>
</html>


