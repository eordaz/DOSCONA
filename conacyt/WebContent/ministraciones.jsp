<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
                    <h1 class="page-header">Ministraciones</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#inicio" data-toggle="tab">Datos Generales</a>
                                </li>                                
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                
                                                  
							    <div class="tab-pane fade in active" id="inicio">
                                <div class="panel-body">
                                  <div class="row">										                           
					                  	<div class="col-lg-2">
					                        <div class="form-group">
					                           <label>No. de Proyecto </label>
					                           <input class="form-control"   value="CY201449">
					    					</div>
					    			 	</div>	
					    			 	<div class="col-lg-6">
					    					 <div class="form-group">
					                              <label>Nombre de Proyecto</label>
					                              <input name="Input" class="disable form-control"  disabled="disabled" value="TECNICAS DE DIAGNOSTICO DE BACTERIAS">
					                                        
					    					  </div>	
					    				</div>
					    				<div class="col-lg-2">
					    				  <div class="form-group">
					    			  		  <label style="color:#ffffff">Nombre Proyecto</label>
					                          <input type="button"  class="btn btn-primary"  value="Buscar"/>
					    				  </div>	
					    				</div>
					                </div>
					                <br/><br/>
									<div class="row">
				                      <div class="col-lg-12">
				                          <div class="panel panel-primary panel-stage" id="divStage_1">				                          
				                          
				
				                            <div class="panel-heading">
				        		              	 	 <i class="fa fa-fw"></i> <span class="stage-title">Ministracion 1</span>
				                			    	</div>
				
				                                <div class="panel-body panel-medio" id="cuerpo_1">
				            							<div class="row" id="row_1">
					    	        					  <div class="col-lg-6">
						                                 	 <div class="form-group">
						                                            <label>Dependencia</label>
						                                            <input name="Input" id="cve_depSdep" class="disable form-control"  disabled="disabled" value="211.01    Coordinación y Consejo Técnico  de Humanidades">
						                                   	 </div>
														 	</div>
					                                      	<div class="col-lg-2 col-price">
					    	        							<div class="form-group">
					                                     		 	<label>Importe</label>
					                                     		  <input class="form-control" id="importe"  name="importe" value="$0.00"></input>
					                                 			  </div>
					                                 		</div>
				                                 		</div>
				                                 		 <div class="row">
														        <div class='col-sm-4'>
														            <div class="form-group">
														               <label>Código Presupuestal</label>
														                <input class="form-control" TYPE="text" name="cod_pre">
														            </div>
														        </div>
														  </div>
																  
				                                 		  <div class="row">
														        <div class='col-sm-4'>
														            <div class="form-group">
														            <label>Fecha</label>
														                <input class="form-control" TYPE="date" name="fecha_inicio">
														            </div>
														        </div>
														  </div>
														<div class="row" >
				                                 			<div class="col-lg-3">
													  			<div class="form-group">
													 				<label>CFDI</label>							                                  		
						    									</div>
												 			</div>
												 		</div>	
												 		<div class="row" >
												 			<div class="col-lg-2">
													  			<div class="form-group">
													 				 <input class="form-control" id="importe"  name="serie" value="Serie"></input>						                                  		
						    									</div>
												 			</div>
												 			<div class="col-lg-2">
													  			<div class="form-group">
													 				 <input class="form-control" id="importe"  name="folio" value="Folio"></input>						                                  		
						    									</div>
												 			</div>
				                                 		</div>		                                 		
				                                 		
				                                 		<div class="row" >
				                                 			<div class="col-lg-4">
													  			<div class="form-group">
													 				<label>Observaciones</label>
							                                  		<input name="Input" id="obsr" class="form-control  date"  value="">
						    									</div>
												 			</div>
				                                 		</div>
														<script> var stageId=0</script>
				                    
            									

                                    <div class="row">
                                      <div class="col-lg-9" align="right">
                                        <div class="form-group">
                                          <button type="submit" class="btn btn-primary">Guardar</button>
                                          <button type="reset" class="btn btn-default">Limpiar</button>
                                        </div>
                                      </div>
                                    </div>

            										</div>
                                <!--/ panel-body -->

			                            </div> <!--/ panel  (finish etapa) -->
			
			                            <div class="col-lg-2" align="left">
			                          		<div class="form-group">
			                                <button type="button" class="btn btn-primary" onclick="addStage()">Agregar Nueva Ministración</button>
			                                								<script>
			                                								function addStage() {
																				  // Obtengo el id del último elemento de "etapa"
																				  var lastStageId = parseInt($('.panel-stage').last().attr('id').split('_')[1]);
																				  var newId = lastStageId+1;
																				
																				  // Clono e inserto el último elemento de "etapa"
																				  $newClone = $('.panel-stage').last().clone(true);
																				  $newClone.attr("id",'divStage_'+newId);
																				
																				  // coloco nuevo título "etapa 1, 2, 3..."
																				  $newClone.children('.panel-heading').html('<i class="fa fa-fw"></i> <span class="stage-title">Ministración '+newId+'</span>');
																				
																				  // Actualizo función "addColumnPrice" del nuevo elemento
																				  $newClone.find('.btn-add-price').removeAttr("onclick"); // quito onclick del elemento clonado
																				  $newClone.find('.btn-add-price').unbind('click'); // quito onclick del elemento clonado
																				  $newClone.find('.btn-add-price').on("click", function(){ addColumnPrice(newId); });
																				
																				  // inserto nuevo elemento
																				  $newClone.insertAfter($('#divStage_'+lastStageId));
																				}
			                                								</script>
						                                 			  </div>
						                                 			</div>

						            												</div>

        										</div>
                            	    		
                                            </div>
                                            
                                        </div>

						<!-- --------------------           RESPONSABLES                     -->				
								
                                <div class="tab-pane fade" id="messages">
                                <div class="panel-body">
									<div class="row">
					                <div class="col-lg-12">
                    				<div class="panel panel-primary">
			                        <div class="panel-heading">
            		              	  <i class="fa fa-fw"></i> Responsable T&eacute;cnico
                    			    	</div>
											<div class="panel-body">
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>RFC</label>
                                           			 <input class="form-control" name="rfc">
                                       			</div>
												</div>
												</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Nombre</label>
                                           			 <input class="form-control" name="nombre">
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido Paterno</label>
                                           			 <input class="form-control" name="apellido_paterno">
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido materno</label>
                                           			 <input class="form-control" name="apellido_materno">
                                       			</div>
												</div>
											</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Correo electr&oacute;nico</label>
                                           			 <input class="form-control" name="correo">
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Tel&eacute;fono</label>
                                           			 <input class="form-control" name="telefono">
                                       			</div>
												</div>
												</div>
									<div class="row">
									<div class="col-lg-12" align="right">
									<div class="form-group">
									<button type="submit" class="btn btn-primary">Guardar</button>
            			            <button type="reset" class="btn btn-default">Limpiar</button>

									</div></div></div>
								</div>
											
									</div>
									
									</div>
									</div>
								
									<div class="row">
					                <div class="col-lg-12">
                    				<div class="panel panel-primary">
			                        <div class="panel-heading">
            		                <i class="fa fa-fw"></i> Responsable Administrativo
                    			    </div>
									<div class="panel-body">
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>RFC</label>
                                           			 <input class="form-control" name="rfc">
                                       			</div>
												</div>
												</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Nombre</label>
                                           			 <input class="form-control" name="nombre">
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido Paterno</label>
                                           			 <input class="form-control" name="apellido_paterno">
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido materno</label>
                                           			 <input class="form-control" name="apellido_materno">
                                       			</div>
												</div>
											</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Correo electr&oacute;nico</label>
                                           			 <input class="form-control" name="correo">
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Tel&eacute;fono</label>
                                           			 <input class="form-control" name="telefono">
                                       			</div>
												</div>
												</div>
									<div class="row">
									<div class="col-lg-12" align="right">
									<div class="form-group">
									<button type="submit" class="btn btn-primary">Guardar</button>
            			            <button type="reset" class="btn btn-default">Limpiar</button>

									</div></div></div>
								</div>
								</div>
								</div>
								</div>
								
									<div class="row">
					                <div class="col-lg-12">
                    				<div class="panel panel-primary">
			                        <div class="panel-heading">
            		                <i class="fa fa-fw"></i> Responsable Legal
                    			    </div>
									<div class="panel-body">
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>RFC</label>
                                           			 <input class="form-control" name="rfc">
                                       			</div>
												</div>
												</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Nombre</label>
                                           			 <input class="form-control" name="nombre">
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido Paterno</label>
                                           			 <input class="form-control" name="apellido_paterno">
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido materno</label>
                                           			 <input class="form-control" name="apellido_materno">
                                       			</div>
												</div>
											</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Correo electr&oacute;nico</label>
                                           			 <input class="form-control" name="correo">
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Tel&eacute;fono</label>
                                           			 <input class="form-control" name="telefono">
                                       			</div>
												</div>
												</div>
									<div class="row">
									<div class="col-lg-12" align="right">
									<div class="form-group">
									<button type="submit" class="btn btn-primary">Guardar</button>
            			            <button type="reset" class="btn btn-default">Limpiar</button>

									</div></div></div>
								</div>
								</div>
								</div>
								</div>
						
						
							</div>
							</div>

