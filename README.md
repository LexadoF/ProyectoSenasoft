# ProyectoSenasoft
Repositorio para la competencia senasoft


# Carpetas del proyecto


## Carpeta: Documentacion
En esta carpeta se encuentra contenida la documentacion basica del proyecto

## Carpeta: Database
En esta carpeta se encuentra el script de la bd, el cual para ser usado debe de importarse en MYSQL usando PHPMyAdmin 

## Carpeta: Backend
En esta carpeta se encuentra el codigo de la logica o backend de la aplicación.

#### Inicialización de modulos del backend
Debe usarse en la consola `cd backend` y dentro de esa 
carpeta ejecutar `composer install` para que se reinstalen los modulos del composer, y asi poder ejecutar el comando
`php artisan serve`

## Carpeta Frontend
En esta carpeta se encuentra el codigo de las vistas o frontend.

#### Inicialización de modulos del backend
Debe usarse en la consola `cd frontend` y dentro de esa carpeta
ejecutar `npm i` para reinstalar los modulos de node localmente y posterior a eso poder ejecutar `ng serve` para iniciar el proyecto


# Funcionalidades del proyecto


## Funcionalidad principal
El proyecto es un sistema de facturacion que se piensa sera usado por varias empresas, los encargados de cada empresa deben registrarse
seleccionando la empresa a la que pertenecen e ingresando otros datos pertinentes, posterior a esto el encargado podrá verificar el stock,
agregar productos manualmente o mediante un excel csv, tambien podrá hacer una actualizacion de los que considere.
Podrá generar una nueva factura y en caso de que se requiera, ingresar un nuevo cliente.

## 