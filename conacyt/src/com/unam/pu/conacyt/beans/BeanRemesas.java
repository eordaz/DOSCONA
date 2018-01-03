package com.unam.pu.conacyt.beans;

public class BeanRemesas {
	
	private int id_remesas,
			id_cuenta_bancaria,
			id_cheque_inicial,
			id_cheque_fin;
	
   private String estatus,
   				fecha_registro;

public int getId_remesas() {
	return id_remesas;
}

public void setId_remesas(int id_remesas) {
	this.id_remesas = id_remesas;
}

public int getId_cuenta_bancaria() {
	return id_cuenta_bancaria;
}

public void setId_cuenta_bancaria(int id_cuenta_bancaria) {
	this.id_cuenta_bancaria = id_cuenta_bancaria;
}

public int getId_cheque_inicial() {
	return id_cheque_inicial;
}

public void setId_cheque_inicial(int id_cheque_inicial) {
	this.id_cheque_inicial = id_cheque_inicial;
}

public int getId_cheque_fin() {
	return id_cheque_fin;
}

public void setId_cheque_fin(int id_cheque_fin) {
	this.id_cheque_fin = id_cheque_fin;
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
   			


   			   
   
}