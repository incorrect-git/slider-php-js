<?php
function connect() 
{
    $dbHost = ""; // адресс базы
    $dbUsername = ""; // имя пользователя базы
    $dbPassword = ""; // пароль пользователя базы
    $dbName = ""; // название базы данных

    $conn = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    return $conn;
}

function sql($sql, $config = [
  "type" => "select",
  "numRows" => true,
]) {
  $conn = connect();

   $result = $conn->query($sql);
 
    $count = null;
    $result_assoc = [];
    if($config["type"] == "select")
    {
        if ($config["numRows"] == true) {
          $count = $result->num_rows;
        }

        while($row = $result->fetch_assoc()) {
          $result_assoc[] = $row;
        }
    }

   $conn->close(); 

   return [
    "result_assoc" => $result_assoc,
    "count" => $count,
   ];
}