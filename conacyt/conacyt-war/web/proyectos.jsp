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

             "datosGenerales":{
                                "clave_recurso":'CY',
                                "clave_proyecto":'101010',
                                "nombre_proyecto":'JOHONS CORPORATIONS',
                                "id_fondo":201,
                                "fecha_inicio":date,
                                "fecha_fin":date,
                                "importe_total":99256452.22,
                                "id_moneda":192,
                                "id_dependencia":10,
                                "id_subdependencia":14,
                                "id_usuario":1
                              },
             "etapasProyecto":{
                                     "etapa_1": [
                                                    {
                                                     "clave_etapa":1,
                                                     "id_recurso":189,                                                                                                                                        
                                                     "id_cat_tipo_gasto":184,
                                                     "importe_asignado":12565.23,
                                                     "importe_autorizado":12565.23,
                                                     "id_usuario":1                                                                                                                                           
                                                    },
                                                    {
                                                     "clave_etapa":,
                                                     "id_recurso":189,                                                                                                                                        
                                                     "id_cat_tipo_gasto":186,
                                                     "importe_asignado":25368.56,
                                                     "importe_autorizado":25368.56,
                                                     "id_usuario":1
                                                    }
                                                ],
                                     "etapa_2":[
                                                    {
                                                     "clave_etapa":2,
                                                     "id_recurso":189,                                                                                                                                        
                                                     "id_cat_tipo_gasto":186,
                                                     "importe_asignado":204894.56,
                                                     "importe_autorizado":204894.56,
                                                     "id_usuario"
                                                     }
                                                ],
                                     "etapa_3":[
                                                    {
                                                     "clave_etapa":3,
                                                     "id_recurso":189,                                                                                                                                        
                                                     "id_cat_tipo_gasto":184,
                                                     "importe_asignado":453344.98,
                                                     "importe_autorizado":453344.98,
                                                     "id_usuario":1
                                                     }
                                                ]                    
                              },
             "responsables":{
                                "responsable_administrativo": {
                                                                "rfc":'SACV760201GK3',
                                                                "nombre":'VALERIA',
                                                                "apellido_paterno":'SANDOVAL',
                                                                "apellido_materno":'RAMIREZ',
                                                                "clave_empleado":'125874',
                                                                "correo":'',
                                                                "telefono":'',                                                                                                                                  
                                                                "id_usuario":1
                                                               },
                                "responsable_tecnico": {
                                                        "rfc":'SACV760201GK3',,
                                                        "nombre":'VALERIA',
                                                        "apellido_paterno":'SANDOVAL',
                                                        "apellido_materno":'125874',
                                                        "clave_empleado":'',
                                                        "correo":'',
                                                        "telefono":'',                                                                                                                                  
                                                        "id_usuario":1
                                                        },
                                "responsable_legal":{
                                                     "rfc":,
                                                     "nombre":,
                                                     "apellido_paterno":,
                                                     "apellido_materno":,
                                                     "clave_empleado":,
                                                     "correo":,
                                                     "telefono":,                                                                                                                                    
                                                     "id_usuario":
                                                    }
                            },
             "documentos":{
                           "documento":{
                                        "id_documento":250,
                                        "nombre_archivo":'contrato211_01_2018.pdf',
                                        "ruta":/contratos/,
                                        "id_usuario":1
                                       }             
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
