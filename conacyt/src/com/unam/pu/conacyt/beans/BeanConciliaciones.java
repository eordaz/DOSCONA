package com.unam.pu.conacyt.beans;

public class BeanConciliaciones {
	
	private int id_conciliacion;
	
   private String importe_banco,
   				fecha_banco,
   				fecha_registro;

public int getId_conciliacion() {
	return id_conciliacion;
}

public void setId_conciliacion(int id_conciliacion) {
	this.id_conciliacion = id_conciliacion;
}

public String getImporte_banco() {
	return importe_banco;
}

public void setImporte_banco(String importe_banco) {
	this.importe_banco = importe_banco;
}

public String getFecha_banco() {
	return fecha_banco;
}

public void setFecha_banco(String fecha_banco) {
	this.fecha_banco = fecha_banco;
}

public String getFecha_registro() {
	return fecha_registro;
}

public void setFecha_registro(String fecha_registro) {
	this.fecha_registro = fecha_registro;
}
   			



   			   
   
}