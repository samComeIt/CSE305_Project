<?php
   include('session.php');
   echo "<div style=\"text-align:center\">";
   
?>
<html">
   
   <head>
      <title>View Profile </title>
   </head>
   
   <body>
      <h3>Welcome <?php echo $login_session; ?></h3> 
	  <h3>Client ID: <?php echo $login_clientId; ?></h3> 
	  <h3>Password: <?php echo $login_pw; ?></h3> 
	  <h3>Name: <?php echo $login_name; ?></h3>
	  <h3>Address: <?php echo $login_address; ?></h3>
	  <h3>Phone Number: <?php echo $login_phonenumber; ?></h3>
	  <h3>Email: <?php echo $login_email; ?></h3>
	  <h3>Date of Birth: <?php echo $login_dateofbirth; ?></h3>
      <h3><a href = "editProfile.php">Edit Profile</a></h3>
	  <h3><a href = "welcome.php">Go back to Client page</a></h3>
	  <h3><a href = "logout.php">Sign Out</a></h3>
   </body>
   
</html>