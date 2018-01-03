<%@ include file="validaSesion.jsp" %>
<jsp:useBean id = "visitante" scope = "page"
   class = "com.datco.primer.jsp.beans.BeanAccion" />
<jsp:useBean id = "datosObservacion" scope = "request"
   class = "com.datco.primer.jsp.beans.BeanDatosObservacion" />
<jsp:useBean id = "datosFile" scope = "request"
   class = "com.datco.primer.jsp.beans.FileManager" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MARConacyt</title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="../dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script language="javascript" type="text/javascript">
function enviar(pagina){
document.frmCaptura.action = pagina;
document.frmCaptura.submit();
}
</script>

</head>
<body>
<p>
  <jsp:setProperty name = "visitante" property = "*" />   
<%

String sFolio ="";

if (session.getAttribute("folio")!= null) {
	sFolio = session.getAttribute("folio").toString();
}

	int rs = 0;
    String var = "0"; 
    var = datosObservacion.consecutivoObs();
	visitante.setIdObservacion(Integer.parseInt(var));

    if ( visitante.getAccion() == null ||
    		visitante.getFechaAccion() == null )
    		{

   %>
</p>
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"></a>
            </div>
            <!-- /.navbar-header -->


            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
							<p><img src="../img/capufe-120px.png" /></p>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="registro.jsp"><i class="fa fa-edit fa-fw"></i> Registrar Observacion</a>
                        </li>
                        <li>
                            <a href="Accion/BuscaAccion.jsp"><i class="fa fa-table fa-fw"></i> Registrar Accion</a>
                        </li>
                        <li>
                            <a href="File/registroArchivos.jsp"><i class="fa fa-files-o fa-fw"></i> Subir Archivos</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>


	<form name="frmCaptura" method="post" action="registroAccion.jsp">

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Registro de Acci&oacute;n </h1>
                    <p class="page-header">Folio
                      <input type="text" name="folio" value="<%=sFolio%>" ></p>
					
      <!-- /.col-lg-4 -->
      <div class="panel panel-primary">
        <div class="panel-heading"> Registro de Acci&oacute;n </div>
        <div class="panel-body">
          <table width="100%" border="0" >
            <tr>
              <td><table width="100%" border="0">
                  <tr>
                    <td>Fecha de Acci&oacute;n
                      <input type="text" name="fechaAccion"></td>
                    <td>&nbsp;</td>
                  </tr>
                </table>
                  <table width="100%" border="0">
                    <tr>
                      <td>Acciones
                        <textarea name="accion" cols="80"></textarea></td>
                    </tr>
                </table></td>
            </tr>
          </table>
          <h4>&nbsp;</h4>
          </div>
      </div>
      <!-- /.col-lg-4 -->
      <h4>&nbsp;</h4>
        <table width="100%" border="0">
        <tr>
          <td><div align="center" class="panel-body">
				<button type="submit" class="btn btn-success">Guardar</button>
          </div></td>
          <td><div align="center" class="panel-body">
              <button type="reset" class="btn btn-info">Restablecer</button>
          </div></td>
          <td><div align="center" class="panel-body">
		  	<button type="button" class="btn btn-warning" onClick="enviar('inicioAuditor.jsp')">Cancelar</button>
          </div></td>
        </tr>
      </table>
      <%

      }
      else {
 
         rs=datosObservacion.agregarAccion(visitante);

         if (rs>0) {
        	 
        	 //session.setAttribute("folio", sFolioTmp);
        	 
   			%>
      <jsp:forward page="NotificaRegistroAccion.jsp"/>
      
      <%	
   		}
   		else {
  %>
      <script>
   				history.back();
			</script>
      <%		
   			
   		}
      }

  %>
</form>					
					
					
					
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
          <div class="row"><!-- /.col-lg-8 -->
              <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../bower_components/raphael/raphael-min.js"></script>
    <script src="../bower_components/morrisjs/morris.min.js"></script>
    <script src="../js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
