/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 *
 * @author Edith Corina Ordaz Garnica <edith.ordaz@gmail.com>
 * @correo institucional: 
 * @correo personal: edith.ordaz@gmail.com
 */

package conacyt.beans;

import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import net.sf.json.JSONObject;

/**
 *
 * @author gigi
 */
@Stateless
public class ConacytRegistroBean implements ConacytRegistroBeanLocal {

    private static final String className = "ConacytRegistroBean";
    private static final Logger LOGGER = Logger.getLogger("ConacytRegistroBean");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");
    
    @Override
    public void setLoggerLevel(Level level) {
        LOGGER.setLevel(Level.FINEST);
    }

    /**
     * Constructor de la clase GenericExportCSV.
     */
    public ConacytRegistroBean() {
        try {
            LOGGER.setLevel(Level.FINEST);
                       
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
            if (method.equals("getCatFondos")) {
                result = getCatFondos(params);
            /**} else if (method.equals("getCatMonedas")) {
                result = getCatMonedas(params);
            } else if (method.equals("getCatDependencias")) {
                result = getCatDependencias(params);
            } else if (method.equals("getCatSubDependencias")) {
                result = getCatSubDependencias(params);*/
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: método desconocido.");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método: " + method, e);
        }
        return result;
    }

    private JSONObject getCatFondos(JSONObject params) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }    
}
