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
public class DocumentoProyectoEntidad implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
       
       private int id_documentos;
       private int  id_proyecto;
       private Date fecha_actualizacion;
       private String estatus;
       private int usuario_id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    
    public int getId_documentos() {
        return id_documentos;
    }

    public void setId_documentos(int id_documentos) {
        this.id_documentos = id_documentos;
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
        if (!(object instanceof DocumentoProyectoEntidad)) {
            return false;
        }
        DocumentoProyectoEntidad other = (DocumentoProyectoEntidad) object;
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
