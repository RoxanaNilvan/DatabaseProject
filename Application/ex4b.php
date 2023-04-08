<div class="Page">
    <link rel="stylesheet" href="style.css">

    <h3>
        Să se găsească perechi de modele (model1, model2) de pc-uri cu condiția să
        aibă aceeași viteză, ram și hd dar fabricanți diferiți. O pereche este unică în
        rezultat.
    </h3>

    <div class="Content">
        <?php
        include 'db_connection.php';

        $conn = OpenCon();

        $query = ("CALL 4b()");

        $result = mysqli_query($conn, $query);
        if ($result->num_rows > 0) {
            echo "<table>
                              <tr>
                                <th>model1</th>
                                <th>model2</th>
                              </tr>";

            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                                <td>" . $row['model1'] . "</td>
                                <td>" . $row['model2'] . "</td>" .
                    "
                              </tr>";
            }

            echo "</table>";
        } else {
            echo "0 results";
        }

        CloseCon($conn);
        ?>
    </div>

    <a href="index.html" class="button">Acasa</a>
</div>
