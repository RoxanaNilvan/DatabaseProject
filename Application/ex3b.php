<div class="Page">
    <link rel="stylesheet" href="style.css">

    <div class="Content">
        <?php
        include 'db_connection.php';

        $conn = OpenCon();

        if (isset($_POST['submit1'])) {
            if (isset($_GET['go'])) {
                $ecran = $_POST['ecran'];

                $query = ("SELECT * 
                           FROM Laptop 
                           WHERE ecran = '" . $ecran . "'
                           ORDER BY RAM DESC, hd;");

                $result = mysqli_query($conn, $query);
                if ($result->num_rows > 0) {
                    echo "<table>
                              <tr>
                                <th>Model</th>
                                <th>Viteza</th>
                                <th>RAM</th>
                                <th>HD</th>
                                <th>Ecran</th>
                              </tr>";

                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>
                                <td>" . $row['model'] . "</td>
                                <td>" . $row['viteza'] . "</td>
                                <td>" . $row['RAM'] . "</td>
                                <td>" . $row['HD'] . "</td>
                                <td>" . $row['ecran'] . "</td>
                              </tr>";
                    }

                    echo "</table>";
                } else {
                    echo "0 results";
                }
            }
        }

        CloseCon($conn);
        ?>
    </div>

    <a href="index.html" class="button">Acasa</a>
    <a href="3b_form.html" class="button">Inapoi</a>
</div>
