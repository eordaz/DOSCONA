/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 12 de Enero del 2018   
 */
package conacyt.beans;

import conacyt.db.RecordManager;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import net.sf.json.JSONObject;

/**
 * Clase de tipo Session Bean que contiene la logica de los servicios que se
 * requieren para las operaciones del Login.
 *
 * @author Edith Corina Ordaz Garnica <edith.ordaz@patronato.unam.mx>
 * <edith.ordaz@gmail.com>
 */
@Stateless
public class LoginConacytBean implements LoginConacytBeanLocal {

    private static final String className = "LoginConacytBean";
    private static final Logger LOGGER = Logger.getLogger("LoginConacytBean");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");
    RecordManager recordManager = null;

    public LoginConacytBean() {
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
            if (method.equals("getLogin")) {
                result = getLogin(params);
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
    private JSONObject getLogin(JSONObject params) {
        String methodStr = className + "::getLogin";
        JSONObject result = null;
        String query_usuario = null, query_usuario_rol = null;
        Integer id_usuario = null;

        try {
            if (params != null) {
                query_usuario = "SELECT " + conacyt_cfg.getString("column_id_usuario")
                        + " FROM " + conacyt_cfg.getString("usuario")
                        + " WHERE usuario = \'" + params.getString("usuario") + "\' AND password = \'" + params.getString("pass") + "\'";
                //LOGGER.log(Level.FINEST, methodStr + ">Error: > El query_usuario.> " + query_usuario);

                id_usuario = recordManager.executeQueryToID(query_usuario, conacyt_cfg.getString("column_id_usuario"));
                //LOGGER.log(Level.FINEST, methodStr + ">Error: > El id_usuario.> " + id_usuario);
                if (id_usuario != null && id_usuario > 0) {
                    query_usuario_rol = "SELECT * FROM " + conacyt_cfg.getString("v_usuario_rol")
                            + " WHERE id_usuario = " + id_usuario + " AND estatus=\'Activo\'";
                    //LOGGER.log(Level.FINEST, methodStr + ">Error: > El query_usuario_rol.> " + query_usuario_rol);
                    result = recordManager.queryGetLogin(query_usuario_rol);
                    //LOGGER.log(Level.FINEST, methodStr + ">Error: > El result.> " + result);
                } else {
                    result = new JSONObject().accumulate("getLogin", "-1").accumulate("mensaje", "El usuario que esta solicitando no es válido.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > El usuario que esta solicitando no es válido.");
                }
            } else {
                result = new JSONObject().accumulate("getLogin", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }
        } catch (Exception ex) {
            result = new JSONObject().accumulate("getLogin", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        return result;
    }
}
