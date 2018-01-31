<%-- 
    Patronato Universitario    
    Universidad Nacional Autónoma de México
    Document   : Página de referencia de los servicios web
    Created on : 27 de Enero, 2018
    Author     : Edith Ordaz <edith.ordaz@patronato.unam.mx><edith.ordaz@gmail.com>
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
                    En particular las Comprobaciones de gastos del proyecto.
                </div>                
                
                <div class="section">
                    <h2 class="titles">obtenerComprobacionesProyecto</h2>
                    <div class="description">
                        Servicio para la Consulta de comprobaciones del proyecto.
                    </div>
                    <h3 class="titles">Ejemplo:</h3>
                    <code class="example">
                        <div class="indent-1">
                            resources/conacyt/proyectos/obtenerComprobacionesProyecto
                        </div>
                        <br>
                        <div class="params indent-2">
                            <pre>
json =
        {
            "clave_proyecto":4,
            "id_recurso":189
        } 
                            </pre>
                        </div>
                        <br>
                        <div class="indent-1">
                            Parámetros:
                        </div>
                        <br>
                        <div class="indent-2">
                            <strong>id_proyecto</strong>:  identificador del proyecto asociado a las comprobaciones a obtener (obligatorio). <br>
                        </div>
                    </code>
                    <h3 class="titles">Respuesta típica:</h3>
                    <code class="code">
                        <div class="response indent-1">
                            <pre>
                    Entrega el JSONArray, con el arreglo de los registros contenidos en el catálogo.                         
                           
json =
        { 
            "id_comprobacion":	1,
            "importe":	"200.25",
            "fecha_reg":"2018-01-29",
            "id_proyecto":	4
            "id_dependencia":	9
            "clave_dependencia":"211"
            "Dependencia_desc":	"COORDINACIÓN DE HUMANIDADES"
            "id_subdependencia":12
            "clave_subdependencia":"214"
            "Subdependencia_descr":"INSTITUTO DE INVESTIGACIONES ESTÉTICAS "
            "id_recurso":   189
            "clave_recurso":	"CY"
            "clave_proyecto":	"101010"
            "proyecto_desc":	"prueba de proyecto"
            "id_cat_documentos":	261
            "documentos_descr":	"NOTAS Y RECIBOS"
            "nombre_archivo":	"prueba4.pdf"
        }
                            </pre>
                        </div>
                    </code>
                    <h3 class="titles">Probar:</h3>
                    <form class="forms" action="resources/conacyt/proyectos/obtenerComprobacionesProyecto" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/obtenerComprobacionesProyecto" method="POST">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="POST">
                    </form>
                </div> 
                
                <!--div class="section">
                    <h2 class="titles">updsertComprobacionesProyecto</h2>
                    <div class="description">
                        Servicio para insertar registro de comprobaciones del proyecto.
                    </div>
                    <h3 class="titles">Ejemplo:</h3>
                    <code class="example">
                        <div class="indent-1">
                            resources/conacyt/proyectos/updsertComprobacionesProyecto
                        </div>
                        <br>
                        <div class="params indent-2">
                            <pre>
json =
        {
            "id_proyecto":4
        } 
                            </pre>
                        </div>
                        <br>
                        <div class="indent-1">
                            Parámetros:
                        </div>
                        <br>
                        <div class="indent-2">
                            <strong>id_proyecto</strong>:  identificador del proyecto asociado a las comprobaciones a obtener (obligatorio). <br>
                        </div>
                    </code>
                    <h3 class="titles">Respuesta típica:</h3>
                    <code class="code">
                        <div class="response indent-1">
                            <pre>
                    Entrega el JSONArray, con el arreglo de los registros contenidos en el catálogo.                         
                           
json =
        { 
            "id_comprobacion":	1,
            "importe":	"200.25",
            "fecha_reg":"2018-01-29",
            "id_proyecto":	4
            "id_dependencia":	9
            "clave_dependencia":"211"
            "Dependencia_desc":	"COORDINACIÓN DE HUMANIDADES"
            "id_subdependencia":12
            "clave_subdependencia":"214"
            "Subdependencia_descr":"INSTITUTO DE INVESTIGACIONES ESTÉTICAS "
            "id_recurso":   189
            "clave_recurso":	"CY"
            "clave_proyecto":	"101010"
            "proyecto_desc":	"prueba de proyecto"
            "id_cat_documentos":	261
            "documentos_descr":	"NOTAS Y RECIBOS"
            "nombre_archivo":	"prueba4.pdf"
        }
                            </pre>
                        </div>
                    </code>
                    <h3 class="titles">Probar:</h3>
                    <form class="forms" action="resources/conacyt/proyectos/updsertComprobacionesProyecto" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/updsertComprobacionesProyecto" method="POST">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="POST">
                    </form>
                </div--> 
            </div>
        </div>
    </body>
</html>
