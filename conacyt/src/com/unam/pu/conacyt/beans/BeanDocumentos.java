package com.unam.pu.conacyt.beans;

public class BeanDocumentos {
	
	private int id_documentos,
			id_cat_documentos,
			usuario_id;
				
   private String nombre,
   				pdf,   				
   				folio_sicop,
   				folio_boveda,
   				fecha_registro,
   				fecha_actualizacion,
   				estatus;

public int getId_documentos() {
	return id_documentos;
}

public void setId_documentos(int id_documentos) {
	this.id_documentos = id_documentos;
}

public int getId_cat_documentos() {
	return id_cat_documentos;
}

public void setId_cat_documentos(int id_cat_documentos) {
	this.id_cat_documentos = id_cat_documentos;
}

public int getUsuario_id() {
	return usuario_id;
}

public void setUsuario_id(int usuario_id) {
	this.usuario_id = usuario_id;
}

public String getNombre() {
	return nombre;
}

public void setNombre(String nombre) {
	this.nombre = nombre;
}

public String getPdf() {
	return pdf;
}

public void setPdf(String pdf) {
	this.pdf = pdf;
}

public String getFolio_sicop() {
	return folio_sicop;
}

public void setFolio_sicop(String folio_sicop) {
	this.folio_sicop = folio_sicop;
}

public String getFolio_boveda() {
	return folio_boveda;
}

public void setFolio_boveda(String folio_boveda) {
	this.folio_boveda = folio_boveda;
}

public String getFecha_registro() {
	return fecha_registro;
}

public void setFecha_registro(String fecha_registro) {
	this.fecha_registro = fecha_registro;
}

public String getFecha_actualizacion() {
	return fecha_actualizacion;
}

public void setFecha_actualizacion(String fecha_actualizacion) {
	this.fecha_actualizacion = fecha_actualizacion;
}

public String getEstatus() {
	return estatus;
}

public void setEstatus(String estatus) {
	this.estatus = estatus;
}





   			   
   
}