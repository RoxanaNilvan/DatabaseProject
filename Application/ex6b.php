<div class="Page">
    <link rel="stylesheet" href="style.css">

    <h3>
        Să se găsească prețul minim, mediu și maxim al imprimantelor în funcție de culoare și tip.
    </h3>

    <div class="Content">
        <?php
        include 'db_connection.php';

        $conn = OpenCon();

        $query = ("CALL 6b()");

        $result = mysqli_query($conn, $query);
        if ($result->num_rows > 0) {
            echo "<table>
                              <tr>
                                <th>maxim</th>
                                <th>mediu</th>
                                <th>minim</th>
                              </tr>";

            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                                <td>" . $row['Maxim'] . "</td>
                                <td>" . $row['Mediu'] . "</td>
                                <td>" . $row['Minim'] . "</td>" .
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
