# ProyectoSenasoft
Repositorio para la competencia senasoft el cual contiene los archivos correspondientes al proyecto que dará
solución a la problemática planteada.

# Carpetas del proyecto


## Carpeta: Documentacion
En esta carpeta se encuentra contenida la documentacion basica del proyecto.

## Carpeta: Database
En esta carpeta se encuentra el script de la Base de Datos

## Carpeta: Backend
En esta carpeta se encuentra el codigo de la logica o backend de la aplicación.

<!-- ### Inicialización de modulos del backend
Debe usarse en la consola `cd backend` y dentro de esa 
carpeta ejecutar `composer install` para que se reinstalen los modulos de composer localmente, y posteriormente poder ejecutar el comando
`php artisan serve` para iniciar el proyecto en modo local. -->

## Carpeta Frontend
En esta carpeta se encuentra el codigo de las vistas o frontend.

### Inicialización de modulos del Frontend
Debe usarse en la consola `cd frontend` y dentro de esa carpeta
ejecutar `npm i` para reinstalar los modulos de node localmente y posteriormente poder ejecutar el comando `ng serve` para iniciar el proyecto
en modo local.


# Funcionalidades del proyecto


## Funcionalidad principal
El proyecto es un sistema de facturacion que se piensa sera usado por varias empresas, los encargados de cada empresa deben registrarse
seleccionando la empresa a la que pertenecen e ingresando otros datos pertinentes, posterior a esto el encargado podrá verificar el stock,
agregar productos manualmente o mediante un excel csv, tambien podrá hacer una actualizacion de los que considere.
Podrá generar una nueva factura y en caso de que se requiera, ingresar un nuevo cliente.

## Carga de archivos a la Base de datos
El sistema permite cargar desde un archivo csv de excel los datos de los productos que seran ingresados al stock, permitiendo una alimentación
rapida y segura de la base de datos.

<!-- ## Seguridad ante desconexion
El sistema permite en caso de que se cierre la pestaña o se desconecte de la aplicacion puedas restaurar la ultima factura como un borrador -->

# Uso objetivo
Se piensa la implementación de esta aplicacion de manera interna en las empresas, impidiendo el acceso a terceros no autorizados.