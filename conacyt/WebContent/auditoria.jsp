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

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <!--   jsp:include page="navmenu.html" -->
                <%@include file="navmenu.html" %>  

           <!------------------------------------------------------------------------------------------------->
		   
		   <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Consulta de Proyecto</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
                        <!-- /.panel-heading -->
                       <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">Datos Generales</a>
                                </li>
                                <li><a href="#profile" data-toggle="tab">Datos Presupuestales</a>
                                </li>
                                <li><a href="#messages" data-toggle="tab">Responsables</a>
                                </li>
                                <li><a href="#settings" data-toggle="tab">Anexos</a>
                                </li>
								<li><a href="#autoriza" data-toggle="tab">Autorizaci&oacute;n</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                             <div class="tab-content">
                                <div class="tab-pane fade in active" id="home">
                                    <div class="panel-body">
										<div class="row">
											<div class="col-lg-3">
											<div class="form-group">
                                		           </br> <label>No. de Proyecto</label>
                                        		    <input class="form-control" id="disabledInput" type="text" placeholder="proyecto">
                                        		    </div>
                                        		    </div>
                                        		    <div class="col-lg-3">
								    				 <div class="form-group">
								    			  		  </br><label style="color:#ffffff">consultar</label>
								                          </br><input type="button"  class="btn btn-primary"  value="Consultar"/>
								    				  </div>	
								    				</div>
										</div>
											<div class="row">
											<div class="col-lg-6">
											<div class="form-group">
                                	            <label>Nombre del Proyecto</label>
                                    	        <input class="form-control" id="disabledInput" type="text" placeholder="Nombre de Proyecto" disabled>
                                        	</div>
											</div>
											</div>
						 		            <div class="row">	
												<div class="col-lg-3">
												<div class="form-group">
    	                                        <div class="form-group">
        	        	                            <label>Fondo</label>
            	        	                        <select class="form-control" id="disabledInput" type="text" placeholder="Fondo" disabled>
                	        	                        <option>FOINS</option>
                    	        	                    <option>FONDO SECTORIAL</option>
                        	        	                <option>FONDO MIXTO</option>
                            	        	            <option>APOYOS COMPLEMENTARIOS</option>
                                	        	        <option>APOYOS INSTITUCIONALES</option>
                                    	        	</select>
	                                    	    </div>
    	                                    	</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-3">
												<div class="form-group">
        	                                    	<label>Fecha Inicio</label>
            	                                		<input class="form-control" TYPE="date" id="disabledInput" type="text" placeholder="Fecha inicio" disabled>
                	                        	</div>
												</div>
												<div class="col-lg-3">
												<div class="form-group">
                    		                        <label>Fecha Fin</label>
                            			                <input class="form-control" type="date" id="disabledInput" type="text" placeholder="Fecha Fin" disabled>
												</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-3">
												<div class="form-group">
                    		                        <label>Importe Total</label>
                            			                <input class="form-control" id="disabledInput" type="text" placeholder="Importe Total" disabled>
                                        		</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-3">
												<div class="form-group">
                    		                        <label>Moneda</label>
                            			                <select class="form-control" id="disabledInput" type="text" placeholder="Moneda" disabled>
