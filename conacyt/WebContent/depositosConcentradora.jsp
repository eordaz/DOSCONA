<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<script language="javascript" type="text/javascript">
	function enviar(pagina){
	document.formCaptura.action = pagina;
	document.formCaptura.submit();
	}
	</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Conacyt</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
       		<!--   jsp:include page="navmenu.html" -->
                <%@include file="navmenu.html" %>   
        
       
            <!-- /.row -->
            <!-- /.row -->
<!------------------------------------------------------------------------------------------------------------------->
	<form name="formCaptura" method="post" action="inicio.jsp">

	<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dep&oacute;sitos a cuenta concentradora</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
                                                    
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="inicio">
                                    <div class="panel-body">
                    						    <div class="row">
                            							<div class="col-lg-3">
                            							<div class="form-group">
                                                                        <label>Fecha Inicio</label>
                                                                        <input class="form-control" TYPE="date" name="fecha_inicio">
                                                                    </div>
                            							</div>
                            							<div class="col-lg-3">
                            							     <div class="form-group">
                                                                        <label>Fecha Fin</label>
                                                                        <input class="form-control" type="date" name="fecha_fin">
                            							     </div>
                            						    </div>
                        						</div>
												
									<div class="row">
									<div class="col-lg-6" align="right">
									<div class="form-group">
									<button type="submit" class="btn btn-primary">Buscar</button>
            			            <button type="reset" class="btn btn-default">Limpiar</button>
            			            
            			            </div></div></div>
            			            
            			            <div class="row">
                            							<div class="col-lg-6">
                            							<div class="form-group">
            			            <table class="table table-bordered table-hover table-striped">
							                                 			<thread>
							                                 				<tr>
							                                 					<th>#</th>
							                                 					<th>Fecha</th>
							                                 					<th>Importe</th>
							                                 					<th>Seleccionar</th>
							                                 				</tr>
							                                 				<tr>
							                                 					<td>1</td>
							                                 					<td>15/11/2017</td>
							                                 					<td>3000000</td>
							                                 					<td><a href="asignarImporte.jsp" type="button">aplicar</a></td>
							                                 				</tr>
							                                 				<tr>
							                                 					<td>2</td>
							                                 					<td>30/11/2017</td>
							                                 					<td>580000</td>
							                                 					<td><a href="asignarImporte.jsp" type="button">aplicar</a></td>
							                                 				</tr>
							                                 				
							                                 			</thread>
									</table>
									</div></div></div>
										</div></div></div>
                            
 <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="vendor/raphael/raphael.min.js"></script>
    <!--<script src="vendor/morrisjs/morris.min.js"></script>
    <script src="data/morris-data.js"></script> --->

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
	 
	
</body>

</html>