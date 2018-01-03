package com.unam.pu.conacyt.beans;

public class BeanCat_subdependencias {
	
	private int id_cat_subdependencia,
			id_cat_dependencia,
			usuario_id;
	
   private String clave_subdependecia,
   				nombre,
   				estatus,
   				fecha_registro,
   				fecha_actualizacion;

public int getId_cat_subdependencia() {
	return id_cat_subdependencia;
}

public void setId_cat_subdependencia(int id_cat_subdependencia) {
	this.id_cat_subdependencia = id_cat_subdependencia;
}

public int getId_cat_dependencia() {
	return id_cat_dependencia;
}

public void setId_cat_dependencia(int id_cat_dependencia) {
	this.id_cat_dependencia = id_cat_dependencia;
}

public int getUsuario_id() {
	return usuario_id;
}

public void setUsuario_id(int usuario_id) {
	this.usuario_id = usuario_id;
}

public String getClave_subdependecia() {
	return clave_subdependecia;
}

public void setClave_subdependecia(String clave_subdependecia) {
	this.clave_subdependecia = clave_subdependecia;
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