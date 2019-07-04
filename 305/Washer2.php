<html>
   <head>
      <title>Washer </title>
   </head>
   
   <body>
      <h1>Washer

      </h1> 
    
</html>
</html>
<?php // manageProduct.php
  require_once 'hhh3login.php';
  $conn = new mysqli($hn, $un, $pw, $db);
  if ($conn->connect_error) die($conn->connect_error);



  echo <<<_END
  
  
  </pre></form>
  
  <a href="javascript:history.go(-1)" title="Return to previous page">&laquo; Go back</a>
_END;

  $query  = "SELECT * FROM Washer";
  $result = $conn->query($query);
  if (!$result) die ("Database access failed: " . $conn->error);

  $rows = $result->num_rows;
  for ($j = 0 ; $j < $rows ; ++$j) {
    $result->data_seek($j);
    $row = $result->fetch_array(MYSQLI_NUM);

    echo <<<_END
  <pre>
     productId: $row[0]
     cost: $row[1]
     maker: $row[2]
      </pre>
  <form action="Washer.php" method="post">
  <input type="hidden" name="addCart" value="yes">
  <input type="hidden" name="productId" value="$row[1]">
   <a href="updateCart.php">Add Cart</a> 
</a> 
</form>
_END;
  }
  
  $result->close();
  $conn->close();

  // real_escape_string to strip out any characters that a hacker
  // may have inserted.
  function get_post($conn, $var) {
    return $conn->real_escape_string($_POST[$var]);
  }

?>