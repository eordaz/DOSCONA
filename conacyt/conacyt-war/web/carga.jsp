<%-- 
    Patronato Universitario    
    Universidad Nacional Autónoma de México
    Document   : Página de referencia de los servicios web
    Created on : 02 de Enero, 2018
    Author     : Veronica Sánchez <veronica.sanchez@patronato.unam.mx>
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
          <h2 class="titles">getArchivo</h2>
          <div class="description">
            Servicio mediante el cual se obtienen archivos  del fileSystem especificado.
          </div>
          <h3 class="titles">Ejemplo:</h3>
          <code class="example">
            <div class="indent-1">
              resources/conacyt/archivos/getArchivo
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
         
json =
        {"num_proyecto":2342,"nombre_archivo":"2342.pdf","valor":"true"}    
            </div>
          </code>
          <h3 class="titles">Probar:</h3>
          
          <form class="forms" action="resources/conacyt/archivos/getArchivo" enctype="multipart/form-data" method="POST">
           <input name="file" id="filename" type="file" /><br><br>
            <input type="submit" value="POST">
          </form>
        </div>
          
        <div class="section">
                    <h2 class="titles">obtenerDocumentosProyecto</h2>
                    <div class="description">
                        Servicio para la Consulta de documentos del proyecto.
                    </div>
                    <h3 class="titles">Ejemplo:</h3>
                    <code class="example">
                        <div class="indent-1">
                            resources/conacyt/proyectos/obtenerDocumentosProyecto
                        </div>
                        <br>
                        <div class="params indent-2">
                            <pre>
json =  {
            "id_proyecto":4, 
        }                          
                            </pre>
                        </div>
                        <br>
                        <div class="indent-1">
                            Parámetros:
                        </div>
                        <br>
                        <div class="indent-2">
                            <strong>id_proyecto</strong>:  identificador del proyecto asociado a los documentos a obtener (obligatorio). <br>
                        </div>
                    </code>
                    <h3 class="titles">Respuesta típica:</h3>
                    <code class="code">
                        <div class="response indent-1">
                            <pre>
                    Entrega el JSONArray, con el arreglo de los registros contenidos en el catálogo.                         
                           
json =
        {
            "documentos":[
                                {
                                    "id_cat_documentos":250,
                                    "id_proyecto":4,
                                    "nombre_archivo":'contrato211_01_2018.pdf',
                                    "ruta":"/contratos/",
                                    "id_comprobacion":1,
                                    "id_usuario":1
                                }             
                          ]
        }
                            </pre>
                        </div>
                    </code>
                    <h3 class="titles">Probar:</h3>
                    <form class="forms" action="resources/conacyt/proyectos/obtenerDocumentosProyecto" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/obtenerDocumentosProyecto" method="POST">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="POST">
                    </form>
                </div> 
                
                <div class="section">
                    <h2 class="titles">updsertDocumentoProyecto</h2>
                    <div class="description">
                        Servicio para insertar registro de documentos del proyecto.
                    </div>
                    <h3 class="titles">Ejemplo:</h3>
                    <code class="example">
                        <div class="indent-1">
                            resources/conacyt/proyectos/updsertDocumentoProyecto
                        </div>
                        <br>
                        <div class="params indent-2">
                            <pre>
json = {
            "documentos":[
                                {
                                    "id_cat_cat_documentos":250,
                                    "nombre_archivo":'contratoooooooo211_02_2018.pdf',
                                    "ruta":"/contratos/",
                                    "id_usuario":1
                                }             
                          ]
        }
                            </pre>
                        </div>
                        <br>
                        <div class="indent-1">
                            Parámetros:
                        </div>
                        <br>
                        <div class="indent-2">
                            <strong>id_proyecto</strong>:  identificador del proyecto asociado a los responsables a obtener (obligatorio). <br>
                        </div>
                    </code>
                    <h3 class="titles">Respuesta típica:</h3>
                    <code class="code">
                        <div class="response indent-1">
                            <pre>
                    Entrega el JSONArray, con el arreglo de los registros contenidos.                         
                           
json =
        { 
            "updsertDocumentosProyecto":	1,
            "mensaje":	"Se agregaron documentos de proyecto exitosamente",
        }
                            </pre>
                        </div>
                    </code>
                    <h3 class="titles">Probar:</h3>
                    <form class="forms" action="resources/conacyt/proyectos/updsertDocumentoProyecto" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/updsertDocumentoProyecto" method="POST">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="POST">
                    </form>
                </div>

       <!--div class="section">
          <h2 class="titles">datoscsv</h2>
          <div class="description">
            Servicio encargado de generar un archivo CSV a partir de datos en formato JSON.
          </div>
          <h3 class="titles">Ejemplo:</h3>
          <code class="example">
            <div class="indent-1">
              resources/exportCSV/datoscsv
            </div>
            <br>
            <div class="params indent-2">
              <pre>
json =
        {
            "data": [
                ["h1", "h2"],
                [1, 2],
                ["algo,tóoodo", "otro"]
            ],
            "qualified": "true",
            "filename": "myCSV.csv"
        }
              </pre>
            </div>
            <br>
            <div class="indent-1">
              Parámetros:
            </div>
            <br>
            <div class="indent-2">
              <strong>data</strong>: arreglo bidimensional de datos. Los elementos deben de ser del mismo tamaño; se considerará  que el primer elemento contiene los encabezados y los siguientes a los valores (obligatorio). <br>              
            </div>
          </code>
          <h3 class="titles">Respuesta típica:</h3>
          <code class="code">
            <div class="response indent-1">
        Entrega el archivo csv
            </div>
          </code>
          <h3 class="titles">Probar:</h3>
          <form class="forms" action="resources/exportCSV/datoscsv" method="GET">
            <input type="text" name="json" id="json" size="60" placeholder=" json">
            <input type="submit" value="GET">
          </form>
          <form class="forms" action="resources/exportCSV/datoscsv" method="POST">
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
