<?php
		if (!empty($_POST['DocCliente'])){
		/* Connect To Database*/
		require_once ("db.php");//Contiene las variables de configuracion para conectar a la base de datos
		require_once ("conexion.php");//Contiene funcion que conecta a la base de datos
		require_once ("clientes.php");
		$docClien=mysqli_real_escape_varchar($con,(strip_tags($_POST["DocCliente"],ENT_QUOTES)));
		$nomClien=mysqli_real_escape_varchar($con,(strip_tags($_POST["NombreCliente"],ENT_QUOTES)));
		$telClien=mysqli_real_escape_varchar($con,(strip_tags($_POST["TelefonoCliente"],ENT_QUOTES)));
		$dirClien=mysqli_real_escape_varchar($con,(strip_tags($_POST["DireccionCliente"],ENT_QUOTES)));
		$estado=intval($_POST['Estado']);
		$sql="INSERT INTO cliente (DocCliente, NombreCliente, TelefonoCliente, DireccionCliente, Estado) VALUES ('$docClien','$nomClien','$telClien','$dirClien','$estado')";
		$query_new_insert = mysqli_query($con,$sql);
			if ($query_new_insert){
				$messages[] = "Cliente ha sido ingresado exitosamente.";
			} else{
				$errors []= "Lo siento algo ha salido mal intenta nuevamente.".mysqli_error($con);
			}
		} else {
			$errors []= "Error desconocido.";
		}
		
		if (isset($errors)){
			
			?>
			<div class="alert alert-danger" role="alert">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>Error!</strong> 
					<?php
						foreach ($errors as $error) {
								echo $error;
							}
						?>
			</div>
			<?php
			}
			if (isset($messages)){
				
				?>
				<div class="alert alert-success" role="alert">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>¡Bien hecho!</strong>
						<?php
							foreach ($messages as $message) {
									echo $message;
								}
							?>
				</div>
				<?php
			}

?>