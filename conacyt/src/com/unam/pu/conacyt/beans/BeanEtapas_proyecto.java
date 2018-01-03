package com.unam.pu.conacyt.beans;

public class BeanEtapas_proyecto {
	
	private int id_etapa_proyecto,
			id_recurso,
			id_cat_tipo_gasto,
			id_proyecto,
			id_ministracion,
			usuario_id;
	
   private String clave_etapa,
   				importe_asignado,
   				importe_autorizado,
   				importe_comprometido,
   				importe_ejercido,
   				fecha_registro,
   				fecha_actualizacion,
   				estatus;

public int getId_etapa_proyecto() {
	return id_etapa_proyecto;
}

public void setId_etapa_proyecto(int id_etapa_proyecto) {
	this.id_etapa_proyecto = id_etapa_proyecto;
}

public int getId_recurso() {
	return id_recurso;
}

public void setId_recurso(int id_recurso) {
	this.id_recurso = id_recurso;
}

public int getId_cat_tipo_gasto() {
	return id_cat_tipo_gasto;
}

public void setId_cat_tipo_gasto(int id_cat_tipo_gasto) {
	this.id_cat_tipo_gasto = id_cat_tipo_gasto;
}

public int getId_proyecto() {
	return id_proyecto;
}

public void setId_proyecto(int id_proyecto) {
	this.id_proyecto = id_proyecto;
}

public int getId_ministracion() {
	return id_ministracion;
}

public void setId_ministracion(int id_ministracion) {
	this.id_ministracion = id_ministracion;
}

public int getUsuario_id() {
	return usuario_id;
}

public void setUsuario_id(int usuario_id) {
	this.usuario_id = usuario_id;
}

public String getClave_etapa() {
	return clave_etapa;
}

public void setClave_etapa(String clave_etapa) {
	this.clave_etapa = clave_etapa;
}

public String getImporte_asignado() {
	return importe_asignado;
}

public void setImporte_asignado(String importe_asignado) {
	this.importe_asignado = importe_asignado;
}

public String getImporte_autorizado() {
	return importe_autorizado;
}

public void setImporte_autorizado(String importe_autorizado) {
	this.importe_autorizado = importe_autorizado;
}

public String getImporte_comprometido() {
	return importe_comprometido;
}

public void setImporte_comprometido(String importe_comprometido) {
	this.importe_comprometido = importe_comprometido;
}

public String getImporte_ejercido() {
	return importe_ejercido;
}

public void setImporte_ejercido(String importe_ejercido) {
	this.importe_ejercido = importe_ejercido;
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