<option value="1">AFGANI AFGANO</option>
<option value="2">LEK ALBANÉS</option>
<option value="3">DRAM ARMENIO</option>
<option value="4">FLORÍN ANTILLANO NEERLANDÉS</option>
<option value="5">KWANZA ANGOLEÑO</option>
<option value="6">PESO ARGENTINO</option>
<option value="7">DÓLAR AUSTRALIANO</option>
<option value="8">FLORÍN ARUBEÑO</option>
<option value="9">MANAT AZERBAIYANO</option>
<option value="10">MARCO CONVERTIBLE DE BOSNIA-HERZEGOVINA</option>
<option value="11">DÓLAR DE BARBADOS</option>
<option value="12">TAKA DE BANGLADÉS</option>
<option value="13">LEV BÚLGARO</option>
<option value="14">DINAR BAHREINÍ</option>
<option value="15">FRANCO BURUNDÉS</option>
<option value="16">DÓLAR DE BERMUDA</option>
<option value="17">DÓLAR DE BRUNÉI</option>
<option value="18">BOLIVIANO</option>
<option value="19">MVDOL BOLIVIANO (CÓDIGO DE FONDOS)</option>
<option value="20">REAL BRASILEÑO</option>
<option value="21">DÓLAR BAHAMEÑO</option>
<option value="22">NGULTRUM DE BUTÁN</option>
<option value="23">PULA DE BOTSUANA</option>
<option value="24">RUBLO BIELORRUSO</option>
<option value="25">DÓLAR DE BELICE</option>
<option value="26">DÓLAR CANADIENSE</option>
<option value="27">FRANCO CONGOLEÑO, O CONGOLÉS</option>
<option value="28">FRANCO SUIZO</option>
<option value="29">UNIDADES DE FOMENTO CHILENAS (CÓDIGO DE FONDOS)</option>
<option value="30">PESO CHILENO</option>
<option value="31">YUAN CHINO</option>
<option value="32">PESO COLOMBIANO</option>
<option value="33">UNIDAD DE VALOR REAL COLOMBIANA (AÑADIDA AL COP)</option>
<option value="34">COLÓN COSTARRICENSE</option>
<option value="35">DINAR SERBIO (REEMPLAZADO POR RSD EL 25 DE OCTUBRE DE 2006)</option>
<option value="36">PESO CUBANO CONVERTIBLE</option>
<option value="37">PESO CUBANO</option>
<option value="38">ESCUDO CABOVERDIANO</option>
<option value="39">KORUNA CHECA</option>
<option value="40">FRANCO YIBUTIANO</option>
<option value="41">CORONA DANESA</option>
<option value="42">PESO DOMINICANO</option>
<option value="43">DINAR ARGELINO</option>
<option value="44">LIBRA EGIPCIA</option>
<option value="45">NAKFA ERITREO</option>
<option value="46">BIRR ETÍOPE</option>
<option value="47">EURO</option>
<option value="48">DÓLAR FIYIANO</option>
<option value="49">LIBRA MALVINENSE</option>
<option value="50">LIBRA ESTERLINA</option>
<option value="51">LARI GEORGIANO</option>
<option value="52">CEDI GHANÉS</option>
<option value="53">LIBRA DE GIBRALTAR</option>
<option value="54">DALASI GAMBIANO</option>
<option value="55">FRANCO GUINEANO</option>
<option value="56">QUETZAL GUATEMALTECO</option>
<option value="57">DÓLAR GUYANÉS</option>
<option value="58">DÓLAR DE HONG KONG</option>
<option value="59">LEMPIRA HONDUREÑO</option>
<option value="60">KUNA CROATA</option>
<option value="61">GOURDE HAITIANO</option>
<option value="62">FORINT HÚNGARO</option>
<option value="63">RUPIAH INDONESIA</option>
<option value="64">NUEVO SHÉQUEL ISRAELÍ</option>
<option value="65">RUPIA INDIA</option>
<option value="66">DINAR IRAQUÍ</option>
<option value="67">RIAL IRANÍ</option>
<option value="68">KRÓNA ISLANDESA</option>
<option value="69">DÓLAR JAMAICANO</option>
<option value="70">DINAR JORDANO</option>
<option value="71">YEN JAPONÉS</option>
<option value="72">CHELÍN KENIATA</option>
<option value="73">SOM KIRGUÍS (DE KIRGUISTÁN)</option>
<option value="74">RIEL CAMBOYANO</option>
<option value="75">FRANCO COMORIANO (DE COMORAS)</option>
<option value="76">WON NORCOREANO</option>
<option value="77">WON SURCOREANO</option>
<option value="78">DINAR KUWAITÍ</option>
<option value="79">DÓLAR CAIMANO (DE ISLAS CAIMÁN)</option>
<option value="80">TENGE KAZAJO</option>
<option value="81">KIP LAO</option>
<option value="82">LIBRA LIBANESA</option>
<option value="83">RUPIA DE SRI LANKA</option>
<option value="84">DÓLAR LIBERIANO</option>
<option value="85">LOTI LESOTENSE</option>
<option value="86">LITAS LITUANO</option>
<option value="87">LAT LETÓN</option>
<option value="88">DINAR LIBIO</option>
<option value="89">DIRHAM MARROQUÍ</option>
<option value="90">LEU MOLDAVO</option>
<option value="91">ARIARY MALGACHE</option>
<option value="92">DENAR MACEDONIO</option>
<option value="93">KYAT BIRMANO</option>
<option value="94">TUGHRIK MONGOL</option>
<option value="95">PATACA DE MACAO</option>
<option value="96">OUGUIYA MAURITANA</option>
<option value="97">RUPIA MAURICIA</option>
<option value="98">RUFIYAA MALDIVA CÓDIGO MONEDA</option>
<option value="99">KWACHA MALAUÍ</option>
<option value="100" selected>PESO MEXICANO</option>
<option value="101">UNIDAD DE INVERSIÓN (UDI) MEXICANA (CÓDIGO DE FONDOS)</option>
<option value="102">RINGGIT MALAYO</option>
<option value="103">METICAL MOZAMBIQUEÑO</option>
<option value="104">DÓLAR NAMIBIO</option>
<option value="105">NAIRA NIGERIANA</option>
<option value="106">CÓRDOBA NICARAGÜENSE</option>
<option value="107">CORONA NORUEGA</option>
<option value="108">RUPIA NEPALESA</option>
<option value="109">DÓLAR NEOZELANDÉS</option>
<option value="110">RIAL OMANÍ</option>
<option value="111">BALBOA PANAMEÑA</option>
<option value="112">NUEVO SOL PERUANO</option>
<option value="113">KINA DE PAPÚA NUEVA GUINEA</option>
<option value="114">PESO FILIPINO</option>
<option value="115">RUPIA PAKISTANÍ</option>
<option value="116">ZLOTY POLACO</option>
<option value="117">GUARANÍ PARAGUAYO</option>
<option value="118">RIAL QATARÍ</option>
<option value="119">LEU RUMANO</option>
<option value="120">RUBLO RUSO</option>
<option value="121">FRANCO RUANDÉS</option>
<option value="122">RIYAL SAUDÍ</option>
<option value="123">DÓLAR DE LAS ISLAS SALOMÓN</option>
<option value="124">RUPIA DE SEYCHELLES</option>
<option value="125">DINAR SUDANÉS</option>
<option value="126">CORONA SUECA</option>
<option value="127">DÓLAR DE SINGAPUR</option>
<option value="128">LIBRA DE SANTA HELENA</option>
<option value="129">LEONE DE SIERRA LEONA</option>
<option value="130">CHELÍN SOMALÍ</option>
<option value="131">DÓLAR SURINAMÉS</option>
<option value="132">DOBRA DE SANTO TOMÉ Y PRÍNCIPE</option>
<option value="133">LIBRA SIRIA</option>
<option value="134">LILANGENI SUAZI</option>
<option value="135">BAHT TAILANDÉS</option>
<option value="136">SOMONI TAYIK (DE TAYIKISTÁN)</option>
<option value="137">MANAT TURCOMANO</option>
<option value="138">DINAR TUNECINO</option>
<option value="139">PA'ANGA TONGANO</option>
<option value="140">LIRA TURCA</option>
<option value="141">DÓLAR DE TRINIDAD Y TOBAGO</option>
<option value="142">DÓLAR TAIWANÉS</option>
<option value="143">CHELÍN TANZANO</option>
<option value="144">GRIVNA UCRANIANA</option>
<option value="145">CHELÍN UGANDÉS</option>
<option value="146">DOLAR AMERICANO</option>
<option value="147">DÓLAR ESTADOUNIDENSE (SIGUIENTE DÍA) (CÓDIGO DE FONDOS)</option>
<option value="148">DÓLAR ESTADOUNIDENSE (MISMO DÍA) (CÓDIGO DE FONDOS)</option>
<option value="149">PESO URUGUAYO</option>
<option value="150">CAPTACIÓN ÁLTAS</option>
  </select>

                                        	</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6">
											<div class="form-group">
                                        	    <label>Dependencia</label>
	                                            <select class="form-control" id="disabledInput" type="text" placeholder="INSTITUTO POLITECNICO NACIONAL" disabled>
    	                                            <option>UNIVERSIDAD NACIONAL AUTONOMA DE M&Eacute;�XICO</option>
        	                                        <option>INSTITUTO POLITECNICO NACIONAL</option>
            	                                    <option selected>UNIVERSIDAD AUTONOMA DE MEXICO</option>
                	                                <option>CONACYT</option>
                    	                            <option>DGP</option>
                        	                    </select>
                            			 	 </div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6">
											<div class="form-group">
                    	                        <label>SubDependencia</label>
                        		                    <select class="form-control" id="disabledInput" type="text" placeholder="ESCUELA SUPERIOR DE INGENIERÍA MECANICA Y ELECTRÓNICA" disabled>
	    	                                            <option>FACULTAD DE CONTADURIA Y ADMINISTRACION</option>
    	    	                                        <option>ESCUELA SUPERIOR DE INGENIERIA MECANICA Y ELECTRONICA</option>
                		                                <option>ESCUELA DE CONTADUR&Iacute;�A</option>
                        		                        <option>INSTITUTO DE INVESTIGACIÓN</option>
                                		                <option>SUBSECRETARIA DE EDUCACION MEDIA SUPERIOR</option>
                                        		    </select>
                                        </div>
							</div>
						</div>

         </div></div>
                              
							    <div class="tab-pane fade" id="profile">
                                <div class="panel-body">
									<div class="row">
					                <div class="col-lg-12">
				
				                          <div class="panel panel-primary panel-stage" id="divStage_1">
				
				                            <div class="panel-heading">
				        		              	 	 <i class="fa fa-fw"></i> <span class="stage-title">Etapa 1</span>
				                			    	</div>
				
				                             <div class="panel-body panel-medio" id="cuerpo_1">
				            						<div class="row" id="row_1">
				    	        						<div class="col-lg-4 col-tipo">
				    	        							  <div class="form-group">
				                                       		 	<label>Tipo de Gasto</label>
					                                       			 <select class="form-control" id="tipoGasto" name="id_cat_tipo_gasto" disabled>
					                                            		 <option>CORRIENTE</option>
					                                           			 <option>DE INVERSI&Oacute;N</option>
					                                          			 <option>OTROS</option>
					                                    	         </select>
				                                   			  </div>
				    	                             	</div>
				
				                                      	<div class="col-lg-2 col-price">
				    	        							<div class="form-group">
				                                     		 	<label>Importe</label>
				                                     		  	<input class="form-control" id="importe"  name="importe_asignado" disabled></input>
				                                 			</div>
				                                 		</div>
				                                 	</div>
				                                 
					               					 <div class="row">
														<div class="col-lg-4 col-price">
				    	        							<div class="form-group">
				                                     		 	<label></label>
				                                     		  	
				                                 			</div>
				                                 		</div>
														<div class="col-lg-2 col-price">
				    	        							<div class="form-group">
				                                     		 	<label>Importe Total de Etapa</label>
				                                     		  	<input class="form-control" id="importe_etapa"  name="importe_total_etapa" disabled></input>
				                                 			</div>
				                                 		</div>
													</div>
					                </div></div></div>
					                </div></div></div>
                                             


