package com.unam.pu.conacyt.beans;

public class BeanDependencias_proyectos {
	private int id_dependencia_proyecto,
				id_proyecto,
				id_cat_subdependencia,
				usuario_id;
	
	private String estatus,
					fecha_registro,
					fecha_actualizacion;

	public int getId_dependencia_proyecto() {
		return id_dependencia_proyecto;
	}

	public void setId_dependencia_proyecto(int id_dependencia_proyecto) {
		this.id_dependencia_proyecto = id_dependencia_proyecto;
	}

	public int getId_proyecto() {
		return id_proyecto;
	}

	public void setId_proyecto(int id_proyecto) {
		this.id_proyecto = id_proyecto;
	}

	public int getId_cat_subdependencia() {
		return id_cat_subdependencia;
	}

	public void setId_cat_subdependencia(int id_cat_subdependencia) {
		this.id_cat_subdependencia = id_cat_subdependencia;
	}

	public int getUsuario_id() {
		return usuario_id;
	}

	public void setUsuario_id(int usuario_id) {
		this.usuario_id = usuario_id;
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
