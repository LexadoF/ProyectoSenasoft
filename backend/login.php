<?php

// incluye la configuracion / y la conexion de la base de datos
require_once("conexion.php");
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  
  <title>Login</title>

</head>
<body>
 <div class="container">
        <div class="card card-container">
            <form method="post" accept-charset="utf-8" action="login.php" name="loginform" autocomplete="off" role="form" class="form-signin">
			    <span id="reauth-email" class="reauth-email"></span>
                <input class="form-control" placeholder="Usuario" name="user_name" type="text" value="" autofocus="" required>
                <input class="form-control" placeholder="Contraseña" name="user_password" type="password" value="" autocomplete="off" required>
                <button type="submit" class="btn btn-lg btn-success btn-block btn-signin" name="login" id="submit">Iniciar Sesión</button>
            </form><!-- /form -->
            
        </div><!-- /card-container -->
    </div><!-- /container -->
  </body>
</html>