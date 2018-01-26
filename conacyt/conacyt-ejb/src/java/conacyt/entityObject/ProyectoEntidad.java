/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.entityObject;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author eordazga
 */
@Entity
public class ProyectoEntidad implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int id_fondo;
    private int id_moneda;
    private int id_recurso;
    private String clave_proyecto;
    private String nombre_proyecto;
    private int id_cat_dependencia;
    private double importe;
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

    public String getClave_proyecto() {
        return clave_proyecto;
    }

    public void setClave_proyecto(String clave_proyecto) {
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

    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
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
    
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProyectoEntidad)) {
            return false;
        }
        ProyectoEntidad other = (ProyectoEntidad) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "conacyt.entityObject.ProyectosEntityObject[ id=" + this.id_fondo + " ]";
    }
    
    public static void main(String[] args) {
            //h2 native query to show tables and columns
             String  json= "{'id_fondo':'1','id_moneda':'1','id_recurso': 2,'clave_proyecto':'123456','nombre_proyecto':'prueba','id_cat_dependencia': 1,'importe': 12.2,'estatus':'Activo','usuario_id':2}"; 
           
           
            
            JSONArray array = new JSONArray();
            array.add(json);
            //Recorremos el Array
            ProyectoEntidad p = new ProyectoEntidad();
            for (int i = 0; i < array.size(); i++)
            {
                //Obtenermos los objetos de la posición i
                JSONObject object = (JSONObject)array.get(i);
          // System.out.println("Objeto  de Proyecto Entitty" + object.getInt("id_fondo"));
                
                p.setId_fondo(object.getInt("id_fondo"));
                p.setId_moneda(object.getInt("id_moneda"));
                p.setId_recurso(object.getInt("id_moneda"));
                p.setClave_proyecto(object.getString("clave_proyecto"));
                p.setNombre_proyecto(object.getString("nombre_proyecto"));
                p.setId_cat_dependencia(object.getInt("id_cat_dependencia"));
                p.setImporte(object.getDouble("importe"));
                p.setEstatus(object.getString("estatus"));
                p.setUsuario_id(object.getInt("usuario_id"));
           
            }

           System.out.println("Objeto  de Proyecto Entitty" + p.toString());
           
           
         
            
    } 
}
