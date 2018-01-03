package com.unam.pu.conacyt.beans;

public class BeanCheques {
	
	private int id_cheque,
			id_remesas;
	
   private String importe,
   				fecha_emision,
   				apellido_paterno,
   				apellido_materno,
   				estatus,
   				fecha_entrega,
   				fecha_registro;

public int getId_cheque() {
	return id_cheque;
}

public void setId_cheque(int id_cheque) {
	this.id_cheque = id_cheque;
}

public int getId_remesas() {
	return id_remesas;
}

public void setId_remesas(int id_remesas) {
	this.id_remesas = id_remesas;
}

public String getImporte() {
	return importe;
}

public void setImporte(String importe) {
	this.importe = importe;
}

public String getFecha_emision() {
	return fecha_emision;
}

public void setFecha_emision(String fecha_emision) {
	this.fecha_emision = fecha_emision;
}

public String getApellido_paterno() {
	return apellido_paterno;
}

public void setApellido_paterno(String apellido_paterno) {
	this.apellido_paterno = apellido_paterno;
}

public String getApellido_materno() {
	return apellido_materno;
}

public void setApellido_materno(String apellido_materno) {
	this.apellido_materno = apellido_materno;
}

public String getEstatus() {
	return estatus;
}

public void setEstatus(String estatus) {
	this.estatus = estatus;
}

public String getFecha_entrega() {
	return fecha_entrega;
}

public void setFecha_entrega(String fecha_entrega) {
	this.fecha_entrega = fecha_entrega;
}

public String getFecha_registro() {
	return fecha_registro;
}

public void setFecha_registro(String fecha_registro) {
	this.fecha_registro = fecha_registro;
}
   			



   			   
   
}