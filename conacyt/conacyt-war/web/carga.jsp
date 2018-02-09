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
          Conjunto de servicios encargados de darle funcionalidad al registro del proyecto CONACYT.
          Específicamente sobre la funcionalidad de la exportación e importación de los archivos.
        </div>

        <div class="section">
          <h2 class="titles">exportarArchivo</h2>
          <div class="description">
            Servicio mediante el cual se obtienen archivos  del fileSystem especificado.
          </div>
          <h3 class="titles">Ejemplo:</h3>
          <code class="example">
            <div class="indent-1">
              resources/conacyt/archivos/exportarArchivo
            </div>
            <br>
            <div class="params indent-2">
              <pre>
json =
        {
            "ruta": "/documentos/personales/proyectos/"  ,          
            "nombre_archivo": "Proyecto_del_dengue"  , 
            "ext": ".pdf"
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
          
          <form class="forms" action="resources/conacyt/archivos/exportarArchivo" enctype="application/x-www-form-urlencoded" method="POST">
              <input type="text" name="json" id="json" size="60" placeholder=" json"> </br>
           <input name="file" id="filename" type="file" /><br><br>
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
        <script>
          private static table getServletInfo(HttpServletRequest request,
        HttpServletResponse response, HttpServlet servlet) {
    table table = new table();
    table.setID("DEBUG");
    Enumeration e;

    tr space = new tr().addElement(new td().addElement("."));
    //  Request Info
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Request Info"))));
    table.addElement(new tr().addElement(new td().addElement("Method"))
            .addElement(new td().addElement(request.getMethod())));
    table.addElement(new tr().addElement(
            new td().addElement("Protocol")).addElement(
            new td().addElement(request.getProtocol())));
    table.addElement(new tr().addElement(new td().addElement("URI"))
            .addElement(new td().addElement(request.getRequestURI())));
    table.addElement(new tr().addElement(
            new td().addElement("Context Path")).addElement(
            new td().addElement(request.getContextPath())));
    table.addElement(new tr().addElement(
            new td().addElement("Servlet Path")).addElement(
            new td().addElement(request.getServletPath())));
    table.addElement(new tr().addElement(
            new td().addElement("Path Info")).addElement(
            new td().addElement(request.getPathInfo())));
    table.addElement(new tr().addElement(
            new td().addElement("Path Translated")).addElement(
            new td().addElement(request.getPathTranslated())));
    table.addElement(new tr().addElement(
            new td().addElement("Query String")).addElement(
            new td().addElement(request.getQueryString())));
    table.addElement(new tr().addElement(
            new td().addElement("Content Length")).addElement(
            new td().addElement("" + request.getContentLength())));
    table.addElement(new tr().addElement(
            new td().addElement("Content Type")).addElement(
            new td().addElement(request.getContentType())));
    table.addElement(new tr().addElement(
            new td().addElement("Character Encoding")).addElement(
            new td().addElement(request.getCharacterEncoding())));
    table.addElement(new tr()
            .addElement(new td().addElement("Locale"))
            .addElement(
                    new td().addElement(request.getLocale().toString())));
    table.addElement(new tr().addElement(new td().addElement("Schema"))
            .addElement(new td().addElement(request.getScheme())));
    table.addElement(new tr().addElement(
            new td().addElement("Server Name")).addElement(
            new td().addElement(request.getServerName())));
    table.addElement(new tr().addElement(
            new td().addElement("Server Port")).addElement(
            new td().addElement("" + request.getServerPort())));
    table.addElement(new tr().addElement(
            new td().addElement("Remote User")).addElement(
            new td().addElement(request.getRemoteUser())));
    table.addElement(new tr().addElement(
            new td().addElement("Remote Address")).addElement(
            new td().addElement(request.getRemoteAddr())));
    table.addElement(new tr().addElement(
            new td().addElement("Remote Host")).addElement(
            new td().addElement(request.getRemoteHost())));
    table.addElement(new tr().addElement(
            new td().addElement("Authorization Type")).addElement(
            new td().addElement(request.getAuthType())));
    table.addElement(new tr().addElement(
            new td().addElement("User Principal")).addElement(
            new td().addElement(request.getUserPrincipal() == null ? ""
                    : request.getUserPrincipal().toString())));
    table.addElement(new tr().addElement(
            new td().addElement("IsSecure")).addElement(
            new td().addElement(request.isSecure() ? "true" : "false")));

    //  Request Attributes
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Request Attributes"))));
    e = request.getAttributeNames();
    while (e.hasMoreElements()) {
        String name = e.nextElement().toString();
        String attrib = request.getAttribute(name).toString();
        table.addElement(new tr().addElement(new td().addElement(name))
                .addElement(new td().addElement(attrib)));
    }

    //  Request Parameter
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Req Parameters"))));
    try {
        String enc = request.getCharacterEncoding();
        if (enc == null)
            request.setCharacterEncoding(MobileEnv.ENCODING);
    } catch (Exception ee) {
        log.log(Level.SEVERE, "Set CharacterEncoding="
                + MobileEnv.ENCODING, ee);
    }
    e = request.getParameterNames();
    while (e.hasMoreElements()) {
        String name = (String) e.nextElement();
        String para = MobileUtil.getParameter(request, name);
        table.addElement(new tr().addElement(new td().addElement(name))
                .addElement(new td().addElement(para)));
    }

    //  Request Header
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Req Header"))));
    e = request.getHeaderNames();
    while (e.hasMoreElements()) {
        String name = (String) e.nextElement();
        if (!name.equals("Cockie")) {
            String hdr = request.getHeader(name);
            table.addElement(new tr().addElement(
                    new td().addElement(name)).addElement(
                    new td().addElement(hdr)));
        }
    }

    //  Request Cookies
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Req Cookies"))));
    Cookie[] cc = request.getCookies();
    if (cc != null) {
        for (int i = 0; i < cc.length; i++) {
            //  Name and Comment
            table.addElement(new tr().addElement(
                    new td().addElement(cc[i].getName())).addElement(
                    new td().addElement(cc[i].getValue())));
            table.addElement(new tr()
                    .addElement(
                            new td().addElement(cc[i].getName()
                                    + ": Comment"))
                    .addElement(new td().addElement(cc[i].getComment())));
            table.addElement(new tr().addElement(
                    new td().addElement(cc[i].getName() + ": Domain"))
                    .addElement(new td().addElement(cc[i].getDomain())));
            table.addElement(new tr()
                    .addElement(
                            new td().addElement(cc[i].getName()
                                    + ": Max Age"))
                    .addElement(
                            new td().addElement("" + cc[i].getMaxAge())));
            table.addElement(new tr().addElement(
                    new td().addElement(cc[i].getName() + ": Path"))
                    .addElement(new td().addElement(cc[i].getPath())));
            table.addElement(new tr()
                    .addElement(
                            new td().addElement(cc[i].getName()
                                    + ": Is Secure"))
                    .addElement(
                            new td().addElement(cc[i].getSecure() ? "true"
                                    : "false")));
            table.addElement(new tr()
                    .addElement(
                            new td().addElement(cc[i].getName()
                                    + ": Version"))
                    .addElement(
                            new td().addElement("" + cc[i].getVersion())));
        }
    } //  Cookies

    //  Request Session Info
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Req Session"))));
    HttpSession session = request.getSession(true);
    table.addElement(new tr().addElement(
            new td().addElement("Session ID")).addElement(
            new td().addElement(session.getId())));
    Timestamp ts = new Timestamp(session.getCreationTime());
    table.addElement(new tr()
            .addElement(new td().addElement("Created")).addElement(
                    new td().addElement(ts.toString())));
    ts = new Timestamp(session.getLastAccessedTime());
    table.addElement(new tr().addElement(
            new td().addElement("Accessed")).addElement(
            new td().addElement(ts.toString())));
    table.addElement(new tr().addElement(
            new td().addElement("Request Session ID")).addElement(
            new td().addElement(request.getRequestedSessionId())));
    table.addElement(new tr().addElement(
            new td().addElement(".. via Cookie")).addElement(
            new td().addElement(""
                    + request.isRequestedSessionIdFromCookie())));
    table.addElement(new tr().addElement(
            new td().addElement(".. via URL")).addElement(
            new td().addElement(""
                    + request.isRequestedSessionIdFromURL())));
    table.addElement(new tr().addElement(new td().addElement("Valid"))
            .addElement(
                    new td().addElement(""
                            + request.isRequestedSessionIdValid())));

    //  Request Session Attributes
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Session Attributes"))));
    e = session.getAttributeNames();
    while (e.hasMoreElements()) {
        String name = (String) e.nextElement();
        String attrib = session.getAttribute(name).toString();
        table.addElement(new tr().addElement(new td().addElement(name))
                .addElement(new td().addElement(attrib)));
    }

    //  Response Info
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Response"))));
    table.addElement(new tr().addElement(
            new td().addElement("Buffer Size"))
            .addElement(
                    new td().addElement(String.valueOf(response
                            .getBufferSize()))));
    table.addElement(new tr().addElement(
            new td().addElement("Character Encoding")).addElement(
            new td().addElement(response.getCharacterEncoding())));
    table.addElement(new tr()
            .addElement(new td().addElement("Locale"))
            .addElement(
                    new td().addElement(response.getLocale() == null ? "null"
                            : response.getLocale().toString())));

    //  Servlet
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Servlet"))));
    table.addElement(new tr().addElement(new td().addElement("Name"))
            .addElement(new td().addElement(servlet.getServletName())));
    table.addElement(new tr().addElement(new td().addElement("Info"))
            .addElement(new td().addElement(servlet.getServletInfo())));

    //  Servlet Init
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Servlet Init Parameter"))));
    e = servlet.getInitParameterNames();
    //  same as:  servlet.getServletConfig().getInitParameterNames();
    while (e.hasMoreElements()) {
        String name = (String) e.nextElement();
        String para = servlet.getInitParameter(name);
        table.addElement(new tr().addElement(new td().addElement(name))
                .addElement(new td().addElement(para)));
    }

    //  Servlet Context
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Servlet Context"))));
    ServletContext servCtx = servlet.getServletContext();
    e = servCtx.getAttributeNames();
    while (e.hasMoreElements()) {
        String name = (String) e.nextElement();
        String attrib = servCtx.getAttribute(name).toString();
        table.addElement(new tr().addElement(new td().addElement(name))
                .addElement(new td().addElement(attrib)));
    }

    //  Servlet Context
    table.addElement(space);
    table.addElement(new tr().addElement(new td().addElement(new h3(
            "Servlet Context Init Parameter"))));
    e = servCtx.getInitParameterNames();
    while (e.hasMoreElements()) {
        String name = (String) e.nextElement();
        String attrib = servCtx.getInitParameter(name).toString();
        table.addElement(new tr().addElement(new td().addElement(name))
                .addElement(new td().addElement(attrib)));
    }

    /*  */
    return table;
}</script>
      </div>
    </div>
  </body>
</html>
