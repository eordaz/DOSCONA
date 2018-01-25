/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.beans;

import conacyt.db.RecordManager;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import net.sf.json.JSONObject;

/**
 *
 * @author vsanchez Edithiña
 */
@Stateless
public class ProyectosConacytBean implements ProyectosConacytBeanLocal {

    private static final String className = "ProyectosConacytBean";
    private static final Logger LOGGER = Logger.getLogger("ProyectosConacytBean");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");
    RecordManager recordManager = null;

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
     public ProyectosConacytBean() {
        try {
            LOGGER.setLevel(Level.FINEST);
            recordManager = new RecordManager(conacyt_cfg.getString("datasource"));
//            LOGGER.setLevel(Level.WARNING);
//            LOGGER.setLevel(Level.INFO);
//            LOGGER.setLevel(Level.FINER);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + "::> Error al crear el objeto.", e);
}
    }

    @Override
    public JSONObject processMethod(String method, JSONObject params) {
        String methodStr = className + "::processMethod";
        JSONObject result = null;

        try {
            if (method.equals("getProyectosID")) {
                result = getProyectosID(params);
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: método desconocido.");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método: " + method, e);
        }
        return result;
    }

    /**
     *
     * @param params // Parámetros de ebtrada p.ej.
     * {"user":"eordaz","pass":"123456asdf"}
     * @return JSON de salida //{"login_result":true}
     */
    
    private JSONObject getProyectosID(JSONObject params) {
        String methodStr = className + "::getProyectosID";
        JSONObject result = null;
        
        String query = null;
        String sql = null;
        Integer id_proyecto = null;
     

        try {
            if (params != null && !params.isEmpty() && !params.isNullObject() &&  !params.getString("clave_dependencia").isEmpty() && !params.getString("clave_subdependencia").isEmpty()) {
                
                /*Verifica que exista el recurso en la tabla */
                query ="select clave_proyecto, clave_recurso, estatus  from " + conacyt_cfg.getString("v_proyectos")+ " where " +  conacyt_cfg.getString("column_clave_dependencia")+ "=\'" + params.getString("clave_dependencia")+
                        "\' and  " +  conacyt_cfg.getString("column_clave_subdependencia")+ "=\'"+ params.getString("clave_subdependencia") +"\'";
                LOGGER.log(Level.WARNING, methodStr + ">query: > "+ query);
                result = recordManager.queryGetLogin(query);                       
                
               //result = new JSONObject().accumulate("getProyectos", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
            } else {
                result = new JSONObject().accumulate("getProyectos", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }
        } catch (Exception ex) {
            result = new JSONObject().accumulate("getProceso", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        return result;
    }
    
    
}
