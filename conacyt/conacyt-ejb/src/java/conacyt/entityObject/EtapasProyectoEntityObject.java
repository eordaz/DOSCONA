/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.entityObject;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Entidad para la tabla Proyecto.
 * @date 19/01/2018
 * @author vsanchez
 */
@Entity
public class EtapasProyectoEntityObject implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private int id_fondo;
    private int id_moneda;
    private int id_recurso;
    private int clave_proyecto;
    private String nombre_proyecto;
    private int id_cat_dependencia;

    
    private Date fecha_actualizacion;
    private float importe;
    private String estatus;
    private int usuario_id;
 
        
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public int getId_recurso() {
        return id_recurso;
    }

    public void setId_recurso(int id_recurso) {
        this.id_recurso = id_recurso;
    }

    public int getClave_proyecto() {
        return clave_proyecto;
    }

    public void setClave_proyecto(int clave_proyecto) {
        this.clave_proyecto = clave_proyecto;
    }

    public String getNombre_proyecto() {
        return nombre_proyecto;
    }

    public void setNombre_proyecto(String nombre_proyecto) {
        this.nombre_proyecto = nombre_proyecto;
    }

    public int getId_cat_dependencia() {
        return id_cat_dependencia;
    }

    public void setId_cat_dependencia(int id_cat_dependencia) {
        this.id_cat_dependencia = id_cat_dependencia;
    }

    public float getImporte() {
        return importe;
    }

    public void setImporte(float importe) {
        this.importe = importe;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }
            
   public Date getFecha_actualizacion() {
        return fecha_actualizacion;
    }

    public void setFecha_actualizacion(Date fecha_actualizacion) {
        this.fecha_actualizacion = fecha_actualizacion;
    }

  
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EtapasProyectoEntityObject)) {
            return false;
        }
        EtapasProyectoEntityObject other = (EtapasProyectoEntityObject) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "conacyt.beansObject.proyecto[ id=" + id + " ]";
    }
    
}
