/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 12 de Enero del 2018
 * @DateModified    
 * @author Edith Corina Ordaz Garnica <edith.ordaz@patronato.unam.mx> <edith.ordaz@gmail.com> 
 */
package conacyt.beans;

import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import net.sf.json.JSONObject;

/**
 * Clase de tipo Session Bean que contiene la logica de los servicios que se requieren
 * para las operaciones del Login.
 * 
 * @author Edith Corina Ordaz Garnica <edith.ordaz@patronato.unam.mx> <edith.ordaz@gmail.com> 
 */
@Stateless
public class LoginConacytBean implements LoginConacytBeanLocal {

    private static final String className = "LoginConacytBean";
    private static final Logger LOGGER = Logger.getLogger("LoginConacytBean");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");
    
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
 * @param params // Parámetros de ebtrada p.ej. {"user":"eordaz","pass":"123456asdf"}
 * @return JSON de salida //{"login_result":true} 
 */
    private JSONObject getLogin(JSONObject params) { 
        String methodStr = className + "::getLogin";
        JSONObject result = null;
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject() && !params.getString("usuario").isEmpty() && !params.getString("pass").isEmpty()) {
                
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método. ", ex);
        }
        return result;
    }
}
