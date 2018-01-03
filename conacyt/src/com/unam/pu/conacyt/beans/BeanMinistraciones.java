package com.unam.pu.conacyt.beans;

public class BeanMinistraciones {
	
	private int id_ministracion,
			id_etapa_proyecto,
			id_cuenta_bancaria,
			id_cfdi;
	
   private String clave_ministracion,
   				importe_autorizado,
   				estatus,
   				fecha_registro,
   				fecha_actualizacion,
   				usuario_id;

public int getId_ministracion() {
	return id_ministracion;
}

public void setId_ministracion(int id_ministracion) {
	this.id_ministracion = id_ministracion;
}

public int getId_etapa_proyecto() {
	return id_etapa_proyecto;
}

public void setId_etapa_proyecto(int id_etapa_proyecto) {
	this.id_etapa_proyecto = id_etapa_proyecto;
}

public int getId_cuenta_bancaria() {
	return id_cuenta_bancaria;
}

public void setId_cuenta_bancaria(int id_cuenta_bancaria) {
	this.id_cuenta_bancaria = id_cuenta_bancaria;
}

public int getId_cfdi() {
	return id_cfdi;
}

public void setId_cfdi(int id_cfdi) {
	this.id_cfdi = id_cfdi;
}

public String getClave_ministracion() {
	return clave_ministracion;
}

public void setClave_ministracion(String clave_ministracion) {
	this.clave_ministracion = clave_ministracion;
}

public String getImporte_autorizado() {
	return importe_autorizado;
}

public void setImporte_autorizado(String importe_autorizado) {
	this.importe_autorizado = importe_autorizado;
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