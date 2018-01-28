<%-- 
    Patronato Universitario    
    Universidad Nacional Autónoma de México

    Document   : Página de referencia de los servicios web para el login
    Created on : 12 de Enero, 2018
    Author     : Edith C. Ordaz <edith.ordaz@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/template.css"/>
    <title>CONACYT</title>
  </head>
  <body>
    <div id="principal">
      <jsp:include page="header.jspf" />
      <div id="content">

        <div id="service-description">
          Conjunto de servicios encargados del logeo del usuario para el proyecto de CONACYT.
        </div>

        <div class="section">
          <h2 class="titles">getLogin</h2>
          <div class="description">
            Servicio mediante el cual se realizá el login.
          </div>
          <h3 class="titles">Ejemplo:</h3>
          <code class="example">
            <div class="indent-1">
              resources/conacyt/login/getLogin
            </div>
            <br>
            <div class="params indent-2">
              <pre>
json =
        {
            "usuario": "usuario_pruebas" , "pass":"1q2w3e4r"           
        } 
              </pre>
            </div>
            <br>
            <div class="indent-1">
              Parámetros:
            </div>
            <br>
            <div class="indent-2">
              <strong>usuario</strong>:  Nombre del usuario (obligatorio). <br>
              <strong>pass</strong>:  Password del usuario (obligatorio). <br>
            </div>
          </code>
          <h3 class="titles">Respuesta típica:</h3>
          <code class="code">
            <div class="response indent-1">
        Entrega el JSON, con el arreglo delos registros contenidos en el catálogo.
json =
        {
            "result_login": true,
            "rol": 2
        } 
            </div>
          </code>
          <h3 class="titles">Probar:</h3>          
          <form class="forms" action="resources/conacyt/login/getLogin" method="POST">
            <input type="text" name="json" id="json" size="60" placeholder=" json">
            <input type="submit" value="POST">
          </form>
        </div>

       <div class="section">
          <h2 class="titles">insertaOactualizaUsuario</h2>
          <div class="description">
            Servicio encargado de insertar o actualizar el registro del usuario sobre la base de datos.
          </div>
          <h3 class="titles">Ejemplo:</h3>
          <code class="example">
            <div class="indent-1">
              resources/conacyt/login/insertaOactualizaUsuario
            </div>
            <br>
            <div class="params indent-2">
              <pre> 
json =
        {
            "rfc": "OAGE810407",
            "clave_empleado": "859088",
            "nombre": "Edy",
            "apellido_p": "Segura",
            "apellido_m": "Torreblanca",
            "correo": "edi@correo.com.mx",
            "telefono": "56438556",
            "usuario": "edy55",
            "password": "159753"
            
        }
              </pre>
            </div>
            <br>
            <div class="indent-1">
              Parámetros:
            </div>
            <br>
            <div class="indent-2">
              <strong>rfc</strong>: rfc del usuario (obligatorio). <br>              
              <strong>clave_empleado</strong>: clave empleado del usuario (obligatorio). <br>              
            </div>
          </code>
          <h3 class="titles">Respuesta típica:</h3>
          <code class="code">
            <div class="response indent-1">
json =
        {
            "campo": "valor",
            "campo": "valor",
            
        }
            </div>
          </code>
          <h3 class="titles">Probar:</h3>
          <form class="forms" action="resources/conacyt/login/insertaOactualizaUsuario" method="GET">
            <input type="text" name="json" id="json" size="60" placeholder=" json">
            <input type="submit" value="GET">
          </form>
          <form class="forms" action="resources/conacyt/login/insertaOactualizaUsuario" method="POST">
            <input type="text" name="json" id="json" size="60" placeholder=" json">
            <input type="submit" value="POST">
          </form>
        </div>   
        
        <!--div class="section">
          <h2 class="titles">wscsv</h2>
          <div class="description">
            Servicio mediante el cual se genera un archivo CSV a partir de los datos (en formato JSON) entregados por un servicio web.
          </div>
          <h3 class="titles">Ejemplo:</h3>
          <code class="example">
            <div class="indent-1">
              resources/exportCSV/wscsv
            </div>
            <br>
            <div class="params indent-2">
              <pre>
