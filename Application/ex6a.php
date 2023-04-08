<div class="Page">
    <link rel="stylesheet" href="style.css">

    <h3>
        Să se găsească fabricantul și modelele produselor cu prețul cel mai mic.
    </h3>

    <div class="Content">
        <?php
        include 'db_connection.php';

        $conn = OpenCon();

        $query = ("CALL 6a()");

        $result = mysqli_query($conn, $query);
        if ($result->num_rows > 0) {
            echo "<table>
                              <tr>
                                <th>fabricant</th>
                                <th>model</th>
                              </tr>";

            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                                <td>" . $row['fabricant'] . "</td>
                                <td>" . $row['model'] . "</td>" .
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