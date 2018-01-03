package com.unam.pu.conacyt.beans;

public class BeanMovimientos_institucional {
	
	private int id_movimiento_institucional,
			id_poliza;
	
   private String fecha_registro,
   				fecha_actualizacion,
   				usuario_id,
   				estatus;

public int getId_movimiento_institucional() {
	return id_movimiento_institucional;
}

public void setId_movimiento_institucional(int id_movimiento_institucional) {
	this.id_movimiento_institucional = id_movimiento_institucional;
}

public int getId_poliza() {
	return id_poliza;
}

public void setId_poliza(int id_poliza) {
	this.id_poliza = id_poliza;
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

public String getEstatus() {
	return estatus;
}

public void setEstatus(String estatus) {
	this.estatus = estatus;
}
   			


   			   
   
}