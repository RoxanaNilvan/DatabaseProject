<div class="Page">
    <link rel="stylesheet" href="style.css">

    <div class="Content">
        <?php
        include 'db_connection.php';

        $conn = OpenCon();

        if (isset($_POST['submit1'])) {
            if (isset($_GET['go'])) {
                $hd = $_POST['hd'];

                $query = ("SELECT produs.fabricant 
                           FROM Produs JOIN Laptop USING(model) 
                           WHERE laptop.HD = '" . $hd. "' and Produs.pret <= ALL (SELECT pret 
                                                                          FROM produs JOIN Laptop USING(model) 
                                                                          WHERE produs.categorie = 'Laptop' AND laptop.HD = '" . $hd. "');");

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
    <a href="5a_form.html" class="button">Inapoi</a>
</div>