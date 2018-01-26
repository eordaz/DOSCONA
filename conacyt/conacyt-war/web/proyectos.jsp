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
                    <h2 class="titles">obtenerProyectosPorClave</h2>
                    <div class="description">
                        Servicio para la Consulta de proyectos de la Dependencia Rol.
                    </div>
                    <h3 class="titles">Ejemplo:</h3>
                    <code class="example">
                        <div class="indent-1">
                            resources/conacyt/proyectos/obtenerProyectosPorClave
                        </div>
                        <br>
                        <div class="params indent-2">
                            <pre>
json =
        {
            "clave_proyecto": "CY101010",
            "esComprobacion": false
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
                            <pre>
                    Entrega el JSONArray, con el arreglo de los registros contenidos en el catálogo.
                    En caso de ser true el campo "esComprobacion" la respuesta cambia.
                    p.ej.: 
                          "EsComprobacion":false
                            
json =
        { 
            "clave_proyecto":"101010",
            "clave_recurso":"CY", 
            "estatus":"Activo",...
        }
                           
                          "EsComprobacion"true
                           
json =
        { 
            "comprobacion":"101010",
            "importe_comprobacion":"$12,345", 
            "tipo_doc": "Documento", 
            "path":"/archivos/comprobacion/doc_comp.docx"
        }
                            </pre>
                        </div>
                    </code>
                    <h3 class="titles">Probar:</h3>
                    <form class="forms" action="resources/conacyt/proyectos/obtenerProyectosPorClave" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/obtenerProyectosPorClave" method="POST">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="POST">
                    </form>
                </div> 
                <div class="section">
                    <h2 class="titles">insertarOactualizarProyecto</h2>
                    <div class="description">
                        Servicio para la operaciòn insert o update de proyectos CONACYT.
                    </div>
                    <h3 class="titles">Ejemplo:</h3>
                    <code class="example">
                        <div class="indent-1">
                            resources/conacyt/proyectos/insertarOactualizarProyecto
                        </div>
                        <br>
                        <div class="params indent-2">
                            <pre>
json =
        {
            "proyecto":
                        {            
                            "id_fondo": 201,
                            "id_moneda": 194,
                            "id_recurso": 189,
                            "clave_proyecto": "101010",
                            "nombre_proyecto": "Nombre del proyecto.",
                            "id_cat_dependencia": 9,
                            "id_cat_subdependencia": 12,
                            "importe": 135,897,
                            "fecha_inicio": "2018-01-17 16:14:56",
                            "fecha_fin": "2019-01-17 16:14:56",
                            "fecha_registro": now(),
                            "fecha_actualizacion": now(),
                            "estatus": 'Activo',
                            "usuario_id":"eordaz"
                        }
            "documento":
                        {
                            "nombre_archivo": "Nombre_del_contrato.pdf",
                            "ruta": "/Convenios/Recurso/Conacyt/Ejercicio/2018/211_01/CY101010/Contratos/",
                            "serie": 189,
                            "folio": "ABC2345",
                            "rfc": "OAGE8706705",
                            "importe": 135,897,
                            "fecha_registro": now(),
                            "fecha_actualizacion": now(),
                            "estatus": 'Activo',
                            "usuario_id":"eordaz"
                        }    
        }        
                            </pre>
                        </div>
                        <br>
                        <div class="indent-1">
                            Parámetros:
                        </div>
                        <br>
                        <div class="indent-2">
                            <strong>proyecto</strong>:  parámetros que se requieren para la inserción de un proyecto CONACYT (obligatorio). <br>
                            <strong>documento</strong>:  parámetros que se requieren para la inserción del documento que se integra en el proyecto CONACYT (obligatorio). <br>
                        </div>
                    </code>
                    <h3 class="titles">Respuesta típica:</h3>
                    <code class="code">
                        <div class="response indent-1">
                            <pre>
                    Entrega el JSONArray, con el arreglo de los registros contenidos en el catálogo.
                    En caso de ser true el campo "esComprobacion" la respuesta cambia.
                    p.ej.: 
                          "Insert or Update"
json =                            
        {
            "proyecto":
                        {            
                            "id_proyecto": 189,
                            "valor": True,
                            "mensaje": "Su proyecto fue insertado/actualizado con éxito"
                        }
            "documento":
                        {
                            "id_proyecto": 179,
                            "valor": True,
                            "mensaje": "Su documento fue insertado/actualizado con éxito"
                        }    
        }                                           
                            </pre>
                        </div>
                    </code>
                    <h3 class="titles">Probar:</h3>
                    <form class="forms" action="resources/conacyt/proyectos/insertarOactualizarProyecto" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/insertarOactualizarProyecto" method="POST">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="POST">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
