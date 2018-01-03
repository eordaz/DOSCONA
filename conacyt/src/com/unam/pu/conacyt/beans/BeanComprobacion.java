package com.unam.pu.conacyt.beans;

public class BeanComprobacion {
	
	private int id_comprobacion,
			id_proyecto,
			id_documento_proyecto,
			id_cheque,
			id_etapa_proyecto;
	
   private String concepto,
   				importe,
   				numero_total_documentos,
   				estatus,
   				fecha_registro,
   				fecha_actualizacion,
   				usuario_id;

public int getId_comprobacion() {
	return id_comprobacion;
}

public void setId_comprobacion(int id_comprobacion) {
	this.id_comprobacion = id_comprobacion;
}

public int getId_proyecto() {
	return id_proyecto;
}

public void setId_proyecto(int id_proyecto) {
	this.id_proyecto = id_proyecto;
}

public int getId_documento_proyecto() {
	return id_documento_proyecto;
}

public void setId_documento_proyecto(int id_documento_proyecto) {
	this.id_documento_proyecto = id_documento_proyecto;
}

public int getId_cheque() {
	return id_cheque;
}

public void setId_cheque(int id_cheque) {
	this.id_cheque = id_cheque;
}

public int getId_etapa_proyecto() {
	return id_etapa_proyecto;
}

public void setId_etapa_proyecto(int id_etapa_proyecto) {
	this.id_etapa_proyecto = id_etapa_proyecto;
}

public String getConcepto() {
	return concepto;
}

public void setConcepto(String concepto) {
	this.concepto = concepto;
}

public String getImporte() {
	return importe;
}

public void setImporte(String importe) {
	this.importe = importe;
}

public String getNumero_total_documentos() {
	return numero_total_documentos;
}

public void setNumero_total_documentos(String numero_total_documentos) {
	this.numero_total_documentos = numero_total_documentos;
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

public String getUsuario_id() {
	return usuario_id;
}

public void setUsuario_id(String usuario_id) {
	this.usuario_id = usuario_id;
}
   			



   			   
   
}