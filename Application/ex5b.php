<div class="Page">
    <link rel="stylesheet" href="style.css">

    <div class="Content">
        <?php
        include 'db_connection.php';

        $conn = OpenCon();

        if (isset($_POST['submit1'])) {
            if (isset($_GET['go'])) {
                $model = $_POST['model'];

                $query = ("SELECT model, culoare, tip, fabricant, pret 
                           FROM imprimanta JOIN produs USING(model)
                            WHERE pret IN(SELECT pret 
                                          FROM produs 
                                          WHERE model = '" . $model. "');");

                $result = mysqli_query($conn, $query);
                if ($result->num_rows > 0) {
                    echo "<table>
                              <tr>
                                <th>Model</th>
                                <th>Culoare</th>
                                <th>Tip</th>
                                <th>Fabricant</th>
                                <th>Pret</th>
                              </tr>";

                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>
                                <td>" . $row['model'] . "</td>
                                <td>" . $row['culoare'] . "</td>
                                <td>" . $row['tip'] . "</td>
                                <td>" . $row['fabricant'] . "</td>
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
    <a href="5b_form.html" class="button">Inapoi</a>
</div>
