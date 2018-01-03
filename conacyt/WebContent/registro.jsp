<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<jsp:useBean id = "visitante" scope = "page"
   class = "com.datco.primer.jsp.beans.BeanObservacion" />
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
<script language="javascript" src="../scripts/comunes.js"></script>
<jsp:setProperty name = "visitante" property = "*" />   

  <%
	int rs = 0;
    String var = "0"; 
    Date date = new Date();
    var = datosObservacion.consecutivoObs();
	visitante.setIdObservacion(Integer.parseInt(var));

	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String strDate = sdf.format(date);
    visitante.setFechaRegistro(strDate);

    if ( visitante.getObservacion() == null ||
    		visitante.getObservacion().equalsIgnoreCase("") ||
    		visitante.getIdUnidadResponsable()<0 )
    		{

   %>

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
                            <a href="File/registroArchivos.jsp"><i class="fa fa-files-o fa-fw"></i> Subir Archivos</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Registro de Observaci&oacute;n </h1>
					
	<form name="frmCaptura" method="post" action="registro.jsp">
      <!-- /.col-lg-4 -->
      <div class="panel panel-primary">
        <div class="panel-heading"> Crear Registro de Observaci&oacute;n </div>
        <div class="panel-body">
          <table width="100%" border="0">
            <tr>
              <td><table width="100%" border="0">
				<tr><td>
					<table width="100%" border="0">
                      <tr>
                        <td><label>Folio: </label> Por asignar </td>
                        <td><label>Fecha Registro: </label>
                          <%= " " + visitante.getFechaRegistro()%></td>
                        <td><label>Estatus: </label> En captura </td>
                      </tr>
                    </table>
				</td>
				</tr>
                  <tr>
                    <td><div class="form-group">
                         <label><br>
                         Tipo Observaci&oacute;n</label>
                        <select class="form-control" name="idTipoObservacion">
                          <option value="0">- Seleccionar -</option>
                          <option value="1">Analisis Estadistico</option>
                          <option value="2">Auditoria de Seguridad Vial</option>
                          <option value="3">Centro de Informacion Directiva</option>
                          <option value="4">Seguro del Usuario</option>
                          <option value="5">Servicio Medico</option>
                          <option value="6">Otras Observaciones de OC</option>
                          <option value="7">Otras Observaciones de UR</option>
                        </select>
						</div>
                    </td>
                  </tr>
                  <tr>
                    <td>
						<div class="form-group">
                         <label>Ubicaci&oacute;n</label>
                        <select class="form-control" id="idUbicacion" name="idUbicacion" onChange="muestraDivision();">
                          <option value="0">- Seleccionar -</option>
						  <option value="1">Autopista/Camino</option>
                          <option value="2">Tramo</option>
                          <option value="3">Puente</option>
                          <option value="4">Plaza de Cobro</option>
                        </select>
						</div>
                    </td>
                  </tr>
                  <tr>
                    <td><div class="form-group">
                         <label>Unidad Regional Responsable </label>
                      <select class="form-control" onChange="cargarComboPlazaCobro('Consultas/plazaCobro.jsp', 'idUnidadResponsable', 'div_plaza_cobro');
                      cargarComboCamino('Consultas/camino.jsp', 'idUnidadResponsable', 'div_camino');
                      cargarComboPuente('Consultas/puente.jsp', 'idUnidadResponsable', 'div_puente');
                      cargarComboTramo('Consultas/tramo.jsp', 'idUnidadResponsable', 'div_tramo')" id="idUnidadResponsable" name="idUnidadResponsable">
                          <option value="0">- Seleccionar -</option>
						  <option value="6">Delegacion VI Coatzacoalcos (Sureste)</option>
                          <option value="15">Gerencia de Tramo Chiapas</option>
                          <option value="8">Delegacion VIII Reynosa (Noreste)</option>
                          <option value="1">Delegacion I Tijuana</option>
                          <option value="21">Gerencia de Tramo Oaxaca</option>
                          <option value="7">Delegaci&oacute;n VII Veracruz (Golfo)</option>
                          <option value="10">Delegaci&oacute;n X Monterrey (Norte)</option>
                          <option value="13">Gerencia de Tramo Tizayuca</option>
                          <option value="2">Gerencia de Tramo Pacifico</option>
                          <option value="3">Delegacion III Queretaro (Centro Norte)</option>
                          <option value="4">Delegacion IV Cuernavaca (Centro Sur)</option>
                          <option value="9">Delegacion IX Guadalajara (Occidente)</option>
                          <option value="5">Delegacion V Puebla (Centro)</option>
                        </select>
						</div>
                    </td>
                  </tr>
              </table></td>
            </tr>
          </table>
          <h4>&nbsp;</h4>
          <div id='camino' style='display:none;'>
		  <table width="100%" border="0">
            <tr>
              <td><table width="100%" border="0">
                  <tr>
                    <td><div class="form-group" id="div_camino">
                         <label>Camino</label>
					</div></td>
                  </tr>
                </table>
			</td>
            </tr>
          </table>
          <h4>&nbsp;</h4>
		  </div>
          <div id='plaza_cobro' style='display:none;'>
		  <table width="100%" border="0">
            <tr>
              <td><table width="100%" border="0">
                  <tr>
                    <td><div class="form-group" id="div_plaza_cobro">
                         <label>Plaza de Cobro</label>
					</div></td>
                  </tr>
                </table>
                  <table width="100%" border="0">
                    <tr>
                      <td><div class="form-group">
                         <label>Carril</label>
                         <input class="form-control" name="carrilPlazaCobro">
						</div></td>
                      <td><div class="form-group">
                         <label>Cuerpo</label>
                        <select class="form-control" name="idCuerpoPlazaCobro">
                            <option value="1">A</option>
                            <option value="2">B</option>
                            <option value="3">Ambos</option>
                          </select>
						  </div>
                      </td>
                    </tr>
                </table></td>
            </tr>
          </table>
          <h4>&nbsp;</h4>
		  </div>
		  <div id='tramo' style='display:none;'>
          <table width="100%" border="0">
            <tr>
              <td><table width="100%" border="0">
                  <tr>
                    <td><div class="form-group" id="div_tramo">
                         <label>Tramo</label>
						</div>
                    </td>
                  </tr>
                </table>
                  <table width="100%" border="0">
                    <tr>
                      <td><div class="form-group">
                         <label>Kilometraje</label>
                         <input class="form-control" name="kmTramo">
                      </div></td>
                      <td><div class="form-group">
                         <label>Cuerpo</label>
                        <select class="form-control" name="idCuerpoTramo">
                            <option value="1">A</option>
                            <option value="2">B</option>
                            <option value="3">Ambos</option>
                          </select>
						  </div>
                      </td>
                    </tr>
                </table></td>
            </tr>
          </table>
          <h4>&nbsp;</h4>
		  </div>
		  <div id='puente' style='display:none;'>
          <table width="100%" border="0">
            <tr>
              <td><table width="100%" border="0">
                  <tr>
                    <td><div class="form-group" id="div_puente">
                         <label>Puente</label>
						</div>
                    </td>
                  </tr>
                </table>
                  <table width="100%" border="0">
                    <tr>
                      <td><div class="form-group">
                         <label>Kilometraje</label>
                         <input class="form-control" name="kmPuente">
						</div></td>
                      <td><div class="form-group">
                         <label>Cuerpo</label>
                        <select class="form-control" name="idCuerpoPuente">
                            <option value="1">A</option>
                            <option value="2">B</option>
                            <option value="3">Ambos</option>
                          </select>
						  </div>
                      </td>
                    </tr>
                </table></td>
            </tr>
          </table>
		  <h4>&nbsp;</h4>
		  </div>
          <table width="100%" border="0">
            <tr>
              <td><table width="100%" border="0">
                  <tr>
                    <td><div class="form-group">
                         <label>Tipo de Accidente</label>
                        <select class="form-control" name="idTipoAccidente">
                          <option value="0">- Seleccionar -</option>
						  <option value="1">A Incidente</option>
                          <option value="2">B Incidente</option>
                          <option value="3">C Incidente</option>
                        </select>
						</div>
                    </td>
                    <td><div class="form-group">
                         <label>Prioridad</label>
                        <select class="form-control" name="idPrioridad">
                          <option value="1">Normal</option>
                          <option value="2">Urgente</option>
                        </select>
						</div>
                    </td>
                  </tr>
                </table>
                  <table width="100%" border="0">
                    <tr>
                      <td><div class="form-group">
                                            <label>Observaci&oacute;n</label>
                                            <textarea class="form-control" rows="3" name="observacion"></textarea>
                          </div>
						</td>
                    </tr>
                  </table>
                  <table width="100%" border="0">
                    <tr>
                      <td><div class="form-group">
                                            <label>Sugerencia</label>
                                            <textarea class="form-control" rows="3" name="sugerencia"></textarea>
                          </div>
						</td>
                    </tr>
                  </table>
                </td>
            </tr>
          </table>
          <p>&nbsp;</p>
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
		  	<button type="button" class="btn btn-warning" onClick="enviar('inicioRegistro.jsp')">Cancelar</button>
          </div></td>
        </tr>
      </table>
      <%

      }
      else {
    	  
    	 String sTipoObs = "";
         switch (visitante.getIdTipoObservacion()) {
        	  case 1: sTipoObs = "AE"; break;
        	  case 2: sTipoObs = "ASV"; break;
        	  case 3: sTipoObs = "CDI"; break;
        	  case 4: sTipoObs = "SU"; break;
        	  case 5: sTipoObs = "SM"; break;
        	  case 6: sTipoObs = "OC"; break;
        	  case 7: sTipoObs = "UR"; break;
    	  }

          var = datosObservacion.formateaCadenaNumero(var, 5, "0");
       	  String sFolioTmp = "";
    	  switch (visitante.getIdUnidadResponsable()) {
    	  case 6: sFolioTmp = "DR6-" + sTipoObs + "-2016-" + var; break;
    	  case 8: sFolioTmp = "DR8-" + sTipoObs + "-2016-" + var; break;
    	  case 1: sFolioTmp = "DR1-" + sTipoObs + "-2016-" + var; break;
    	  case 7: sFolioTmp = "DR7-" + sTipoObs + "-2016-" + var; break;
    	  case 10: sFolioTmp = "DR10-" + sTipoObs + "-2016-" + var; break;
    	  case 3: sFolioTmp = "DR3-" + sTipoObs + "-2016-" + var; break;
    	  case 4: sFolioTmp = "DR4-" + sTipoObs + "-2016-" + var; break;
    	  case 9: sFolioTmp = "DR9-" + sTipoObs + "-2016-" + var; break;
    	  case 5: sFolioTmp = "DR5-" + sTipoObs + "-2016-" + var; break;
    	  case 15: sFolioTmp = "GT15-" + sTipoObs + "-2016-" + var; break;
    	  case 21: sFolioTmp = "GT21-" + sTipoObs + "-2016-" + var; break;
    	  case 13: sFolioTmp = "GT13-" + sTipoObs + "-2016-" + var; break;
    	  case 2: sFolioTmp = "GT2-" + sTipoObs + "-2016-" + var; break;
    	  
    	  }
    	  visitante.setFolio(sFolioTmp);
 
         rs=datosObservacion.agregarObservacion(visitante);

         if (rs>0) {
        	 
        	 datosFile.saveFile("folioObserva.txt", visitante.getFolio(), false);
			 session.setAttribute("folio", sFolioTmp);
        	 
   			%>
      <jsp:forward page="NotificaRegistro.jsp"/>
      
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