<!-- ---------------------------------------------------ANEXO ---------------------- -->								
								
                                <div class="tab-pane fade" id="settings">
                            <div class="panel-body">
							<div class="row">
							<div class="col-lg-6">
							<div class="form-group">
                                            <br/><label>Proyecto</label><input type= "file" name="cve_documento"></input>
                                        </div>
							</div>
							</div>
							<div class="row">
							<div class="col-lg-3">
							<div class="form-group">
                                            <label>Otros</label>
                                            <select class="form-control" id="tipoGasto" name="id_cat_tipo_gasto">
				                                            		<option value="1">CFDI</option>
				                                           			 <option value="2">NOTAS</option>
				                                          			 <option value="3">TICKETS</option>
				                            </select>
                                            <input type= "file" name="cve_documento"></input>
                                            
                                        </div>
								</div>
							

							</div>
							<div class="row">
							<div class="col-lg-3" align="right">
							<div class="form-group">
						<button type="submit" class="btn btn-primary">Guardar</button>
                        <button type="reset" class="btn btn-default">Limpiar</button>

</div></div></div>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
				
				<!------------------------------------------------------------------------------------------->	
			
	 </form>				
         

    </div>
    <!-- /#wrapper -->
    
    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="vendor/raphael/raphael.min.js"></script>
    <script src="vendor/morrisjs/morris.min.js"></script>
    <script src="data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>