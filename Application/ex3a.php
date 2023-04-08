<div class="Page">
    <link rel="stylesheet" href="style.css">

    <div class="Content">
        <?php
        include 'db_connection.php';

        $conn = OpenCon();

        if (isset($_POST['submit1'])) {
            if (isset($_GET['go'])) {
                $categorie = $_POST['categorie'];
                $moneda = $_POST['moneda'];

                $query = ("SELECT fabricant 
                           FROM Produs 
                           WHERE categorie = '" . $categorie . "' AND pret < 1000 AND moneda = '" . $moneda . "'
                           ORDER BY fabricant;");

                $result = mysqli_query($conn, $query);
                if ($result->num_rows > 0) {
                    echo "<table>
                              <tr>
                                <th>Fabricant</th>
                              </tr>";

                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>
                                <td>" . $row['fabricant'] . "</td>
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
    <a href="3a_form.html" class="button">Inapoi</a>
</div>
