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

<!-- --------------------------------------termina navegacion menu -->

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Solicitud Cuenta Bancaria </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="panel-body">
	<!-- Nav tabs -->
					<ul class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">Datos de Cuenta Bancaria</a>
				
					</li>
					<li><a href="#profile" data-toggle="tab">Responsables</a>
				
					</li>
					<li><a href="#messages" data-toggle="tab">Anexos</a>
				
					</li>
					
					</ul>
					
					<!-- Tab panes -->
					<div class="tab-content">
					<div class="tab-pane fade in active" id="home">
					<br/>
					<br/>
					<div class="row">
                                <div class="col-lg-3">
                                	<div class="form-group">
                                            <label>No. de Proyecto</label>
                                            <input class="form-control">
                                    </div>
								</div>                               
								<div class="col-lg-6">
								  <div class="form-group">
                                    <label>Nombre de Proyecto</label>
                                    <input name="Input" class="disable form-control">
                                  </div>	
								</div>
								<div class="col-lg-3">	
									
								</div>
                             </div>
                             <div class="row">             
                             	 <div class="col-lg-3">
                                 	<div class="form-group">
                                            <label>Banco</label>
											<select class="form-control">
												<option value="1">CITIBANAMEX      BANCO NACIONAL DE MÉXICO, S.A.</option>
												<option value="2">BBVA BANCOMER      BBVA BANCOMER, S.A.</option>
												<option value="3">SANTANDER      BANCO SANTANDER, S.A.</option>
												<option value="4">BANJERCITO      BANCO NACIONAL DEL EJÉRCITO, FUERZA AÉREA Y ARMADA, S.N.C.</option>
												<option value="5">HSBC      HSBC MÉXICO, S.A.</option>
												<option value="6">GE MONEY      GE MONEY BANK, S.A.</option>
												<option value="7">BAJÍO      BANCO DEL BAJÍO, S.A.</option>
												<option value="8">IXE      IXE BANCO, S.A.</option>
												<option value="9">INBURSA      BANCO INBURSA, S.A.</option>
												<option value="10">INTERACCIONES      BANCO INTERACCIONES, S.A.</option>
												<option value="11">MIFEL      BANCA MIFEL, S.A.</option>
												<option value="12">SCOTIABANK      SCOTIABANK INVERLAT, S.A.</option>
												<option value="13">BANREGIO      BANCO REGIONAL DE MONTERREY, S.A.</option>
												<option value="14">INVEX      BANCO INVEX, S.A.</option>
												<option value="15">BANSI      BANSI, S.A.</option>
												<option value="16">AFIRME      BANCA AFIRME, S.A.</option>
												<option value="17">BANORTE      BANCO MERCANTIL DEL NORTE, S.A.</option>
												<option value="18">ABNAMRO      ABN AMRO BANK MÉXICO, S.A.</option>
												<option value="19">AMERICAN EXPRESS      AMERICAN EXPRESS BANK (MÉXICO), S.A.</option>
												<option value="20">BAMSA      BANK OF AMERICA MÉXICO, S.A.</option>
												<option value="21">TOKYO      BANK OF TOKYO-MITSUBISHI UFJ (MÉXICO), S.A.</option>
												<option value="22">JP MORGAN      BANCO J.P. MORGAN, S.A.</option>
												<option value="23">BMONEX      BANCO MONEX, S.A.</option>
												<option value="24">VE POR MAS      BANCO VE POR MAS, S.A.</option>
												<option value="25">ING      ING BANK (MÉXICO), S.A.</option>
												<option value="26">DEUTSCHE      DEUTSCHE BANK MÉXICO, S.A.</option>
												<option value="27">CREDIT SUISSE      BANCO CREDIT SUISSE (MÉXICO), S.A.</option>
												<option value="28">AZTECA      BANCO AZTECA, S.A.</option>
												<option value="29">AUTOFIN      BANCO AUTOFIN MÉXICO, S.A.</option>
												<option value="30">BARCLAYS      BARCLAYS BANK MÉXICO, S.A.</option>
												<option value="31">COMPARTAMOS      BANCO COMPARTAMOS, S.A.</option>
												<option value="32">FAMSA      BANCO AHORRO FAMSA, S.A.</option>
												<option value="33">BMULTIVA      BANCO MULTIVA, S.A.</option>
												<option value="34">PRUDENTIAL      PRUDENCIAL BANK, S.A.</option>
												<option value="35">WAL-MART      BANCO WAL MART DE MÉXICO ADELANTE, S.A.</option>
												<option value="36">NAFIN      NACIONAL FINANCIERA, S.N.C.</option>
												<option value="37">REGIONAL      BANCO REGIONAL, S.A.</option>
												<option value="38">BANCOPPEL      BANCOPPEL, S.A.</option>
												<option value="39">AMIGO      BANCO AMIGO, S.A.</option>
												<option value="40">UBS BANK      UBS BANCO, S.A.</option>
												<option value="41">FÁCIL      BANCO FÁCIL, S.A.</option>
												<option value="42">VOLKSWAGEN      VOLKSWAGEN BANK S.A. INSTITUCIÓN DE BANCA MÚLTIPLE</option>
												<option value="43">CIBanco      CONSULTORÍA INTERNACIONAL BANCO, S.A.</option>
												<option value="44">BBASE      BANCO BASE, S.A. DE I.B.M.</option>
												<option value="45">BANKAOOL      BANKAOOL, S.A., INSTITUCIÓN DE BANCA MÚLTIPLE</option>
												<option value="46">BANSEFI      BANCO DEL AHORRO NACIONAL Y SERVICIOS FINANCIEROS, S.N.C.</option>
												<option value="47">HIPOTECARIA FEDERAL      SOCIEDAD HIPOTECARIA FEDERAL, S.N.C.</option>
												<option value="48">MONEXCB      MONEX CASA DE BOLSA, S.A. DE C.V.</option>
												<option value="49">GBM      GBM GRUPO BURSÁTIL MEXICANO, S.A. DE C.V.</option>
												<option value="50">MASARI CC.      MASARI CASA DE CAMBIO, S.A. DE C.V.</option>
												<option value="51">C.B. INBURSA      INVERSORA BURSÁTIL, S.A. DE C.V.</option>
												<option value="52">VALUÉ      VALUÉ, S.A. DE C.V., CASA DE BOLSA</option>
												<option value="53">CB BASE      BASE INTERNACIONAL CASA DE BOLSA, S.A. DE C.V.</option>
												<option value="54">TIBER      CASA DE CAMBIO TIBER, S.A. DE C.V.</option>
												<option value="55">VECTOR      VECTOR CASA DE BOLSA, S.A. DE C.V.</option>
												<option value="56">B&B      B Y B CASA DE CAMBIO, S.A. DE C.V.</option>
												<option value="57">INTERCAM      INTERCAM CASA DE CAMBIO, S.A. DE C.V.</option>
												<option value="58">MULTIVA      MULTIVALORES CASA DE BOLSA, S.A. DE C.V. MULTIVA GPO. FIN.</option>
												<option value="59">ACCIVAL      ACCIONES Y VALORES BANAMEX, S.A. DE C.V., CASA DE BOLSA</option>
												<option value="60">MERRILL LYNCH      MERRILL LYNCH MÉXICO, S.A. DE C.V., CASA DE BOLSA</option>
												<option value="61">FINAMEX      CASA DE BOLSA FINAMEX, S.A. DE C.V.</option>
												<option value="62">VALMEX      VALORES MEXICANOS CASA DE BOLSA, S.A. DE C.V.</option>
												<option value="63">ÚNICA      ÚNICA CASA DE CAMBIO, S.A. DE C.V.</option>
												<option value="64">ASEGURADORA MAPFRE      MAPFRE TEPEYAC S.A.</option>
												<option value="65">AFORE PROFUTURO      PROFUTURO G.N.P., S.A. DE C.V.</option>
												<option value="66">CB ACTINBER      ACTINVER CASA DE BOLSA, S.A. DE C.V.</option>
												<option value="67">ACTINVE SI      ACTINVER S.A. DE C.V.</option>
												<option value="68">SKANDIA      SKANDIA VIDA S.A. DE C.V.</option>
												<option value="69">CONSULTORÍA      CONSULTORÍA INTERNACIONAL CASA DE CAMBIO, S.A. DE C.V.</option>
												<option value="70">ZURICH      ZURICH COMPAÑÍA DE SEGUROS, S.A.</option>
												<option value="71">ZURICHVI      ZURICH VIDA, COMPAÑÍA DE SEGUROS, S.A.</option>
												<option value="72">HIPOTECARIA SU CASITA      HIPOTECARIA SU CASITA, S.A. DE C.V.</option>
												<option value="73">C.B. INTERCAM      INTERCAM CASA DE BOLSA, S.A. DE C.V.</option>
												<option value="74">C.B. VANGUARDIA      VANGUARDIA CASA DE BOLSA, S.A. DE C.V.</option>
												<option value="75">BULLTICK C.B.      BULLTICK CASA DE BOLSA, S.A. DE C.V.</option>
												<option value="76">STERLING      STERLING CASA DE CAMBIO, S.A. DE C.V.</option>
												<option value="77">FINCOMUN      FINCOMÚN, SERVICIOS FINANCIEROS COMUNITARIOS, S.A. DE C.V., SOCIEDAD FINANCIERA POPULAR.</option>
												<option value="78">ORDER      ORDEREXPRESS CASA DE CAMBIO , S.A. DE C.V. AAC</option>
												<option value="79">AKALA      AKALA, S.A. DE C.V., SOCIEDAD FINANCIERA POPULAR</option>
												<option value="80">JP MORGAN C.B.      J.P. MORGAN CASA DE BOLSA, S.A. DE C.V.</option>
												<option value="81">STP      SISTEMA DE TRANSFERENCIAS Y PAGOS STP, S.A. DE C.V., SOFOM E.N.R.</option>
												<option value="82">SKANDIA      SKANDIA OPERADORA S.A. DE C.V.</option>
												<option value="83">CLS      CLS BANK INTERNATIONAL</option>
												<option value="84">INDEVAL      SD. INDEVAL, S.A. DE C.V.</option>
												<option value="85">ABN AMRO BANK      ABN AMRO BANK</option>
												<option value="86">BANK OF MONTREAL      BANK OF MONTREAL</option>
												<option value="87">BARCLAYS BANK PLC      BARCLAYS BANK PLC</option>
												<option value="88">NORTHERN TRUST      NORTHERN TRUST</option>
												<option value="89">BANCO BILBAO VIZCAYA      BANCO BILBAO VIZCAYA</option>
												<option value="90">BANCO DE CHILE      BANCO DE CHILE</option>
												<option value="91">BANCO SANTANDER      BANCO SANTANDER</option>
												<option value="92">BASLER KANTONALBANK      BASLER KANTONALBANK</option>
												<option value="93">HSBC      HSBC</option>
												<option value="94">BNP PARIBAS      BNP PARIBAS</option>
												<option value="95">BANK OF NEW YORK      BANK OF NEW YORK</option>
												<option value="96">BANK OF AMERICA, N.A.      BANK OF AMERICA, N.A.</option>
												<option value="97">BANK OF AMERICA      BANK OF AMERICA</option>
												<option value="98">BANK OF AMERICA N.A.      BANK OF AMERICA N.A.</option>
												<option value="99">BANCO DO BRASIL      BANCO DO BRASIL</option>
												<option value="100">BANCO SANTANDER, S.A.      BANCO SANTANDER, S.A.</option>
												<option value="101">CAIXABANK, S.A.      CAIXABANK, S.A.</option>
												<option value="102">JPMORGAN CHASE BANK      JPMORGAN CHASE BANK</option>
												<option value="103">CHASE MANHATTAN BANK      CHASE MANHATTAN BANK</option>
												<option value="104">CITY NATIONAL BANK      CITY NATIONAL BANK</option>
												<option value="105">CITIBANK N.A.      CITIBANK N.A.</option>
												<option value="106">CITIBANK      CITIBANK</option>
												<option value="107">CITIBANK NA      CITIBANK NA</option>
												<option value="108">CREDIT LYONNAIS      CREDIT LYONNAIS</option>
												<option value="109">COMMERZBANK      COMMERZBANK</option>
												<option value="110">CHARTER ONE BANK      CHARTER ONE BANK</option>
												<option value="111">COMPASS BANK      COMPASS BANK</option>
												<option value="112">CREDIT SUISSE      CREDIT SUISSE</option>
												<option value="113">CITIZENS BANK      CITIZENS BANK</option>
												<option value="114">DANSKE BANK      DANSKE BANK</option>
												<option value="115">DEUTSCHE BANK      DEUTSCHE BANK</option>
												<option value="116">DEUTSCHE BANK AG      DEUTSCHE BANK AG</option>
												<option value="117">DEUTSCHE      DEUTSCHE</option>
												<option value="118">FIRST NATIONAL BANK      FIRST NATIONAL BANK</option>
												<option value="119">FROST NATIONAL BANK      FROST NATIONAL BANK</option>
												<option value="120">PACIFIC WESTERN BANK      PACIFIC WESTERN BANK</option>
												<option value="121">FROST BANK      FROST BANK</option>
												<option value="122">FINANCIAL SERVICES      FINANCIAL SERVICES</option>
												<option value="123">BNP PARIBAS FORTIS      BNP PARIBAS FORTIS</option>
												<option value="124">BMO HARRIS BANK N.A.      BMO HARRIS BANK N.A.</option>
												<option value="125">HSBC BANK CANADA      HSBC BANK CANADA</option>
												<option value="126">HSBC BANK PLC      HSBC BANK PLC</option>
												<option value="127">ISRAEL DISCOUNT BANK LTD      ISRAEL DISCOUNT BANK LTD</option>
												<option value="128">NATIXIS      NATIXIS</option>
												<option value="129">LLOYDS TSB BANK PLC      LLOYDS TSB BANK PLC</option>
												<option value="130">COMERICA BANK      COMERICA BANK</option>
												<option value="131">THE BANK OF NOVA SCOTIA      THE BANK OF NOVA SCOTIA</option>
												<option value="132">NATIONAL PENN BANK      NATIONAL PENN BANK</option>
												<option value="133">TD BANK, N.A.      TD BANK, N.A.</option>
												<option value="134">WELLS FARGO BANK      WELLS FARGO BANK</option>
												<option value="135">WELLS FARGO BANK, N. A.      WELLS FARGO BANK, N. A.</option>
												<option value="136">ROYAL BANK OF CANADA      ROYAL BANK OF CANADA</option>
												<option value="137">SUNTRUST BANK      SUNTRUST BANK</option>
												<option value="138">TOWN BANK      TOWN BANK</option>
												<option value="139">TRESOR PUBLIC      TRESOR PUBLIC</option>
												<option value="140">UNION BANK      UNION BANK</option>
												<option value="141">UBS AG      UBS AG</option>
												<option value="142">UMPQUA BANK      UMPQUA BANK</option>
												<option value="143">UNICREDIT BANCA      UNICREDIT BANCA</option>
												<option value="144">REGIONS BANK      REGIONS BANK</option>
												<option value="145">ARGENTA      ARGENTA</option>
												</select>                                        
                                    </div>
								 </div>
								  <div class="col-lg-3">
                                 	<div class="form-group">
                                            <label>Moneda</label>
                                            <select class="form-control">
                                                <option>MXN Moneda Nacional</option>
                                                <option>DLL Dolares</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                    </div>
								 </div>
								 <div class="col-lg-3">
                                 	
								 </div>
								 <div class="col-lg-3">
                                 	
								 </div>
                             </div>
                              <div class="row">             
                             	 <div class="col-lg-2">
                                 	<div class="form-group">
                                           <label>Fecha de  solicitud</label>
                                    		<input name="Input"  id="fecha_solicitud" class="disable form-control  date"/>
                                    </div>
                                 </div>
                              </div>      
					</div>
					<div class="tab-pane fade" id="profile">
					<br/>
					<br/>
					<div class="row">             
                             	 <div class="col-lg-3">
                                 	<div class="form-group">
                                            <label>Responsable Administrativo</label>
                                            <input class="form-control" placeholder="RFC">
                                    </div>
								</div>	
								<div class="col-lg-3">
									<div class="form-group">
									 		<label style="height:20px" ></label>
                                            <input class="form-control" placeholder="Nombre">
                                    </div>
							   </div>
                             </div>
							 <div class="row">             
                             	 <div class="col-lg-3">
                                 	<div class="form-group">
                                            <label>Responsable Tecnico</label>
                                            <input class="form-control" placeholder="RFC">
                                    </div>
								 </div>	
	       						 <div class="col-lg-3">
	                                 	<div class="form-group">
                                            <label style="height:20px"></label>
                                            <input class="form-control" placeholder="Nombre">
                                        </div>
								 </div>
                             </div>
							 <div class="row">             
                             	 <div class="col-lg-6">
                                 	<div class="form-group">
                                            <label>Observaciones</label>
                                            <input class="form-control">
                                    </div>
								 </div>
                             </div>
							 
					</div>
					<div class="tab-pane fade" id="messages">
					<br/>
					<br/>
					<div class="row">             
                             	 <div class="col-lg-6">
                                 	<div class="form-group">
                                            <label>Caratula de servicios y productos </label>                                           
                                            <input type="file">
                                    </div>
								 </div>
                             </div>
							 <div class="row">             
                             	 <div class="col-lg-6">
                                 	<div class="form-group">
                                            <label>Tarjeta de firmas  </label>                                           
                                            <input type="file">
                                    </div>
								 </div>
                             </div>
							 <div class="row">             
                             	 <div class="col-lg-6">
                                 	<div class="form-group">
                                            <label>Responsiva </label>                                            										
                                            <input type="file">
                                    </div>
								 </div>
                             </div>
							 <div class="row">             
                             	 <div class="col-lg-3" align="right">
                                 	<div class="form-group">
                                        <button type="submit" class="btn btn-primary">Guardar</button>
			                            <button type="reset" class="btn btn-default">Limpiar</button>
    
                                    </div>
								 </div>
                             </div>
					</div>
		
					</div>
					</div>
					<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
					</div>
							
			
        </div>
        <!-- /#page-wrapper -->

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
