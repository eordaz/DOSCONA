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
											<input class="form-control"  disabled="disabled" value="UNIVERSIDAD NACIONAL AUTONOMA DE M�XICO">
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
									  <input name="Input" class="disable form-control" disabled="disabled" value="COYOAC�N">
								  </div>	
								</div>
								<div class="col-lg-2">
								  <div class="form-group">
                                    <label>Delegaci�n</label>
                                    <input name="Input" class="disable form-control" disabled="disabled" value="COYOAC�N">
                                  </div>	
								</div>
								<div class="col-lg-2">
								  <div class="form-group">
                                    <label>C�digo Postal</label>
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
										<option value="7" selected="selected">	Ciudad de M�xico	</option>
										<option value="8">	Coahuila	</option>
										<option value="9">	Colima	</option>
										<option value="10">	Durango	</option>
										<option value="11">	Estado de M�xico	</option>
										<option value="12">	Guanajuato	</option>
										<option value="13">	Guerrero	</option>
										<option value="14">	Hidalgo	</option>
										<option value="15">	Jalisco	</option>
										<option value="16">	Michoac�n	</option>
										<option value="17">	Morelos	</option>
										<option value="18">	Nayarit	</option>
										<option value="19">	Nuevo Le�n	</option>
										<option value="20">	Oaxaca	</option>
										<option value="21">	Puebla	</option>
										<option value="22">	Quer�taro	</option>
										<option value="23">	Quintana Roo	</option>
										<option value="24">	San Luis Potos�	</option>
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
                                    <label>Pa�s</label>
                                      <select class="form-control" disabled="disabled">
                                                <option value="1">M�xico</option>
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
                                            <input class="form-control" disabled="disabled" VALUE="CONSEJO NACIONAL DE  CIENCIA Y  TECNOLOG�A">
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
                                    <label>Delegaci�n</label>                                   
                                    <input name="Input" class="disable form-control" disabled="disabled" value="BENITO JUAREZ">
                                  </div>	
								</div>
								<div class="col-lg-2">
								  <div class="form-group">
                                    <label>C�digo Postal</label>
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
										<option value="7" selected="selected">	Ciudad de M�xico	</option>
										<option value="8">	Coahuila	</option>
										<option value="9">	Colima	</option>
										<option value="10">	Durango	</option>
										<option value="11">	Estado de M�xico	</option>
										<option value="12">	Guanajuato	</option>
										<option value="13">	Guerrero	</option>
										<option value="14">	Hidalgo	</option>
										<option value="15">	Jalisco	</option>
										<option value="16">	Michoacán	</option>
										<option value="17">	Morelos	</option>
										<option value="18">	Nayarit	</option>
										<option value="19">	Nuevo Le�n	</option>
										<option value="20">	Oaxaca	</option>
										<option value="21">	Puebla	</option>
										<option value="22">	Quer�taro	</option>
										<option value="23">	Quintana Roo	</option>
										<option value="24">	San Luis Potos�	</option>
										<option value="25">	Sinaloa	</option>
										<option value="26">	Sonora	</option>
										<option value="27">	Tabasco	</option>
										<option value="28">	Tamaulipas	</option>
										<option value="29">	Tlaxcala	</option>
										<option value="30">	Veracruz	</option>
										<option value="31">	Yucat�n	</option>
										<option value="32">	Zacatecas	</option>
                                            </select>
                                  </div>	
								</div>
								<div class="col-lg-3">
								  <div class="form-group">
                                    <label>Pais</label>
                                      <select class="form-control" disabled="disabled">
                                                <option>M�xico</option>
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
												<option value="1">CITIBANAMEX      BANCO NACIONAL DE M�XICO, S.A.</option>
															<option value="2" selected="selected">BBVA BANCOMER      BBVA BANCOMER, S.A.</option>
															<option value="3">SANTANDER      BANCO SANTANDER, S.A.</option>
															<option value="4">BANJERCITO      BANCO NACIONAL DEL EJ�RCITO, FUERZA A�REA Y ARMADA, S.N.C.</option>
															<option value="5">HSBC      HSBC M�XICO, S.A.</option>
															<option value="6">GE MONEY      GE MONEY BANK, S.A.</option>
															<option value="7">BAJ�O      BANCO DEL BAJ�O, S.A.</option>
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
															<option value="18">ABNAMRO      ABN AMRO BANK M�XICO, S.A.</option>
															<option value="19">AMERICAN EXPRESS      AMERICAN EXPRESS BANK (M�XICO), S.A.</option>
															<option value="20">BAMSA      BANK OF AMERICA M�XICO, S.A.</option>
															<option value="21">TOKYO      BANK OF TOKYO-MITSUBISHI UFJ (M�XICO), S.A.</option>
															<option value="22">JP MORGAN      BANCO J.P. MORGAN, S.A.</option>
															<option value="23">BMONEX      BANCO MONEX, S.A.</option>
															<option value="24">VE POR MAS      BANCO VE POR MAS, S.A.</option>
															<option value="25">ING      ING BANK (M�XICO), S.A.</option>
															<option value="26">DEUTSCHE      DEUTSCHE BANK M�XICO, S.A.</option>
															<option value="27">CREDIT SUISSE      BANCO CREDIT SUISSE (M�XICO), S.A.</option>
															<option value="28">AZTECA      BANCO AZTECA, S.A.</option>
															<option value="29">AUTOFIN      BANCO AUTOFIN M�XICO, S.A.</option>
															<option value="30">BARCLAYS      BARCLAYS BANK M�XICO, S.A.</option>
															<option value="31">COMPARTAMOS      BANCO COMPARTAMOS, S.A.</option>
															<option value="32">FAMSA      BANCO AHORRO FAMSA, S.A.</option>
															<option value="33">BMULTIVA      BANCO MULTIVA, S.A.</option>
															<option value="34">PRUDENTIAL      PRUDENCIAL BANK, S.A.</option>
															<option value="35">WAL-MART      BANCO WAL MART DE M�XICO ADELANTE, S.A.</option>
															<option value="36">NAFIN      NACIONAL FINANCIERA, S.N.C.</option>
															<option value="37">REGIONAL      BANCO REGIONAL, S.A.</option>
															<option value="38">BANCOPPEL      BANCOPPEL, S.A.</option>
															<option value="39">AMIGO      BANCO AMIGO, S.A.</option>
															<option value="40">UBS BANK      UBS BANCO, S.A.</option>
															<option value="41">F�CIL      BANCO F�CIL, S.A.</option>
															<option value="42">VOLKSWAGEN      VOLKSWAGEN BANK S.A. INSTITUCI�N DE BANCA M�LTIPLE</option>
															<option value="43">CIBanco      CONSULTOR�A INTERNACIONAL BANCO, S.A.</option>
															<option value="44">BBASE      BANCO BASE, S.A. DE I.B.M.</option>
															<option value="45">BANKAOOL      BANKAOOL, S.A., INSTITUCI�N DE BANCA M�LTIPLE</option>
															<option value="46">BANSEFI      BANCO DEL AHORRO NACIONAL Y SERVICIOS FINANCIEROS, S.N.C.</option>
															<option value="47">HIPOTECARIA FEDERAL      SOCIEDAD HIPOTECARIA FEDERAL, S.N.C.</option>
															<option value="48">MONEXCB      MONEX CASA DE BOLSA, S.A. DE C.V.</option>
															<option value="49">GBM      GBM GRUPO BURS�TIL MEXICANO, S.A. DE C.V.</option>
															<option value="50">MASARI CC.      MASARI CASA DE CAMBIO, S.A. DE C.V.</option>
															<option value="51">C.B. INBURSA      INVERSORA BURS�TIL, S.A. DE C.V.</option>
															<option value="52">VALU�      VALU�, S.A. DE C.V., CASA DE BOLSA</option>
															<option value="53">CB BASE      BASE INTERNACIONAL CASA DE BOLSA, S.A. DE C.V.</option>
															<option value="54">TIBER      CASA DE CAMBIO TIBER, S.A. DE C.V.</option>
															<option value="55">VECTOR      VECTOR CASA DE BOLSA, S.A. DE C.V.</option>
															<option value="56">B&B      B Y B CASA DE CAMBIO, S.A. DE C.V.</option>
															<option value="57">INTERCAM      INTERCAM CASA DE CAMBIO, S.A. DE C.V.</option>
															<option value="58">MULTIVA      MULTIVALORES CASA DE BOLSA, S.A. DE C.V. MULTIVA GPO. FIN.</option>
															<option value="59">ACCIVAL      ACCIONES Y VALORES BANAMEX, S.A. DE C.V., CASA DE BOLSA</option>
															<option value="60">MERRILL LYNCH      MERRILL LYNCH M�XICO, S.A. DE C.V., CASA DE BOLSA</option>
															<option value="61">FINAMEX      CASA DE BOLSA FINAMEX, S.A. DE C.V.</option>
															<option value="62">VALMEX      VALORES MEXICANOS CASA DE BOLSA, S.A. DE C.V.</option>
															<option value="63">�NICA      �NICA CASA DE CAMBIO, S.A. DE C.V.</option>
															<option value="64">ASEGURADORA MAPFRE      MAPFRE TEPEYAC S.A.</option>
															<option value="65">AFORE PROFUTURO      PROFUTURO G.N.P., S.A. DE C.V.</option>
															<option value="66">CB ACTINBER      ACTINVER CASA DE BOLSA, S.A. DE C.V.</option>
															<option value="67">ACTINVE SI      ACTINVER S.A. DE C.V.</option>
															<option value="68">SKANDIA      SKANDIA VIDA S.A. DE C.V.</option>
															<option value="69">CONSULTOR�A      CONSULTOR�A INTERNACIONAL CASA DE CAMBIO, S.A. DE C.V.</option>
															<option value="70">ZURICH      ZURICH COMPA��A DE SEGUROS, S.A.</option>
															<option value="71">ZURICHVI      ZURICH VIDA, COMPA��A DE SEGUROS, S.A.</option>
															<option value="72">HIPOTECARIA SU CASITA      HIPOTECARIA SU CASITA, S.A. DE C.V.</option>
															<option value="73">C.B. INTERCAM      INTERCAM CASA DE BOLSA, S.A. DE C.V.</option>
															<option value="74">C.B. VANGUARDIA      VANGUARDIA CASA DE BOLSA, S.A. DE C.V.</option>
															<option value="75">BULLTICK C.B.      BULLTICK CASA DE BOLSA, S.A. DE C.V.</option>
															<option value="76">STERLING      STERLING CASA DE CAMBIO, S.A. DE C.V.</option>
															<option value="77">FINCOMUN      FINCOM�N, SERVICIOS FINANCIEROS COMUNITARIOS, S.A. DE C.V., SOCIEDAD FINANCIERA POPULAR.</option>
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
															<option value="2">LEK ALBAN�S</option>
															<option value="3">DRAM ARMENIO</option>
															<option value="4">FLOR�N ANTILLANO NEERLAND�S</option>
															<option value="5">KWANZA ANGOLE�O</option>
															<option value="6">PESO ARGENTINO</option>
															<option value="7">D�LAR AUSTRALIANO</option>
															<option value="8">FLOR�N ARUBE�O</option>
															<option value="9">MANAT AZERBAIYANO</option>
															<option value="10">MARCO CONVERTIBLE DE BOSNIA-HERZEGOVINA</option>
															<option value="11">D�LAR DE BARBADOS</option>
															<option value="12">TAKA DE BANGLAD�S</option>
															<option value="13">LEV B�LGARO</option>
															<option value="14">DINAR BAHREIN�</option>
															<option value="15">FRANCO BURUND�S</option>
															<option value="16">D�LAR DE BERMUDA</option>
															<option value="17">D�LAR DE BRUN�I</option>
															<option value="18">BOLIVIANO</option>
															<option value="19">MVDOL BOLIVIANO (C�DIGO DE FONDOS)</option>
															<option value="20">REAL BRASILE�O</option>
															<option value="21">D�LAR BAHAME�O</option>
															<option value="22">NGULTRUM DE BUT�N</option>
															<option value="23">PULA DE BOTSUANA</option>
															<option value="24">RUBLO BIELORRUSO</option>
															<option value="25">D�LAR DE BELICE</option>
															<option value="26">D�LAR CANADIENSE</option>
															<option value="27">FRANCO CONGOLE�O, O CONGOL�S</option>
															<option value="28">FRANCO SUIZO</option>
															<option value="29">UNIDADES DE FOMENTO CHILENAS (C�DIGO DE FONDOS)</option>
															<option value="30">PESO CHILENO</option>
															<option value="31">YUAN CHINO</option>
															<option value="32">PESO COLOMBIANO</option>
															<option value="33">UNIDAD DE VALOR REAL COLOMBIANA (A�ADIDA AL COP)</option>
															<option value="34">COL�N COSTARRICENSE</option>
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
															<option value="46">BIRR ET�OPE</option>
															<option value="47">EURO</option>
															<option value="48">D�LAR FIYIANO</option>
															<option value="49">LIBRA MALVINENSE</option>
															<option value="50">LIBRA ESTERLINA</option>
															<option value="51">LARI GEORGIANO</option>
															<option value="52">CEDI GHAN�S</option>
															<option value="53">LIBRA DE GIBRALTAR</option>
															<option value="54">DALASI GAMBIANO</option>
															<option value="55">FRANCO GUINEANO</option>
															<option value="56">QUETZAL GUATEMALTECO</option>
															<option value="57">D�LAR GUYAN�S</option>
															<option value="58">D�LAR DE HONG KONG</option>
															<option value="59">LEMPIRA HONDURE�O</option>
															<option value="60">KUNA CROATA</option>
															<option value="61">GOURDE HAITIANO</option>
															<option value="62">FORINT H�NGARO</option>
															<option value="63">RUPIAH INDONESIA</option>
															<option value="64">NUEVO SH�QUEL ISRAEL�</option>
															<option value="65">RUPIA INDIA</option>
															<option value="66">DINAR IRAQU�</option>
															<option value="67">RIAL IRAN�</option>
															<option value="68">KR�NA ISLANDESA</option>
															<option value="69">D�LAR JAMAICANO</option>
															<option value="70">DINAR JORDANO</option>
															<option value="71">YEN JAPON�S</option>
															<option value="72">CHEL�N KENIATA</option>
															<option value="73">SOM KIRGU�S (DE KIRGUIST�N)</option>
															<option value="74">RIEL CAMBOYANO</option>
															<option value="75">FRANCO COMORIANO (DE COMORAS)</option>
															<option value="76">WON NORCOREANO</option>
															<option value="77">WON SURCOREANO</option>
															<option value="78">DINAR KUWAIT�</option>
															<option value="79">D�LAR CAIMANO (DE ISLAS CAIM�N)</option>
															<option value="80">TENGE KAZAJO</option>
															<option value="81">KIP LAO</option>
															<option value="82">LIBRA LIBANESA</option>
															<option value="83">RUPIA DE SRI LANKA</option>
															<option value="84">D�LAR LIBERIANO</option>
															<option value="85">LOTI LESOTENSE</option>
															<option value="86">LITAS LITUANO</option>
															<option value="87">LAT LET�N</option>
															<option value="88">DINAR LIBIO</option>
															<option value="89">DIRHAM MARROQU�</option>
															<option value="90">LEU MOLDAVO</option>
															<option value="91">ARIARY MALGACHE</option>
															<option value="92">DENAR MACEDONIO</option>
															<option value="93">KYAT BIRMANO</option>
															<option value="94">TUGHRIK MONGOL</option>
															<option value="95">PATACA DE MACAO</option>
															<option value="96">OUGUIYA MAURITANA</option>
															<option value="97">RUPIA MAURICIA</option>
															<option value="98">RUFIYAA MALDIVA C�DIGO MONEDA</option>
															<option value="99">KWACHA MALAU�</option>
															<option value="100" selected="selected">PESO MEXICANO</option>
															<option value="101">UNIDAD DE INVERSI�N (UDI) MEXICANA (C�DIGO DE FONDOS)</option>
															<option value="102">RINGGIT MALAYO</option>
															<option value="103">METICAL MOZAMBIQUE�O</option>
															<option value="104">D�LAR NAMIBIO</option>
															<option value="105">NAIRA NIGERIANA</option>
															<option value="106">C�RDOBA NICARAG�ENSE</option>
															<option value="107">CORONA NORUEGA</option>
															<option value="108">RUPIA NEPALESA</option>
															<option value="109">D�LAR NEOZELAND�S</option>
															<option value="110">RIAL OMAN�</option>
															<option value="111">BALBOA PANAME�A</option>
															<option value="112">NUEVO SOL PERUANO</option>
															<option value="113">KINA DE PAP�A NUEVA GUINEA</option>
															<option value="114">PESO FILIPINO</option>
															<option value="115">RUPIA PAKISTAN�</option>
															<option value="116">ZLOTY POLACO</option>
															<option value="117">GUARAN� PARAGUAYO</option>
															<option value="118">RIAL QATAR�</option>
															<option value="119">LEU RUMANO</option>
															<option value="120">RUBLO RUSO</option>
															<option value="121">FRANCO RUAND�S</option>
															<option value="122">RIYAL SAUD�</option>
															<option value="123">D�LAR DE LAS ISLAS SALOM�N</option>
															<option value="124">RUPIA DE SEYCHELLES</option>
															<option value="125">DINAR SUDAN�S</option>
															<option value="126">CORONA SUECA</option>
															<option value="127">D�LAR DE SINGAPUR</option>
															<option value="128">LIBRA DE SANTA HELENA</option>
															<option value="129">LEONE DE SIERRA LEONA</option>
															<option value="130">CHEL�N SOMAL�</option>
															<option value="131">D�LAR SURINAM�S</option>
															<option value="132">DOBRA DE SANTO TOM� Y PR�NCIPE</option>
															<option value="133">LIBRA SIRIA</option>
															<option value="134">LILANGENI SUAZI</option>
															<option value="135">BAHT TAILAND�S</option>
															<option value="136">SOMONI TAYIK (DE TAYIKIST�N)</option>
															<option value="137">MANAT TURCOMANO</option>
															<option value="138">DINAR TUNECINO</option>
															<option value="139">PA'ANGA TONGANO</option>
															<option value="140">LIRA TURCA</option>
															<option value="141">D�LAR DE TRINIDAD Y TOBAGO</option>
															<option value="142">D�LAR TAIWAN�S</option>
															<option value="143">CHEL�N TANZANO</option>
															<option value="144">GRIVNA UCRANIANA</option>
															<option value="145">CHEL�N UGAND�S</option>
															<option value="146">DOLAR AMERICANO</option>
															<option value="147">D�LAR ESTADOUNIDENSE (SIGUIENTE D�A) (C�DIGO DE FONDOS)</option>
															<option value="148">D�LAR ESTADOUNIDENSE (MISMO D�A) (C�DIGO DE FONDOS)</option>
															<option value="149">PESO URUGUAYO</option>
															<option value="150">CAPTACI�N �LTAS</option>
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
                                            <label>Descripci�n</label>
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