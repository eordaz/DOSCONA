package com.unam.pu.conacyt.beans;

public class BeanResponsable_proyecto {
	
	private int id_responsable_proyecto,
			id_proyecto,
			id_responsable,
			usuario_id;
	
   private String fecha_registro,
   				fecha_actualizacion,
   				estatus;

public int getId_responsable_proyecto() {
	return id_responsable_proyecto;
}

public void setId_responsable_proyecto(int id_responsable_proyecto) {
	this.id_responsable_proyecto = id_responsable_proyecto;
}

public int getId_proyecto() {
	return id_proyecto;
}

public void setId_proyecto(int id_proyecto) {
	this.id_proyecto = id_proyecto;
}

public int getId_responsable() {
	return id_responsable;
}

public void setId_responsable(int id_responsable) {
	this.id_responsable = id_responsable;
}

public int getUsuario_id() {
	return usuario_id;
}

public void setUsuario_id(int usuario_id) {
	this.usuario_id = usuario_id;
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