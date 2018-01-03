<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	
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
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
       		<!--   jsp:include page="navmenu.html" -->
                <%@include file="navmenu.html" %>   
        
       
            <!-- /.row -->
            <!-- /.row -->
<!------------------------------------------------------------------------------------------------------------------->

	<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dep&oacute;sito Cuenta HSBC</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
                                                    
                             <div class="tab-content">
                                <div class="tab-pane fade in active" id="inicio">
                                    <div class="panel-body">
                    						    <div class="row">
                            							<div class="col-lg-3">
                            							<div class="form-group">
                                                                        <label>Fecha:</label>
                                                                        <input class="form-control" type="text" name="fecha_inicio" disabled></input>
                                                        </div>
                            							</div>
                            							
                        						</div>
                        						
												<div class="row">
                            							<div class="col-lg-9">
                            							<div class="form-group">
            			            					<table class="table table-bordered table-hover table-striped">
							                                 			<thread>
							                                 				<tr>
							                                 					<th>#</th>
							                                 					<th>Concepto</th>
							                                 					<th>Importe</th>
							                                 					<th>Seleccionar</th>
							                                 					<th>Dependencia</th>
							                                 				</tr>
							                                 			</thread>
																<tbody>
																<tr>
																<td>1</td>
																<td>CONACYT_SAE</td>
																<td>100000</td>
																<td><input type="checkbox" name="ValorCheck"id="ValorCheck"></td>
																<td><div id="catalogo" style="display:none;">
																	<select class="form-control" name="id_cat_dependencia">
                                                                        <option value="0">311.01 CONSEJO TECNICO Y COORDINACION DE LA INVERSTIGACION CIENTIFICA</option>
                                                                        <option value="1">311.02 CENTRO DE CIENCIAS DE LA ATMOSFERA</option>
                                                                        <option>331.01 INSTITUTO DE NEUROBIOLOGIA EN QUERETARO, QRO</option>
                                                                        <option>333.01 INSTITUTO DE ENERGIAS RENOVABLES EN TEMIXCO, MOR.</option>	                                                                    
	                                                                    <option>443.01 FACULTAD DE ESTUDIOS SUPERIORES IZTACALA</option>
	                                                                    <option>613.01 CENTRO DE ENSEÑANZA PARA EXTRANJEROS</option>
                                                                    </select>
                                                                   			 <script>
                                                                   			 $(document).ready(function(){ 
																			    $('#ValorCheck').on('click',function(){
																			      $('#catalogo').toggle();
																			  	 });
																				});
                                                                   			 </script>
                                                                    </div></td>
                                                                 </tr>
                                                                 <tr>
																	<td>2</td>
																	<td>QUÍMICA</td>
																	<td>20000</td>
																	<td><input type="checkbox" name="ValorCheck2"id="ValorCheck2"></td>
																	<td><div id="catalogo2" style="display:none;">
																		<select class="form-control" name="id_cat_dependencia">
	                                                                        <option value="0">311.01 CONSEJO TECNICO Y COORDINACION DE LA INVERSTIGACION CIENTIFICA</option>
                                                                        <option value="1">311.02 CENTRO DE CIENCIAS DE LA ATMOSFERA</option>
                                                                        <option>331.01 INSTITUTO DE NEUROBIOLOGIA EN QUERETARO, QRO</option>
                                                                        <option>333.01 INSTITUTO DE ENERGIAS RENOVABLES EN TEMIXCO, MOR.</option>	                                                                    
	                                                                    <option>443.01 FACULTAD DE ESTUDIOS SUPERIORES IZTACALA</option>
	                                                                    <option>613.01 CENTRO DE ENSEÑANZA PARA EXTRANJEROS</option>
	                                                                    </select>
	                                                                    	<script>   $(document).ready(function(){ 
																			    $('#ValorCheck2').on('click',function(){
																			      $('#catalogo2').toggle();
																			  	 });
																				});
                                                                   			 </script>
	                                                                    </div>
	                                                                </td>
                                                                 </tr>
                                                                 <tr>
																<td>3</td>
																<td>FCA</td>
																<td>1500000</td>
																<td><input type="checkbox" name="ValorCheck3"id="ValorCheck3"></td>
																<td><div id="catalogo3" style="display:none;">
																	<select class="form-control" name="id_cat_dependencia">
                                                                        <option value="0">311.01 CONSEJO TECNICO Y COORDINACION DE LA INVERSTIGACION CIENTIFICA</option>
                                                                        <option value="1">311.02 CENTRO DE CIENCIAS DE LA ATMOSFERA</option>
                                                                        <option>331.01 INSTITUTO DE NEUROBIOLOGIA EN QUERETARO, QRO</option>
                                                                        <option>333.01 INSTITUTO DE ENERGIAS RENOVABLES EN TEMIXCO, MOR.</option>	                                                                    
	                                                                    <option>443.01 FACULTAD DE ESTUDIOS SUPERIORES IZTACALA</option>
	                                                                    <option>613.01 CENTRO DE ENSEÑANZA PARA EXTRANJEROS</option>
                                                                    </select>
                                                                   			 <script>
                                                                   			 $(document).ready(function(){ 
																			    $('#ValorCheck3').on('click',function(){
																			      $('#catalogo3').toggle();
																			  	 });
																				});
                                                                   			 </script>
                                                                    </div></td>
                                                                 </tr>
                                                                 <tr>
																<td>4</td>
																<td>FACULTAD DE INGENIERIA</td>
																<td>50000</td>
																<td><input type="checkbox" name="ValorCheck4"id="ValorCheck4"></td>
																<td><div id="catalogo4" style="display:none;">
																	<select class="form-control" name="id_cat_dependencia">
                                                                        <option value="0">311.01 CONSEJO TECNICO Y COORDINACION DE LA INVERSTIGACION CIENTIFICA</option>
                                                                        <option value="1">311.02 CENTRO DE CIENCIAS DE LA ATMOSFERA</option>
                                                                        <option>331.01 INSTITUTO DE NEUROBIOLOGIA EN QUERETARO, QRO</option>
                                                                        <option>333.01 INSTITUTO DE ENERGIAS RENOVABLES EN TEMIXCO, MOR.</option>	                                                                    
	                                                                    <option>443.01 FACULTAD DE ESTUDIOS SUPERIORES IZTACALA</option>
	                                                                    <option>613.01 CENTRO DE ENSEÑANZA PARA EXTRANJEROS</option>
                                                                    </select>
                                                                   			 <script>
                                                                   			 $(document).ready(function(){ 
																			    $('#ValorCheck4').on('click',function(){
																			      $('#catalogo4').toggle();
																			  	 });
																				});
                                                                   			 </script>
                                                                    </div></td>
                                                                 </tr>
																 </tbody>
														</table>
														</div>
														</div>
												</div>
												
												<!------------------------------------------------------------------->
																<div class="row">
																<div class="col-lg-9" align="right">
																<div class="form-group">
																<a href="ministraciones.jsp" type="button" class="btn btn-primary">Siguiente</a>
							            			            <a href="depositosConcentradora.jsp" type="button" class="btn btn-default">Regresar</a>
						
																</div>
																</div>
																</div>
														
														
														
														
														<!------------------------------->
														
						                  <!-- /.panel -->
						     </div>
						                
									
									
									</div>
								</div>
							
                            
 <!-- jQuery -->
     <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Flot Charts JavaScript -->
    <script src="vendor/flot/excanvas.min.js"></script>
    <script src="vendor/flot/jquery.flot.js"></script>
    <script src="vendor/flot/jquery.flot.pie.js"></script>
    <script src="vendor/flot/jquery.flot.resize.js"></script>
    <script src="vendor/flot/jquery.flot.time.js"></script>
    <script src="vendor/flot-tooltip/jquery.flot.tooltip.min.js"></script>
    <script src="data/flot-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
	 
	
</body>

</html>