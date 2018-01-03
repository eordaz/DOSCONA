package com.unam.pu.conacyt.beans;

public class BeanProyecto {
	
	private int id_proyecto,
			id_fondo,
			id_moneda,
			usuario_id;
	
   private String clave_proyecto,
   				clave_recurso,
   				nombre_proyecto,
   				fondo,
   				fecha_inicio,
   				fecha_fin,
   				fecha_registro,
   				fecha_actualizacion,
   				estatus;
   			
   private double importe;

public int getId_proyecto() {
	return id_proyecto;
}

public void setId_proyecto(int id_proyecto) {
	this.id_proyecto = id_proyecto;
}

public int getId_fondo() {
	return id_fondo;
}

public void setId_fondo(int id_fondo) {
	this.id_fondo = id_fondo;
}

public int getId_moneda() {
	return id_moneda;
}

public void setId_moneda(int id_moneda) {
	this.id_moneda = id_moneda;
}

public int getUsuario_id() {
	return usuario_id;
}

public void setUsuario_id(int usuario_id) {
	this.usuario_id = usuario_id;
}

public String getClave_proyecto() {
	return clave_proyecto;
}

public void setClave_proyecto(String clave_proyecto) {
	this.clave_proyecto = clave_proyecto;
}

public String getClave_recurso() {
	return clave_recurso;
}

public void setClave_recurso(String clave_recurso) {
	this.clave_recurso = clave_recurso;
}

public String getNombre_proyecto() {
	return nombre_proyecto;
}

public void setNombre_proyecto(String nombre_proyecto) {
	this.nombre_proyecto = nombre_proyecto;
}

public String getFondo() {
	return fondo;
}

public void setFondo(String fondo) {
	this.fondo = fondo;
}

public String getFecha_inicio() {
	return fecha_inicio;
}

public void setFecha_inicio(String fecha_inicio) {
	this.fecha_inicio = fecha_inicio;
}

public String getFecha_fin() {
	return fecha_fin;
}

public void setFecha_fin(String fecha_fin) {
	this.fecha_fin = fecha_fin;
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

public double getImporte() {
	return importe;
}

public void setImporte(double importe) {
	this.importe = importe;
}






   			   
   
}