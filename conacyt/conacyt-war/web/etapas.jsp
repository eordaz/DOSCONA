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
                    En particular las Etapas del proyecto.
                </div>                
                
                <div class="section">
                    <h2 class="titles">obtenerEtapasProyecto</h2>
                    <div class="description">
                        Servicio para la Consulta de comprobaciones del proyecto.
                    </div>
                    <h3 class="titles">Ejemplo:</h3>
                    <code class="example">
                        <div class="indent-1">
                            resources/conacyt/proyectos/obtenerEtapasProyecto
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
            "etapasProyecto":[
                                        {
                                         "id_etapa":1,
                                         "id_recurso":189,                                                                                                                                        
                                         "id_proyecto":4,
                                         "id_ministracion":1,
                                         "id_cat_tipo_gasto":184,
                                         "importe_asignado":"12565.23",
                                         "importe_autorizado":"12565.23",
                                         "id_usuario":1                                                                                                                                           
                                        },
                                        {
                                         "id_etapa":1,
                                         "id_recurso":189,                                                                                                                                        
                                         "id_proyecto":4,
                                         "id_ministracion":1,
                                         "id_cat_tipo_gasto":186,
                                         "importe_asignado":"25368.56",
                                         "importe_autorizado":"25368.56",
                                         "id_usuario":1
                                        },
                                        {
                                         "id_etapa":2,
                                         "id_recurso":189,                                                                                                                                        
                                         "id_proyecto":4,
                                         "id_ministracion":1,
                                         "id_cat_tipo_gasto":186,
                                         "importe_asignado":"204894.56",
                                         "importe_autorizado":"204894.56",
                                         "id_usuario":1
                                         },
                                        {
                                         "id_etapa":3,
                                         "id_recurso":189,                                                                                                                                        
                                         "id_proyecto":4,
                                         "id_ministracion":1,
                                         "id_cat_tipo_gasto":184,
                                         "importe_asignado":"453344.98",
                                         "importe_autorizado":"453344.98",
                                         "id_usuario":1
                                         }                  
                                  ] 
        }
                            </pre>
                        </div>
                    </code>
                    <h3 class="titles">Probar:</h3>
                    <form class="forms" action="resources/conacyt/proyectos/obtenerEtapasProyecto" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/obtenerEtapasProyecto" method="POST">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="POST">
                    </form>
                </div> 
                
                <div class="section">
                    <h2 class="titles">updsertEtapasProyecto</h2>
                    <div class="description">
                        Servicio para insertar registro de etapas del proyecto.
                    </div>
                    <h3 class="titles">Ejemplo:</h3>
                    <code class="example">
                        <div class="indent-1">
                            resources/conacyt/proyectos/updsertEtapasProyecto
                        </div>
                        <br>
                        <div class="params indent-2">
                            <pre>
json = {
            "etapasProyecto":[
                                        {
                                         "id_etapa":1,
                                         "id_recurso":189,                                                                                                                                        
                                         "id_proyecto":4,
                                         "id_ministracion":1,
                                         "id_cat_tipo_gasto":184,
                                         "importe_asignado":"12565.23",
                                         "importe_autorizado":"12565.23",
                                         "id_usuario":1                                                                                                                                           
                                        },
                                        {
                                         "id_etapa":1,
                                         "id_recurso":189,                                                                                                                                        
                                         "id_proyecto":4,
                                         "id_ministracion":1,
                                         "id_cat_tipo_gasto":186,
                                         "importe_asignado":"25368.56",
                                         "importe_autorizado":"25368.56",
                                         "id_usuario":1
                                        },
                                        {
                                         "id_etapa":2,
                                         "id_recurso":189,                                                                                                                                        
                                         "id_proyecto":4,
                                         "id_ministracion":1,
                                         "id_cat_tipo_gasto":186,
                                         "importe_asignado":"204894.56",
                                         "importe_autorizado":"204894.56",
                                         "id_usuario":1
                                         },
                                        {
                                         "id_etapa":3,
                                         "id_recurso":189,                                                                                                                                        
                                         "id_proyecto":4,
                                         "id_ministracion":1,
                                         "id_cat_tipo_gasto":184,
                                         "importe_asignado":"453344.98",
                                         "importe_autorizado":"453344.98",
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
        }
                            </pre>
                        </div>
                    </code>
                    <h3 class="titles">Probar:</h3>
                    <form class="forms" action="resources/conacyt/proyectos/updsertEtapasProyecto" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/updsertEtapasProyecto" method="POST">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="POST">
                    </form>
                </div> 
            </div>
        </div>
    </body>
</html>
