<?php

	/* conexion base de datos*/
	require_once ("db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("conexion.php");//Contiene funcion que conecta a la base de datos

?>
<!DOCTYPE html>
<html lang="en">
  <head>

  </head>
  <body>
		
    <div class="container">
	<div class="panel panel-info">
		<div class="panel-heading">
		    <div class="btn-group pull-right">
				<button type='button' class="btn btn-info">Nuevo Cliente</button>
			</div>
			<h4> Buscar Clientes</h4>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" role="form" id="datos_cotizacion">
				
				<div class="form-group row">
					<label for="q" class="col-md-2 control-label">Cliente</label>
						<div class="col-md-5">
							<input type="text" class="form-control" placeholder="Nombre del cliente">
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-search" ></span> Buscar</button>
							<span id="loader"></span>
						</div>
							
				</div>
            </form>
	    </div>
    </div>
		 
</div>
	<hr>
	
	
</body>
</html>