<!--  <div class="row">
					                <div class="col-lg-12">
                    				<div class="panel panel-primary">
			                        	<div class="panel-heading">
            		              	 	 <i class="fa fa-fw"></i> Etapa 2
                    			    	</div>
											<div class="panel-body">
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Tipo de Gasto</label>
                                           			 <select class="form-control" id="disabledInput" type="text" placeholder="Tipo de Gasto" disabled>
                                                		<option>CORRIENTE</option>
                                               			 <option>DE INVERSIÓN</option>
                                              			 <option>OTROS</option>
		                                            </select>
                                       			</div>
												</div>
												</div>
												<div class="row">
												<div class="col-lg-2">
												<div class="form-group">
                                           		 	<label>Importe de la etapa</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="100,000" disabled>
                                       			</div>
												</div>
												</div>
										</div>
	    				</div></div></div>


							</div>
							</div> 		-->
								
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
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="DAJS785421FE8" disabled>
                                       			</div>
												</div>
												</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Nombre</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="DIEGO" disabled>
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido Paterno</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="MARTINEZ" disabled>
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido materno</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="FLORES" disabled>
                                       			</div>
												</div>
											</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Correo electr&oacute;nico</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="........@hotmail.com" disabled>
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Tel&eacute;fono</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="26578498" disabled>
                                       			</div>
												</div>
												</div>
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
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="POLJ895421LK7" disabled>
                                       			</div>
												</div>
												</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Nombre</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="MARIA" disabled>
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido Paterno</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="RODRIGUEZ" disabled>
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido materno</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="DÍAZ" disabled>
                                       			</div>
												</div>
											</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Correo electr&oacute;nico</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="........@yahoo.com.mx" disabled>
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Tel&eacute;fono</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="57849785" disabled>
                                       			</div>
												</div>
												</div>

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
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="JUGS854215BR6" disabled>
                                       			</div>
												</div>
												</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Nombre</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="ANA" disabled>
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido Paterno</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="GUTIERREZ" disabled>
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Apellido materno</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="HERRERA" disabled>
                                       			</div>
												</div>
											</div>
												<div class="row">
												<div class="col-lg-4">
												<div class="form-group">
                                           		 	<label>Correo electr&oacute;nico</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="........@gmail.com" disabled>
                                       			</div>
												</div>
													<div class="col-lg-4">
													<div class="form-group">
                                           		 	<label>Tel&eacute;fono</label>
                                           			 <input class="form-control" id="disabledInput" type="text" placeholder="57426351" disabled>
                                       			</div>
												</div>
												</div>

								</div>
								</div>
								</div>
								</div>
						
						
							</div>
							</div>

								
											<div class="tab-pane fade" id="settings">
										<div class="panel-body">
										<div class="row">
										<div class="col-lg-6">
										<div class="form-group">
														<br/><label>Proyecto</label><input type= "file"></input>
													</div>
										</div>
										</div>
										<div class="row">
										<div class="col-lg-3">
										<div class="form-group">
														<label>Otros</label>
														<input type= "file"></input>
													</div>
											</div>
							

										</div>
			
											</div>
										</div>
										<div class="tab-pane fade" id="autoriza">
                                <div class="panel-body">
								<div class="row">
											<div class="col-lg-3">
											<div class="form-group">
                                		            <br/><label>No. de Proyecto</label>
                                        		    <input class="form-control" id="disabledInput" type="text" placeholder="CY256879" disabled>
			                                </div>
											</div>
											</div>				
						
				 			            <div class="row">	
											<div class="col-lg-3">
											<div class="form-group">
                    	                        <div class="form-group">
                        	            	        <label>Vo.Bo.</label>
                                            		<div class="checkbox">
													<label><input type="checkbox">Validaci&oacute;n</label>
                                            		</div>
		                                        </div>
        	    	                        </div>
											</div>
											<div class="col-lg-6">
											<div class="form-group">
                	                            <label>Nombre de Funcionario</label>
                    	                        <input class="form-control" id="disabledInput" type="text" placeholder="Datos_usuario">
                        	                </div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-9" align="right">
											<div class="form-group">
											<button type="submit" class="btn btn-primary">Enviar a Autorizaci&oacute;n</button>
                    					    <button type="reset" class="btn btn-default">Regresar</button>
											</div>
											</div>
										</div>
	
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
				
				<!------------------------------------------------------------------------------------------->	
			
			
         

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