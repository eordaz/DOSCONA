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
public class ResponsableProyectoEntidad implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
   
    private int id_responsable_proyecto;
    private int id_proyecto;
    private int	id_responsable;
    private Date fecha_actualizacion;
    private String estatus;
    private int usuario_id; 

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getId_responsable_proyecto() {
        return id_responsable_proyecto;
    }

    public void setId_responsable_proyecto(int id_responsable_proyecto) {
        this.id_responsable_proyecto = id_responsable_proyecto;
    }

    public int getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(int id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

    public int getId_responsable() {
        return id_responsable;
    }

    public void setId_responsable(int id_responsable) {
        this.id_responsable = id_responsable;
    }

    public Date getFecha_actualizacion() {
        return fecha_actualizacion;
    }

    public void setFecha_actualizacion(Date fecha_actualizacion) {
        this.fecha_actualizacion = fecha_actualizacion;
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
    
      
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ResponsableProyectoEntidad)) {
            return false;
        }
        ResponsableProyectoEntidad other = (ResponsableProyectoEntidad) object;
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
