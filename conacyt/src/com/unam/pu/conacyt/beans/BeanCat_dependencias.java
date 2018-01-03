package com.unam.pu.conacyt.beans;

public class BeanCat_dependencias {
	
	private int id_cat_dependencia,
			id_coordinacion,
			usuario_id;
	
   private String clave_dependencia,
   				nombre,
   				estatus,
   				fecha_registro,
   				fecha_actualizacion;

public int getId_cat_dependencia() {
	return id_cat_dependencia;
}

public void setId_cat_dependencia(int id_cat_dependencia) {
	this.id_cat_dependencia = id_cat_dependencia;
}

public int getId_coordinacion() {
	return id_coordinacion;
}

public void setId_coordinacion(int id_coordinacion) {
	this.id_coordinacion = id_coordinacion;
}

public int getUsuario_id() {
	return usuario_id;
}

public void setUsuario_id(int usuario_id) {
	this.usuario_id = usuario_id;
}

public String getClave_dependencia() {
	return clave_dependencia;
}

public void setClave_dependencia(String clave_dependencia) {
	this.clave_dependencia = clave_dependencia;
}

public String getNombre() {
	return nombre;
}

public void setNombre(String nombre) {
	this.nombre = nombre;
}

public String getEstatus() {
	return estatus;
}

public void setEstatus(String estatus) {
	this.estatus = estatus;
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
   			




   			   
   
}