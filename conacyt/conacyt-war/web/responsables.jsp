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
                    En particular los Responsables del proyecto.
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
            "mensaje":	"Se agregaron responsables de proyecto exitosamente",
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
            </div>
        </div>
    </body>
</html>
