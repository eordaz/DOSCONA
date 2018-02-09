<%-- 
    Patronato Universitario    
    Universidad Nacional Autónoma de México
    Document   : Página de referencia de los servicios web
    Created on : 02 de Enero, 2018
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
                    Conjunto de servicios encargados de darle funcionalidad al registro de proyectos CONACYT.
                    Incluyendo servicios involucrado como: etapas del proyecto, responsables del proyecto, documentos del proyecto.
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
            "id_recurso":189,
            "clave_proyecto": "101010"
        } 
                            </pre>
                        </div>
                        <br>
                        <div class="indent-1">
                            Parámetros:
                        </div>
                        <br>
                        <div class="indent-2">
                            <strong>id_recurso</strong>:  identificador del proyecto a obtener (obligatorio). <br>
                            <strong>clave_proyecto</strong>:  clave del proyecto a obtener (obligatorio). <br>
                        </div>
                    </code>
                    <h3 class="titles">Respuesta típica:</h3>
                    <code class="code">
                        <div class="response indent-1">
                            <pre>
                    Entrega el JSONArray, con el arreglo del registro solicitado.
                
json =
        {             
            "clave_proyecto":"101010",
            "clave_recurso":"CY", 
            "estatus":"Activo",...
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
                    <h2 class="titles">obtenerResponsablesProyecto</h2>
                    <div class="description">
                        Servicio para la Consulta de responsables del proyecto.
                    </div>
                    <h3 class="titles">Ejemplo:</h3>
                    <code class="example">
                        <div class="indent-1">
                            resources/conacyt/proyectos/obtenerResponsablesProyecto
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
            "responsables":{
                                {
                                    "id_cat_tipo_responsable":'207',
                                    "rfc":'SACV760201GK3',
                                    "nombre":'VALERIA',
                                    "apellido_paterno":'SANDOVAL',
                                    "apellido_materno":'RAMIREZ',
                                    "clave_empleado":'125874',
                                    "correo":'correo@unam.mx',
                                    "telefono":'12332233',                                                                                                                                  
                                    "id_usuario":1
                                },
                                {
                                    "id_cat_tipo_responsable":'208',
                                    "rfc":'SACV760201GK3',
                                    "nombre":'VALERIA',
                                    "apellido_paterno":'SANDOVAL',
                                    "apellido_materno":'125874',
                                    "clave_empleado":'rt54443',
                                    "correo":'correo2@gmail.com',
                                    "telefono":'56438556',                                                                                                                                  
                                    "id_usuario":1
                                },
                                {
                                    "id_cat_tipo_responsable":'209',
                                    "rfc":"OAGE810407",
                                    "nombre":"Edith",
                                    "apellido_paterno":"Ordaz",
                                    "apellido_materno":"Garnica",
                                    "clave_empleado":"dr54567",
                                    "correo":"edith@hotmail.com",
                                    "telefono":"5528490741",                                                                                                                                    
                                    "id_usuario":1
                                }
                            } 
        }
                            </pre>
                        </div>
                    </code>
                    <h3 class="titles">Probar:</h3>
                    <form class="forms" action="resources/conacyt/proyectos/obtenerResponsablesProyecto" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/obtenerResponsablesProyecto" method="POST">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
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
                                "id_fondo":201,
                                "id_moneda":192,
                                "id_recurso":189,
                                "clave_proyecto":'101010',
                                "nombre_proyecto":'JOHONS CORPORATIONS',
                                "id_dependencia":10,
                                "id_subdependencia":14,
                                "importe_total":"99256452.22",
                                "fecha_inicio":"2018-01-29",
                                "fecha_fin":"2018-01-30",
                                "id_usuario":1
                              },
             "etapasProyecto":[
                                    {
                                     "id_etapa":1,
                                     "id_recurso":189, 
                                     "id_ministracion":1,
                                     "id_cat_tipo_gasto":184,
                                     "importe_asignado":"12565.23",
                                     "importe_autorizado":"12565.23",
                                     "id_usuario":1                                                                                                                                           
                                    },
                                    {
                                     "id_etapa":1,
                                     "id_recurso":189, 
                                     "id_ministracion":4,
                                     "id_cat_tipo_gasto":186,
                                     "importe_asignado":"25368.56",
                                     "importe_autorizado":"25368.56",
                                     "id_usuario":1
                                    },
                                    {
                                     "id_etapa":2,
                                     "id_recurso":189, 
                                     "id_ministracion":4,
                                     "id_cat_tipo_gasto":186,
                                     "importe_asignado":"204894.56",
                                     "importe_autorizado":"204894.56",
                                     "id_usuario":1
                                     },
                                    {
                                     "id_etapa":3,
                                     "id_recurso":189,
                                     "id_ministracion":4,
                                     "id_cat_tipo_gasto":184,
                                     "importe_asignado":"453344.98",
                                     "importe_autorizado":"453344.98",
                                     "id_usuario":1
                                     }                  
                              ],
             "responsables":[
                                {
                                    "id_cat_tipo_responsable":'207',
                                    "rfc":'SACV760201GK3',
                                    "nombre":'VALERIA',
                                    "apellido_paterno":'SANDOVAL',
                                    "apellido_materno":'RAMIREZ',
                                    "clave_empleado":'125874',
                                    "correo":'correo@unam.mx',
                                    "telefono":'12332233',                                                                                                                                  
                                    "id_usuario":1
                                },
                                {
                                    "id_cat_tipo_responsable":'208',
                                    "rfc":'SACV760201GK3',
                                    "nombre":'VALERIA',
                                    "apellido_paterno":'SANDOVAL',
                                    "apellido_materno":'125874',
                                    "clave_empleado":'rt54443',
                                    "correo":'correo2@gmail.com',
                                    "telefono":'56438556',                                                                                                                                  
                                    "id_usuario":1
                                },
                                {
                                    "id_cat_tipo_responsable":'209',
                                    "rfc":"OAGE810407",
                                    "nombre":"Edith",
                                    "apellido_paterno":"Ordaz",
                                    "apellido_materno":"Garnica",
                                    "clave_empleado":"dr54567",
                                    "correo":"edith@hotmail.com",
                                    "telefono":"5528490741",                                                                                                                                    
                                    "id_usuario":1
                                }
                            ],
             "documentos":[
                                {
                                    "id_cat_documentos":250,
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
                    <form class="forms" action="resources/conacyt/proyectos/insertarOactualizarProyecto" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/insertarOactualizarProyecto" method="POST">
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
            "updsertEtapasProyecto":	1,
            "mensaje":	"Se agregaron etapas de proyecto exitosamente"
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

                <div class="section">
                    <h2 class="titles">updsertResponsablesProyecto</h2>
                    <div class="description">
                        Servicio para insertar registro de responsables del proyecto.
                    </div>
                    <h3 class="titles">Ejemplo:</h3>
                    <code class="example">
                        <div class="indent-1">
                            resources/conacyt/proyectos/updsertResponsablesProyecto
                        </div>
                        <br>
                        <div class="params indent-2">
                            <pre>
json = {
            "responsables":[
                                {
                                    "id_proyecto":4,
                                    "id_cat_tipo_responsable":'207',
                                    "rfc":'SACV760201GK3',
                                    "nombre":'VALERIA',
                                    "apellido_paterno":'SANDOVAL',
                                    "apellido_materno":'RAMIREZ',
                                    "clave_empleado":'125874',
                                    "correo":'correo@unam.mx',
                                    "telefono":'12332233',                                                                                                                                  
                                    "id_usuario":1
                                },
                                {
                                    "id_proyecto":4,
                                    "id_cat_tipo_responsable":'208',
                                    "rfc":'SACV760201GK3',
                                    "nombre":'VALERIA',
                                    "apellido_paterno":'SANDOVAL',
                                    "apellido_materno":'125874',
                                    "clave_empleado":'rt54443',
                                    "correo":'correo2@gmail.com',
                                    "telefono":'56438556',                                                                                                                                  
                                    "id_usuario":1
                                },
                                {
                                    "id_proyecto":4,
                                    "id_cat_tipo_responsable":'209',
                                    "rfc":"OAGE810407",
                                    "nombre":"Edith",
                                    "apellido_paterno":"Ordaz",
                                    "apellido_materno":"Garnica",
                                    "clave_empleado":"dr54567",
                                    "correo":"edith@hotmail.com",
                                    "telefono":"5528490741",                                                                                                                                    
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
            "updsertResponsablesProyecto":	1,
            "mensaje":	"Se agregaron responsables de proyecto exitosamente"
        }
                            </pre>
                        </div>
                    </code>
                    <h3 class="titles">Probar:</h3>
                    <form class="forms" action="resources/conacyt/proyectos/updsertResponsablesProyecto" method="GET">
                        <input type="text" name="json" id="json" size="60" placeholder=" json">
                        <input type="submit" value="GET">
                    </form>
                    <form class="forms" action="resources/conacyt/proyectos/updsertResponsablesProyecto" method="POST">
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
            
            "updsertEtapasProyecto":	1,
            "mensaje":	"Se agregó proyecto exitosamente: Datos Genarles, Representantes, Etapas y Documentos."
        
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
            </div>
        </div>
    </body>
</html>
