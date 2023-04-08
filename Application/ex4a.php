<div class="Page">
    <link rel="stylesheet" href="style.css">

    <div class="Content">
        <?php
        include 'db_connection.php';

        $conn = OpenCon();

        if (isset($_POST['submit1'])) {
            if (isset($_GET['go'])) {
                $fabricant = $_POST['fabricant'];

                $query = ("SELECT model, culoare, tip, pret 
                           FROM imprimanta JOIN produs USING(model) 
                           WHERE  fabricant = '" . $fabricant. "' 
                           ORDER BY culoare, tip, pret;");

                $result = mysqli_query($conn, $query);
                if ($result->num_rows > 0) {
                    echo "<table>
                              <tr>
                                <th>Model</th>
                                <th>Culoare</th>
                                <th>Tip</th>
                                <th>Pret</th>
                              </tr>";

                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>
                                <td>" . $row['model'] . "</td>
                                <td>" . $row['culoare'] . "</td>
                                <td>" . $row['tip'] . "</td>
                                <td>" . $row['pret'] . "</td>
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
    <a href="4a_form.html" class="button">Inapoi</a>
</div>