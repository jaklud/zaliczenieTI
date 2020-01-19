<?php
include('creator.php');
mysqli_select_db($db, 'warhammer');

	$nazwa = mysqli_real_escape_string($db, $_REQUEST['nazwa']);
	$info = mysqli_real_escape_string($db, $_REQUEST['info']);
	$spec = mysqli_real_escape_string($db, $_REQUEST['spec']);
	$id = mysqli_real_escape_string($db, $_REQUEST['id']);
 	
 	$sql = "INSERT INTO Army(Name,Info,SpecialRule,AllianceID) values ('$nazwa','$info','$spec','$id')";

		if(mysqli_query($db, $sql))
			{
    			echo "Armia została dodana do bazy";
			} 
		else
			{
    			echo "ERROR: Could not able to execute $sql. " . mysqli_error($db);
			}
 
 mysqli_close($db);
?>


























			
		
			<!--	$name=$_POST['Nazwa'];
				$info=$_POST['Info'];
				$spec=$_POST['Spec'];
			
				$insert = "INSERT INTO Army(Name,Info,SpecialRule) values ('$name','$info','$spec')";
				if(mysqli_query($db, $insert))
				{
    					echo "Records added successfully.";
														} 
						else{
    							echo "ERROR: Could not able to execute $insert. " . mysqli_error($link);
							}

			-->	
			