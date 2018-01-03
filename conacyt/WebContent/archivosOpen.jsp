<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.unam.pu.conacyt.beans.*" %>
<%@page language="java" import="java.util.*" %>
<%@page errorPage="error.jsp" %>    

<jsp:useBean id = "ArchivoBean" scope = "page"
   class = "com.unam.pu.conacyt.beans.BeanArchivo" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Abrir  archivos</title>
</head>
<body>

<script>

function  muestraMensaje(){
<%
//BeanConvenio convenioBean = new BeanConvenio();

ArchivoBean.cargarArchivo("abrir","c:\\prueba.pdf");

ArchivoBean= null;

System.out.println("Abrir archivo");

%>
}
</script>

<body>
<h1>Abrir archivo</h1>

<input id="btn1" type="button" value="Ver" onclick="muestraMensaje();">


</body>
</html>


