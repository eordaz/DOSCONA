<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
     	<%@ include  file="navmenu.html" %>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Generar CFDI </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			
			<div class="panel-body">
	<!-- Nav tabs -->
					<ul class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">Datos de Emisor</a>
				
					</li>
					<li><a href="#profile" data-toggle="tab">Datos de Receptor</a>
				
					</li>
					<li><a href="#conceptos" data-toggle="tab">Conceptos</a>
				
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
                                            <label>RFC</label>
                                            <input class="form-control"  disabled="disabled" value="UNA2907227Y5">
									</div>									
								</div>
								<div class="col-lg-3">							
                               	  <div class="form-group">
                                            <label>Nombre</label>
											<input class="form-control"  disabled="disabled" value="UNIVERSIDAD NACIONAL AUTONOMA DE MÉXICO">
                                	</div>									
								</div>
							 </div>
							 <div class="row">	
								<div class="col-lg-3">
								  <div class="form-group">
                                    <label>Calle</label>
									 <input name="Input2" class="disable form-control" disabled="disabled" value="AV.UNIVERSIDAD S/N">
								  </div>	
								</div>
								<div class="col-lg-2">
								  <div class="form-group">
                                    <label>No. Exterior</label>
                                   
                                    <input name="Input"  disabled="disabled" class="form-control" value="">
                                  </div>	
								</div>
								<div class="col-lg-2">
								  <div class="form-group">
                                    <label>No. Interior</label>
                                    <input name="Input" class="disable form-control" disabled="disabled" value="">
                                  </div>	
								</div>
                             </div>
							 <div class="row">	
								<div class="col-lg-3">
								  <div class="form-group">
                                    <label>Colonia</label>
									  <input name="Input" class="disable form-control" disabled="disabled" value="COYOACÁN">
								  </div>	
								</div>
								<div class="col-lg-2">
								  <div class="form-group">
                                    <label>Delegación</label>
                                    <input name="Input" class="disable form-control" disabled="disabled" value="COYOACÁN">
                                  </div>	
								</div>
								<div class="col-lg-2">
								  <div class="form-group">
                                    <label>Código Postal</label>
                                    <input name="Input" class="disable form-control" disabled="disabled" value="04510">
                                  </div>	
								</div>
								</div>
								<div  class="row">
								<div class="col-lg-3">
								  <div class="form-group" >
                                    <label>Estado</label>
                                      <select class="form-control" disabled="disabled">
									  	<option value="1	">	Aguascalientes	</option>
										<option value="2">	Baja California	</option>
										<option value="3">	Baja California Sur	</option>
										<option value="4">	Campeche	</option>
										<option value="5">	Chiapas	</option>
										<option value="6">	Chihuahua	</option>
										<option value="7" selected="selected">	Ciudad de México	</option>
										<option value="8">	Coahuila	</option>
										<option value="9">	Colima	</option>
										<option value="10">	Durango	</option>
										<option value="11">	Estado de México	</option>
										<option value="12">	Guanajuato	</option>
										<option value="13">	Guerrero	</option>
										<option value="14">	Hidalgo	</option>
										<option value="15">	Jalisco	</option>
										<option value="16">	Michoacán	</option>
										<option value="17">	Morelos	</option>
										<option value="18">	Nayarit	</option>
										<option value="19">	Nuevo León	</option>
										<option value="20">	Oaxaca	</option>
										<option value="21">	Puebla	</option>
										<option value="22">	Querátaro	</option>
										<option value="23">	Quintana Roo	</option>
										<option value="24">	San Luis Potosí	</option>
										<option value="25">	Sinaloa	</option>
										<option value="26">	Sonora	</option>
										<option value="27">	Tabasco	</option>
										<option value="28">	Tamaulipas	</option>
										<option value="29">	Tlaxcala	</option>
										<option value="30">	Veracruz	</option>
										<option value="31">	YucatÃ¡n	</option>
										<option value="32">	Zacatecas	</option>

                                 </select>
                                  </div>	
								</div>
								<div class="col-lg-3">
								  <div class="form-group">
                                    <label>País</label>
                                      <select class="form-control" disabled="disabled">
                                                <option value="1">México</option>
                                            </select>
                                  </div>	
								</div>
                             </div>                             
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
                                            <input class="form-control">
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
                                            <label>RFC</label>
                                            <input class="form-control" disabled="disabled" value="CNC701230PD0">
									</div>									
								</div>
								 <div class="col-lg-3">
                                	<div class="form-group">
                                            <label>Nombre</label>
                                            <input class="form-control" disabled="disabled" VALUE="CONSEJO NACIONAL DE  CIENCIA Y  TECNOLOGÍA">
									</div>									
								</div>
							 </div>
							 <div class="row">	
								<div class="col-lg-3">
								  <div class="form-group">
                                    <label>Calle</label>
                                    <input name="Input" class="disable form-control" disabled="disabled" value="AV. INSURGENTES SUR">
                                  </div>	
								</div>
								<div class="col-lg-2">
								  <div class="form-group">
                                    <label>No. Exterior</label>
                                    <input name="Input" class="disable form-control" disabled="disabled" value="1582">
                                  </div>	
								</div>
								<div class="col-lg-2">
								  <div class="form-group">
                                    <label>No. Interior</label>
									 <input name="Input" class="disable form-control" disabled="disabled" value="">
								  </div>	
								</div>
                             </div>
							 <div class="row">	
								<div class="col-lg-3">
								  <div class="form-group">
                                    <label>Colonia</label>
                                    <input name="Input" class="disable form-control" disabled="disabled" value="CREDITO CONSTRUCTOR">
                                  </div>	
								</div>
								<div class="col-lg-2">
								  <div class="form-group">
                                    <label>Delegación</label>                                   
                                    <input name="Input" class="disable form-control" disabled="disabled" value="BENITO JUAREZ">
                                  </div>	
								</div>
								<div class="col-lg-2">
								  <div class="form-group">
                                    <label>Código Postal</label>
                                    <input name="Input" class="disable form-control" disabled="disabled" value="03940">
                                  </div>	
								</div>
								</div>
								<div class="row">
								<div class="col-lg-3">
								  <div class="form-group">
                                    <label>Estado</label>
                                      <select class="form-control" disabled="disabled">                                        
									  	<option value="1	">	Aguascalientes	</option>
										<option value="2">	Baja California	</option>
										<option value="3">	Baja California Sur	</option>
										<option value="4">	Campeche	</option>
										<option value="5">	Chiapas	</option>
										<option value="6">	Chihuahua	</option>
										<option value="7" selected="selected">	Ciudad de México	</option>
										<option value="8">	Coahuila	</option>
										<option value="9">	Colima	</option>
										<option value="10">	Durango	</option>
										<option value="11">	Estado de México	</option>
										<option value="12">	Guanajuato	</option>
										<option value="13">	Guerrero	</option>
										<option value="14">	Hidalgo	</option>
										<option value="15">	Jalisco	</option>
										<option value="16">	MichoacÃ¡n	</option>
										<option value="17">	Morelos	</option>
										<option value="18">	Nayarit	</option>
										<option value="19">	Nuevo León	</option>
										<option value="20">	Oaxaca	</option>
										<option value="21">	Puebla	</option>
										<option value="22">	Querátaro	</option>
										<option value="23">	Quintana Roo	</option>
										<option value="24">	San Luis Potosí	</option>
										<option value="25">	Sinaloa	</option>
										<option value="26">	Sonora	</option>
										<option value="27">	Tabasco	</option>
										<option value="28">	Tamaulipas	</option>
										<option value="29">	Tlaxcala	</option>
										<option value="30">	Veracruz	</option>
										<option value="31">	Yucatán	</option>
										<option value="32">	Zacatecas	</option>
                                            </select>
                                  </div>	
								</div>
								<div class="col-lg-3">
								  <div class="form-group">
                                    <label>Pais</label>
                                      <select class="form-control" disabled="disabled">
                                                <option>México</option>
                                            </select>
                                  </div>	
								</div>
                             </div>
						
							  <div class="row">             
                             	 <div class="col-lg-3">
                                 	<div class="form-group">
                                            <label>Cuenta Bancaria</label>
                                            <input class="form-control"  value="02118004018868851">
                                    </div>
								 </div>
								 	 <div class="col-lg-2">
                                 	<div class="form-group">
                                            <label>Banco</label>
                                                <select class="form-control" >                                                
												<option value="1">CITIBANAMEX      BANCO NACIONAL DE MÉXICO, S.A.</option>
															<option value="2" selected="selected">BBVA BANCOMER      BBVA BANCOMER, S.A.</option>
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
								  <div class="col-lg-2">
                                 	<div class="form-group">
                                            <label>Moneda</label>
                                                <select class="form-control" >
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
															<option value="100" selected="selected">PESO MEXICANO</option>
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
							
							 
							  <!-- /.panel-row -->
                        </div>         
			
					<div class="tab-pane fade" id="conceptos">
					<br/>
					<br/>
					<div class="row">
                                <div class="col-lg-2">							
                                	<div class="form-group">
                                            <label>Clave del Producto</label>
                                            <input class="form-control"  value="">
									</div>									
								</div>
								 <div class="col-lg-2">
                                	<div class="form-group">
                                            <label>Cantidad</label>
                                            <input class="form-control" VALUE="">
									</div>									
								</div>
								 <div class="col-lg-2">
                                	<div class="form-group">
                                            <label>Descripción</label>
                                            <input class="form-control"  VALUE="">
									</div>									
								</div>
								 <div class="col-lg-2">
                                	<div class="form-group">
                                            <label>Precio unitario</label>
                                            <input class="form-control"  VALUE="">
									</div>									
								</div>
								 <div class="col-lg-2">
                                	<div class="form-group">
                                            <label>Importe</label>
                                            <input class="form-control" VALUE="">
									</div>									
								</div>
					</div>
					 <div class="row"> 
					 		<div class="col-lg-10">
                                	<div class="form-group">
                                            <label>Observaciones</label>
                                            <input class="form-control" VALUE="">
							</div>	
							 
					 </div>
								
							 <div class="row">             
                             	
                             	 <div class="col-lg-10"  align="right">
                                 	<div class="form-group">
                                		<button type="button" class="btn btn-primary">Emitir CFDI</button>
										<button type="button" class="btn btn-default">Limpiar</button>
                                    </div>
								 </div>
                             </div>	
							 	
							 
							  <!-- /.panel-row -->
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

   

</body>

</html>