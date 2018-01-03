package com.unam.pu.conacyt.beans;

public class BeanComprobacion_rechazo {
	
	private int id_comprobacion_rechazo,
			id_comprobacion,
			id_cat_rechazo;
	
   private String estatus,
   				fecha_rechazo,
   				fecha_registro,
   				usuario_id;

public int getId_comprobacion_rechazo() {
	return id_comprobacion_rechazo;
}

public void setId_comprobacion_rechazo(int id_comprobacion_rechazo) {
	this.id_comprobacion_rechazo = id_comprobacion_rechazo;
}

public int getId_comprobacion() {
	return id_comprobacion;
}

public void setId_comprobacion(int id_comprobacion) {
	this.id_comprobacion = id_comprobacion;
}

public int getId_cat_rechazo() {
	return id_cat_rechazo;
}

public void setId_cat_rechazo(int id_cat_rechazo) {
	this.id_cat_rechazo = id_cat_rechazo;
}

public String getEstatus() {
	return estatus;
}

public void setEstatus(String estatus) {
	this.estatus = estatus;
}

public String getFecha_rechazo() {
	return fecha_rechazo;
}

public void setFecha_rechazo(String fecha_rechazo) {
	this.fecha_rechazo = fecha_rechazo;
}

public String getFecha_registro() {
	return fecha_registro;
}

public void setFecha_registro(String fecha_registro) {
	this.fecha_registro = fecha_registro;
}

public String getUsuario_id() {
	return usuario_id;
}

public void setUsuario_id(String usuario_id) {
	this.usuario_id = usuario_id;
}
   			



   			   
   
}