<%-- 
    Patronato Universitario    
    Universidad Nacional Autónoma de México
    Document   : Página de referencia de los servicios web
    Created on : 02 de Enero, 2018
    Author     : Edith C. Ordaz <edith.ordaz@patronato.unam.mx><edith.ordaz@gmail.com>
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
          Conjunto de servicios encargados de darle funcionalidad al proyecto de registro de CONACYT.
        </div>

        <div class="section">
          <h2 class="titles">getCatalogo</h2>
          <div class="description">
            Servicio mediante el cual se obtienen los registros del catálogo especificado.
          </div>
          <h3 class="titles">Ejemplo:</h3>
          <code class="example">
            <div class="indent-1">
              resources/conacyt/catalogos/getCatalogo
            </div>
            <br>
            <div class="params indent-2">
              <pre>
json =
        {
            "tabla": "cat_fondos"            
        } 
              </pre>
            </div>
            <br>
            <div class="indent-1">
              Parámetros:
            </div>
            <br>
            <div class="indent-2">
              <strong>tabla</strong>:  Nombre de la tabla del catálogo a obtener (obligatorio). <br>
            </div>
          </code>
          <h3 class="titles">Respuesta típica:</h3>
          <code class="code">
            <div class="response indent-1">
        Entrega el JSONArray, con el arreglo de los registros contenidos en el catálogo.
        [ 
          {"id_cat_cat_catalogos":2,"valor":"Administrador","descripcion":"Rol asignado para Administrador"},
          {"id_cat_cat_catalogos":3,"valor":"Dependencia","descripcion":"Rol asignada para Dependencias"} 
        ]
            </div>
          </code>
          <h3 class="titles">Probar:</h3>
          <form class="forms" action="resources/conacyt/catalogos/getCatalogo" method="GET">
            <input type="text" name="json" id="json" size="60" placeholder=" json">
            <input type="submit" value="GET">
          </form>
          <form class="forms" action="resources/conacyt/catalogos/getCatalogo" method="POST">
            <input type="text" name="json" id="json" size="60" placeholder=" json">
            <input type="submit" value="POST">
          </form>
        </div>

       <div class="section">
          <h2 class="titles">getSubdependencias</h2>
          <div class="description">
            Servicio mediante el cual se obtienen los registros de lassubdependencias que contiene la dependencia seleccionada.
          </div>
          <h3 class="titles">Ejemplo:</h3>
          <code class="example">
            <div class="indent-1">
              resources/conacyt/catalogos/getSubdependencias
            </div>
            <br>
            <div class="params indent-2">
              <pre>
json =        
          {
            "id_cat_catalogo": 9
          }       
            </pre>
            </div>
            <br>
            <div class="indent-1">
              Parámetros:
            </div>
            <br>
            <div class="indent-2">
              <strong>id_cat_catalogo</strong>: identificador de la dependencia (obligatorio). <br>                   
            </div>
          </code>
          <h3 class="titles">Respuesta típica:</h3>
          <code class="code">
            <div class="response indent-1">
json =
        [
           {
            "id_cat_subdependencia": 1,
            "clave_subdependencia": 01,
            "descripcion":"DIVISION DE ESTUDIOS PROFESIONALES"
           },
           {
            "id_cat_subdependencia": 2,
            "clave_subdependencia": 03,
            "descripcion":"CENTRO DE INVESTIGACIÓN INTERDISCIPLINARIAS EN CIENCIAS Y HUMANIDADES"
           }
        ] 
            </div>
          </code>
          <h3 class="titles">Probar:</h3>
          <form class="forms" action="resources/conacyt/catalogos/getSubdependencias" method="GET">
            <input type="text" name="json" id="json" size="60" placeholder=" json">
            <input type="submit" value="GET">
          </form>
          <form class="forms" action="resources/conacyt/catalogos/getSubdependencias" method="POST">
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
