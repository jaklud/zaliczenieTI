<!DOCTYPE HTML>
<html>
<meta charset="UTF-8"> 
<head>
	<title>Warhammer Calculator</title>
</head>
   <?php echo $login_session; ?>
<?php
   include('session.php');
    
    mysqli_select_db($db, 'warhammer');
  ?>   
   
   <body bgcolor="#E6E6FA">
      
      <center><img id="logo" src="Warhammer-logo.png" alt="logo-wh"></center>
  <div align = "center">    
    <?php  
 $query = "SELECT * FROM Army";
		$result = mysqli_query($db, $query);

			while ($row=mysqli_fetch_array($result))	
	{
		echo $row[0] . ' ',$row[1] . ' ',$row[2] . ' ',$row[3] . ' ',$row[4] . ' ',$row[5] . ' ',$row[6] . ' ',$row[7] . ' ' ;
		echo '<br />';
	}
	mysqli_free_result($result);
 
 
 ?>
 
<h2> Dodawanie nowej armii</h2> <br><br>
		

<form action="insert.php" method="post">
    <p>
        <label for="nazwa">Nazwa:</label>
        <input type="text" name="nazwa" id="nazwa">
    </p>
    <p>
        <label for="info">Informacje:</label>
        <input type="text" name="info" id="info">
    </p>
    <p>
        <label for="spec">Zasada specjalna:</label>
        <input type="text" name="spec" id="spec">
    </p>
    <p>
        <label for="id">Alliance ID:</label>
        <input type="number" name="id" id="id" min="1" max="5">
    </p>
    <input type="submit" value="Submit">
</form>
     
      
   </body>
   <h2><a href = "UserData.php">Dane użytkownika</a></h2>
</html>

<input type="submit" onclick="alert('Jakub Ludwiszewski Grupa Z706 7715')" value="Informacje o autorze"> 
     <form action="logout.php">
 <input type="submit" id="logout" value="logout" name="logout">
</form>
<?php
  
   /* 
		$query = "SELECT Name FROM Army";
		$result = mysqli_query($db, $query);

			while ($row=mysqli_fetch_array($result))	
	{
		echo $row[0] . ' ' ;
		echo '<br />';
	}
	mysqli_free_result($result);
	


?>