<jsp:useBean id = "convenioBean" scope = "page"
   class = "com.unam.pu.conacyt.beans.BeanProyecto" />
<jsp:useBean id = "convenio" scope = "page"
   class = "com.unam.pu.conacyt.beans.BeanDatosProyecto" />

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Documento sin t&iacute;tulo</title>
</head>

<body>
<p>Esta es una p&aacute;gina JSP</p>
<p>&aacute; &eacute; </p>
<p>Esta es la insercion del registro</p>
<p>
<%

//BeanConvenio convenioBean = new BeanConvenio();
convenioBean.setId_fondo(2);
convenioBean.setId_moneda(1);
convenioBean.setClave_proyecto("7Proyecto");
convenioBean.setClave_recurso("1");
convenioBean.setNombre_proyecto("Prueba2");
convenioBean.setImporte(50000);
/*convenioBean.setfecha_inicio("getdate()");
convenioBean.setfecha_fin("getdate()");
convenioBean.setfecha_registro("getdate()");
convenioBean.setfecha_actualizacion("getdate()");*/
//convenioBean.setestatus("Activo");
convenioBean.setUsuario_id(1);

System.out.println("Hola Mundo");
int respuesta = convenio.registraContrato(convenioBean);

convenioBean= null;


%>
</p>
<p>&nbsp;  </p>
</body>
</html>
