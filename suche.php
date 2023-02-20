<?php

    // output of all variables which are sent via $_POST
    // debugging
    var_dump($_POST);
    // check, if data was sent
    if (isset($_POST['marke'])) {
        echo "<br>sent: MARKE = " . $_POST['marke'] . "<br>Leistung = " . $_POST['leistung'] . "<br>";
    } else { // close connection, if no db available
        die("no data was sent");
    }

    // data output
    // if data available, create a DB connection
    $link = mysqli_connect("localhost", "root", "", "lap_autos");
    // connection successful
    if ($link === false) {
        die("ERROR: Could not connect. "
                    .mysqli_connect_error());
    }

    // request data
    //$sql = "SELECT * FROM modelle";
    $sql = "SELECT idModelle, ModelleBez, ModelleLeistung, ModelleTueren, MarkenBez FROM modelle
                INNER JOIN marken ON modelle.marken_idMarken=marken.idMarken WHERE 1 ";
    if (!empty($_POST['marke'])) {
        $sql .= " AND marken_idMarken=".intval($_POST['marke']);
    }
    if (!empty($_POST['leistung'])) {
        $sql .= " AND ModelleLeistung=".intval($_POST['leistung']); // 'intval' for now against sql injections; turns input into a number
    }
    // debugging
    echo $sql."<br><br>";

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
                echo "<tr>";
                echo "<td>".$row['MarkenBez']."</td>";
                echo "<td>".$row['ModelleBez']."</td>";
                echo "<td>".$row['ModelleLeistung']."</td>";
                echo "<td>".$row['ModelleTueren']."</td>";
                echo "</tr>";
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