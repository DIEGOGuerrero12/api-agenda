# API Personas
Uso de FastAPI y MariaDB para generar una API REST con las siguientes funciones: insertar, borrar, actualizar, buscar y listar registros de una tabla.

## 1. Configurar codespace

1.1 Actualizar versiones de librerias y paquetes instalables

````shell
$ sudo apt-get update
````

1.2 Instalar MariaDB


````shell
$ sudo apt-get install mariadb-server -y
````

1.3 Detener el servidor

````shell
$ sudo /etc/init.d/mysql stop
````

1.4 Iniciar el servidor

````shell
$ sudo mysqld_safe --skip-grant-tables &
````

1.5 Conectando con el servidor MySQL

````shell
$ sudo mysql -u root
````

1.6 Salir de la MariaDB

````shell
MariaDB [(none)]> exit;
````

## 2. Script para crear la base de datos

2.1 Diccionario de datos de la tabla **personas**.

|Atributos|Campo|Tipo de dato|Descripción|
| -- | -- | -- | -- |
| PK | id_persona | int | Identificador de la persona |
| - | nombre | varchar(50) | Nombre de la persona |
| - | primer_apellido | varchar(50) | Primer apellido de la persona |
| - | segundo_apellido | varchar (50) | Segundo apellido de la persona |
| - | email | varchar(100) |  Email de la persona |
| - | telefono | varchar(10) | Teléfono de la persona |

2.2 Script para crear la base de datos

* Crear la base de datos **db_agenda**.
* Crear la tabla **personas**.
* Insertar 2 registros en la tabla **personas**.

````sql
CREATE DATABASE db_agenda;

USE  db_agenda;

CREATE TABLE personas(
    id_persona int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    primer_apellido varchar(50) NOT NULL,
    segundo_apellido varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    telefono varchar(10) NOT NULL
);

INSERT INTO personas (nombre,primer_apellido,segundo_apellido,email,telefono)
VALUES 
(`Ana`, `Lopez`, `Martinez`, `ana.lopez23@gmail.com`, `5551234567`),
(`Carlos`, `Perez`, `Gomez`, `carlospg78@hotmail.com`, `7719876543`),
(`Maria`, `Garcia`, `Sanchez`, `maria_garcia@gmail.com`, `4443217890`);

SELECT * FROM personas;
````

2.3 Crear la base de datos desde MariaDB shell

````shell
MariaDB [(none)]> source db_agenda.sql
````

## 3. Ambiente virtual

3.1 Crear el ambiente virtual

````shell
$  python3 -m venv venv
````

3.2 Iniciar el ambiente virtual

````shell
$ source venv/bin/activate
````

3.2 Desactivar el ambiente virtual

````shell
$ deactivate
````

3.3 Actualizar PIP

````shell
$ pip install --upgrade pip
````

3.4 Instalar las librerias

````shell
pip install -r requirements.txt
````

## 5 crear el usuario en mysql

ocupar el root es peligroso, cualquier persona podria entrar y hacer lo que quiera con la base de datos (ya que root )

### 5.1 accedemos a mysql con el usuario root 
### 5.2 en un archivo "user.sql" se pondran los comandos necesarios para crear el usuario y otorgarle los permisos necesarios
### 5.3 en mysql se pondra el comando

````shell
USE db_agenda;
````


````shell
source user.sql;
````

````shell
exit;
````

### 5.4 ejecuta la api (endpoint)



### Método POST
| Atributo           | Descripción                                                                                                                                             |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Description**    | Añadir un nuevo registro a la tabla `personas`.                                                                                                         |
| **Summary**        | Crea un nuevo registro con los datos de una persona.                                                                                                    |
| **Method**         | POST                                                                                                                                                    |
| **Endpoint**       | `http://localhost:8000/v1/personas`                                                                                                                     |
| **Authentication** | NA                                                                                                                                                      |
| **Query params**   | NA                                                                                                                                                      |
| **Path params**    | NA                                                                                                                                                      |
| **Data**           | ```json {"nombre": "string","primer_apellido": "string","segundo_apellido": "string","email": "string","telefono": "string"}```                        |
| **Status code**    | 201 (Created)                                                                                                                                           |
| **Response Type**  | Application/JSON                                                                                                                                        |
| **Response**       | ```json {"id_persona": "integer","nombre": "string","primer_apellido": "string","segundo_apellido": "string","email": "string","telefono": "string"}``` |
| **Error code**     | 400                                                                                                                                                     |
| **Error Type**     | Application/JSON                                                                                                                                        |
| **Error Response** | ```json {"message": "Error en la validación de datos"}```                                                                                               |
| **cURL**           | ```bash curl -X POST http://localhost:8000/v1/personas -H "Content-Type: application/json" -d '{"nombre": "nombre","primer_apellido": "apellido1","segundo_apellido": "apellido2","email": "email@example.com","telefono": "1234567890"}'``` |