json =
        {
            "URL": "http://localhost:8080/CSV_WS_GF4-war/resources/JSONDataExample",
            "qualified": true,
            "filename": "myCSV"
        }
              </pre>
            </div>
            <br>
            <div class="indent-1">
              Parámetros:
            </div>
            <br>
            <div class="indent-2">
              <strong>URL</strong>: URL del servicio web al que se hace referencia (Se creo uno de ejemplo y esta contenido en este proyecto) <br>
              <strong>qualified</strong>: indica si los valores en el CSV, deberán calificarse (entrecomillarse) siempre. <br>
              <strong>filename</strong>: nombre que será asignado al archivo CSV. <br>
            </div>
          </code>
          <h3 class="titles">Respuesta típica:</h3>
          <code class="code">
            <div class="response indent-1">
        Entrega el archivo csv
            </div>
          </code>
          <h3 class="titles">Probar:</h3>
          <form class="forms" action="resources/exportCSV/wscsv" method="GET">
            <input type="text" name="json" id="json" size="60" placeholder=" json">
            <input type="submit" value="GET">
          </form>
          <form class="forms" action="resources/exportCSV/wscsv" method="POST">
            <input type="text" name="json" id="json" size="60" placeholder=" json">
            <input type="submit" value="POST">
          </form>
        </div>  
        
       <div class="section">
          <h2 class="titles">dbcsv</h2>
          <div class="description">
            Servicio con el cual se genera un archivo CSV a partir de los datos (en formato JSON) entregados por una consulta a PostgreSQL.
            Existen invocaciones de tipo de datos distintos como: string, file y zip, además de poder indicar o no, un limite de registros a consultar.
          </div>
          <h3 class="titles">Ejemplo:</h3>
          <code class="example">
            <div class="indent-1">
              resources/exportCSV/dbcsv
            </div>
            <br>
            <div class="params indent-2">
              <pre>
json =
        {
            "datasource": "jdbc/collections_curatorial",
            "schema": "public",
            "entity": "biodiversity",
            "fields": "lastmodified, specimen_id, \"occurrence_remarks\"",
            "conditions": "\"lastmodified\" >= \'1899-12-30\'",
            "qualified": "true",
            "filename": "biodiversity_dd-MM-aaaa",
            "kind": "zip",
            "limit": 30000,
            "key": "specimen_id"
        }
              </pre>
            </div>
            <br>
            <div class="indent-1">
              Parámetros:
            </div>
            <br>
            <div class="indent-2">
              <strong>datasource</strong>: nombre del recurso JDBC para conectar a la base de datos (obligatorio). <br>
              <strong>entity</strong>: entidad (tabla o vista) sobre la que se ejecutará la consulta (obligatorio). <br>
              <strong>schema</strong>: esquema al que pertenece la entidad a consultar. Por default "public" (obligatorio). <br>
              <strong>key</strong>: indica mediante que campo de su tabla se ordenará la consulta realizada (obligatorio). <br>
              <strong>kind</strong>: define cual será el tipo para generar el archivo: string o file. (opcional). <br>
            </div>
          </code>
          <h3 class="titles">Respuesta típica:</h3>
          <code class="code">
            <div class="response indent-1">
        Entrega el archivo, según el tipo(kind) definido: csv o zip
            </div>
          </code>
          <h3 class="titles">Probar:</h3>
          <form class="forms" action="resources/exportCSV/dbcsv" method="GET">
            <input type="text" name="json" id="json" size="60" placeholder=" json">
            <input type="submit" value="GET">
          </form>
          <form class="forms" action="resources/exportCSV/dbcsv" method="POST">
            <input type="text" name="json" id="json" size="60" placeholder=" json">
            <input type="submit" value="POST">
          </form>
        </div-->   
          
      </div>
    </div>
  </body>
</html>
