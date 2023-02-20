<!DOCTYPE html>
    <head>
        <title>LAP-Example</title>
    </head>
    <body>
        <h1>LAP Example</h1>

        <form action="suche.php" method="POST">
            Marke: <select name="marke">
                <option value="">-- ALLE --</option>
    <?php

               // if data available, create a DB connection
                $link = mysqli_connect("localhost", "root", "", "lap_autos");
                // connection successful
                if ($link === false) {
                    die("ERROR: Could not connect. "
                                .mysqli_connect_error());
                }
            
                // request data
                //$sql = "SELECT * FROM modelle";
                $sql = "SELECT idMarken, MarkenBez FROM marken ORDER BY MarkenBez";
            
                if ($res = mysqli_query($link, $sql)) {
                    // if data was found
                    if (mysqli_num_rows($res) > 0) {// res = found results
                        // show table head
                        echo "<table>";
                        echo "<tr>";
                        echo "<th>Marke</th>";
                        echo "<th>Modelle</th>";
                        echo "<th>Leistung</th>";
                        echo "<th>Türen</th>";
                        echo "</tr>";
                        // and all data
                        while ($row = mysqli_fetch_array($res)) {
                            echo '<option value="'.$row['idMarken'].'">'.$row['MarkenBez']."</option>";
                        }
                        echo "</table>";
                        mysqli_free_result($res); // cleaning up
                    }
                    else {
                        echo "No matching records are found.";
                    }
                }
                else {
                    echo "ERROR: Could not able to execute $sql. "
                                                .mysqli_error($link);
                }
                mysqli_close($link); // close db connection
            ?>
            </select><br>
            Leistung: <input type="text" name="leistung"><br>
            <input type="submit" value="submit">
        </form>

        <table border="1" cellspacing="0" cellpadding="3">
            <tr>
                <td><strong>Marke</strong></td>
                <td><strong>Modell</strong></td>
                <td><strong>Leistung</strong></td>
            </tr>
            <tr>
                <td>VW</td>
                <td>id4</td>
                <td>75 kW</td>
            </tr>
            <tr>
                <td>Audi</td>
                <td>A6</td>
                <td>100 kW</td>
            </tr>
        </table>

    </body>
</html>