### Método PUT
| Atributo           | Descripción                                                                                                                                             |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Description**    | Actualizar un registro completo de la tabla `personas`.                                                                                                 |
| **Summary**        | Modifica los datos de una persona por su `id_persona`.                                                                                                  |
| **Method**         | PUT                                                                                                                                                     |
| **Endpoint**       | `http://localhost:8000/v1/personas/{id_persona}`                                                                                                        |
| **Authentication** | NA                                                                                                                                                      |
| **Query params**   | NA                                                                                                                                                      |
| **Path params**    | `id_persona` (integer)                                                                                                                                  |
| **Data**           | ```json {"nombre": "string","primer_apellido": "string","segundo_apellido": "string","email": "string","telefono": "string"}```                         |
| **Status code**    | 200 (OK)                                                                                                                                                |
| **Response Type**  | Application/JSON                                                                                                                                        |
| **Response**       | ```json {"id_persona": "integer","nombre": "string","primer_apellido": "string","segundo_apellido": "string","email": "string","telefono": "string"}``` |
| **Error code**     | 404                                                                                                                                                     |
| **Error Type**     | Application/JSON                                                                                                                                        |
| **Error Response** | ```json {"message": "Persona no encontrada"}```                                                                                                         |
| **cURL**           | ```bash curl -X PUT http://localhost:8000/v1/personas/{id_persona} -H "Content-Type: application/json" -d '{"nombre": "nuevo_nombre","primer_apellido": "nuevo_apellido1","segundo_apellido": "nuevo_apellido2","email": "nuevo_email@example.com","telefono": "0987654321"}'``` |


### Método PATCH
| Atributo           | Descripción                                                                                                                                             |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Description**    | Actualizar parcialmente un registro de la tabla `personas`.                                                                                             |
| **Summary**        | Modifica algunos datos de una persona por su `id_persona`.                                                                                              |
| **Method**         | PATCH                                                                                                                                                   |
| **Endpoint**       | `http://localhost:8000/v1/personas/{id_persona}`                                                                                                        |
| **Authentication** | NA                                                                                                                                                      |
| **Query params**   | NA                                                                                                                                                      |
| **Path params**    | `id_persona` (integer)                                                                                                                                  |
| **Data**           | ```json {"nombre": "string","primer_apellido": "string","segundo_apellido": "string","email": "string","telefono": "string"}```                         |
| **Status code**    | 200 (OK)                                                                                                                                                |
| **Response Type**  | Application/JSON                                                                                                                                        |
| **Response**       | ```json {"id_persona": "integer","nombre": "string","primer_apellido": "string","segundo_apellido": "string","email": "string","telefono": "string"}``` |
| **Error code**     | 404                                                                                                                                                     |
| **Error Type**     | Application/JSON                                                                                                                                        |
| **Error Response** | ```json {"message": "Persona no encontrada"}```                                                                                                         |
| **cURL**           | ```bash curl -X PATCH http://localhost:8000/v1/personas/{id_persona} -H "Content-Type: application/json" -d '{"nombre": "nombre_modificado"}'```        |


### Método DELETE

| Atributo           | Descripción                                                                                                                |
|--------------------|----------------------------------------------------------------------------------------------------------------------------|
| **Description**    | Eliminar un registro de la tabla `personas`.                                                                               |
| **Summary**        | Elimina el registro de una persona por su `id_persona`.                                                                    |
| **Method**         | DELETE                                                                                                                     |
| **Endpoint**       | `http://localhost:8000/v1/personas/{id_persona}`                                                                           |
| **Authentication** | NA                                                                                                                         |
| **Query params**   | NA                                                                                                                         |
| **Path params**    | `id_persona` (integer)                                                                                                     |
| **Data**           | NA                                                                                                                         |
| **Status code**    | 204 (No Content)                                                                                                           |
| **Response Type**  | NA                                                                                                                         |
| **Response**       | NA                                                                                                                         |
| **Error code**     | 404                                                                                                                        |
| **Error Type**     | Application/JSON                                                                                                           |
| **Error Response** | ```json {"message": "Persona no encontrada"}```                                                                            |
| **cURL**           | ```bash curl -X DELETE http://localhost:8000/v1/personas/{id_persona}```                                                   |
