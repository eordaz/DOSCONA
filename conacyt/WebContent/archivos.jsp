<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.unam.pu.conacyt.beans.*" %>
<%@page language="java" import="javazoom.upload.*" %>
<%@page language="java" import="java.util.*" %>
<%@page errorPage="error.jsp" %>    

<%
    //String direccion = request.getSession().getServletContext().getRealPath("WEB-INF/img/Upload/");

	ServletContext servletContext = request.getSession().getServletContext();
	String relativeWebPath = "img/";
	//String relativeWebPath = "WEB-INF/img/";
	String absoluteDiskPath = servletContext.getRealPath(relativeWebPath);
	
	System.out.println(absoluteDiskPath);
	
	
	
	

%>
<jsp:useBean id = "ArchivoBean" scope = "page"
   class = "com.unam.pu.conacyt.beans.BeanArchivo" />
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
    <jsp:setProperty name="upBean" property="folderstore" value="<%= absoluteDiskPath%>" />
    <jsp:setProperty name="upBean" property="whitelist" value="*.jpg,*.gif" />
    <jsp:setProperty name="upBean" property="overwritepolicy" value="nametimestamp"/>
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Abrir  archivos</title>
</head>
<body>


<%
//BeanConvenio convenioBean = new BeanConvenio();
 
 

//ArchivoBean.cargarArchivo("abrir");

//ArchivoBean= null;

System.out.println("Hola Mundo");

%>



<body>
<h1>Abrir archivo</h1>


<form  method="post" action="archivos.jsp" name="upform"  enctype="multipart/form-data">
<%
if (MultipartFormDataRequest.isMultipartFormData(request)) {
 MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
 String todo = null;
 if (mrequest != null) {
  todo = mrequest.getParameter("todo");
 }
 if ((todo != null) && (todo.equalsIgnoreCase("upload"))) {
  Hashtable files = mrequest.getFiles();
  if ((files != null) && (!files.isEmpty())) {
   java.text.SimpleDateFormat formato = new java.text.SimpleDateFormat("yyMMddHHmmss");
   String archivo = ((UploadFile) mrequest.getFiles().get("uploadfile")).getFileName();
   int posicionPunto = archivo.indexOf(".");
   String nombreImagen = archivo.substring(0, posicionPunto);
   String extension = archivo.substring(posicionPunto);
   nombreImagen = nombreImagen + formato.format(new java.util.Date());
   nombreImagen = nombreImagen + extension;
   ((UploadFile) mrequest.getFiles().get("uploadfile")).setFileName(nombreImagen);
   UploadFile file = (UploadFile) files.get("uploadfile");
   if (file != null) {
    out.println("El archivo: " + file.getFileName() + " se subio correctamente");
   }
   upBean.store(mrequest, "uploadfile");
  } else {
    out.println("Archivos no subidos");
  }
 } else {
   out.println("<BR> todo=" + todo);
 }
}
%>
	<table border="0" cellpadding="2" cellspacing="2" >
		<tbody>
		<tr>
			<td>Archivo:</td>
			<td><input type="file" name="uploadfile" style="width:300px"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="hidden" name="todo" value="upload"/></td>
			<td><input type="submit"  value="Agregar"/></td>
		</tr>
		</tbody>	
	</table>
	
	
	
	
	
</form>



</body>
</html>


