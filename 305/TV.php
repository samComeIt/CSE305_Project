<html>
   <head>
      <title>Add TV Products </title>
   </head>
   
   <body>
       <h1><div style="text-align:center">Add TV Products</h1>
		<h3><a href="welcome.php">Go back to Client page</a> </h3>
		<h3><a href="viewCart.php">View Cart</a> </h3></div>
      </h1> 
</html>
</html>
<?php // TV.php

  require_once 'hhh3login.php';
  include('session.php');
  $conn = new mysqli($hn, $un, $pw, $db);
  if ($conn->connect_error) die($conn->connect_error);

  if (isset($_POST['select']) && isset($_POST['productId'])&& isset($_POST['cost'])&& isset($_POST['demo1'])) {
	$numberofItem = get_post ($conn, 'demo1');
	$date=date("Y-m-d", time());
    $productId   = get_post($conn, 'productId');
	$cost   = get_post($conn, 'cost');
	
	$sql = "SELECT productId FROM Cart2 WHERE clientId = '$login_session' AND productId = '$productId'";
    $result = mysqli_query($conn,$sql);
	$count = $result->num_rows;

    if($count ==0) {    
		if($numberofItem ==0){
	echo "Need at least 1 item to add into the cart";
		}else{
	$query  = "INSERT INTO Cart2 (productId, clientId, orderDate, cost, numberofItem, totalAmount) VALUES('$productId', '$login_session', '$date','$cost','$numberofItem', '$cost'*'$numberofItem')";
	$result = $conn->query($query);
	echo "$productId has been added to the cart";
	}
	
	}else{
		if($numberofItem ==0){
	echo "Need at least 1 item to add into the cart";
		}else{
	$query  = "UPDATE Cart2 SET numberofItem = numberofItem + '$numberofItem', totalAmount=totalAmount+('$cost'*'$numberofItem') WHERE clientId = '$login_session' AND productId='$productId'";
	$result = $conn->query($query);
	echo "$productId has been added to the cart";
	  }
	}
    if (!$result)
      echo "Add Cart failed: $query<br>" . $conn->error . "<br><br>";
  }

  $query  = "SELECT * FROM Products WHERE type='tv'";
  $result = $conn->query($query);
  if (!$result) die ("Database access failed: " . $conn->error);
  

  $rows = $result->num_rows;
  for ($j = 0 ; $j < $rows ; ++$j) {
    $result->data_seek($j);
    $row = $result->fetch_array(MYSQLI_NUM);

    echo <<<_END
	<div style="text-align:center">
  <pre>
    Model Name: $row[1]
	Maker: $row[0]
	Cost: $$row[3]
 </pre>
  <form action="TV.php" method="post"><pre>
  <input id="productQty" type="text" value="0" name="demo1" class="form-control">
  <input type="submit" value="Add Cart">
  <input type="hidden" name="select" value="yes">
  <input type="hidden" name="productId" value="$row[1]">
  <input type="hidden" name="cost" value="$row[3]"></pre></form></div>
_END;
	  
  }
  
  $result->close();
  $conn->close();

  function get_post($conn, $var) {
    return $conn->real_escape_string($_POST[$var]);
  }

?>