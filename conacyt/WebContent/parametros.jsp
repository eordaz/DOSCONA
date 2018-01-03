<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<base href="<%=basePath%>">    
    <title>Calculador de intereses JSP</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

 
	<jsp:useBean id="parametros" class="com.unam.pu.conacyt.beans.BeanUsuarios" scope="request">
    	<jsp:setProperty name="usuarios" property="*"/>
    </jsp:useBean>
    <!--  Usuario: <jsp:getProperty name="parametros" property="usuario_id"/><br>
    Fecha:<jsp:getProperty name="parametros" property="fecha_registro" /><br>-->
    
        
    
    usuario: <%=usuarios.getusuario()%><br>  
	password: <%=usuarios.getpassword()%><br>  
    
    
</body>
<body>

</body>
</html>

