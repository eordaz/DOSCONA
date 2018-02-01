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
            "clave_proyecto":101010,
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
            "id_proyecto":4,
            "id_cheque":4,
            "id_etapa_proyecto":1,
            "concepto":"212",		
            "importe":200.25,        
            "id_usuario":10,
            "id_tipo_gasto":10,
            "id_cat_cat_documento":210
            "nombre_archivo":"prueba4.pdf",
            "ruta":"/contratos"
            "seri":"serie",
            "folio":"folioX"
            "rfc":"OALE810506H7E",
            "importe_documento":"es el mismo que el de arriba"
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
                
                <div class="section">
                    <h2 class="titles">updsertComprobacionesP</h2>
                    <div class="description">
                        Servicio para insertar registro de comprobaciones del proyecto.
                    </div>
                    <h3 class="titles">Ejemplo:</h3>
                    <code class="example">
                        <div class="indent-1">
                            resources/conacyt/proyectos/updsertComprobacionesP
                        </div>
                        <br>
                        <div class="params indent-2">
                            <pre>
json =
        {            
            "id_recurso":189,
            "clave_proyecto":101010,
            "id_cheque":4,
            "id_etapa_proyecto":1,
            "concepto":"212",		
            "importe":200.25, 
            "no_total_documentos":3,
            "id_usuario":10,
            "id_tipo_gasto":10,
            "id_cat_cat_documento":210,
            "nombre_archivo":"prueba4.pdf"           
        } 
                            </pre>
                        </div>
                        <br>
                        <div class="indent-1">
                            Parámetros:
                        </div>
                        <br>
                        <div class="indent-2">
                            <strong>clave_proyecto</strong>:  clave del proyecto asociado a las comprobaciones a obtener (obligatorio). <br>
                            <strong>id_recurso</strong>:  identificador del recurso proyecto asociado a las comprobaciones a obtener (obligatorio). <br>
                        </div>
                    </code>
                    <h3 class="titles">Respuesta típica:</h3>
                    <code class="code">
                        <div class="response indent-1">
                            <pre>
                    Entrega el JSONArray, con el arreglo de los registros contenidos en el catálogo.                         
                           
json =
        { 
            { 
            "updsertComprobaciones":	1,
            "mensaje":	"Se agregó comprobación de proyecto exitosamente"
        }
        
                            </pre>
                        </div>
                    </code>
                    <h3 class="titles">Probar:</h3>
                    <form class="forms" action="resources/conacyt/proyectos/updsertComprobacionesP" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/updsertComprobacionesP" method="POST">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="POST">
                    </form>
                </div> 
            </div>
        </div>
    </body>
</html>
