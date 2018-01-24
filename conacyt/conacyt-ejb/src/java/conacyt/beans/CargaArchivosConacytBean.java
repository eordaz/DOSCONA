/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 13 de Enero del 2018   
 */
package conacyt.beans;

import conacyt.db.RecordManager;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONObject;

/**
 *
 * @author vsanchez
 */
@Stateless
public class CargaArchivosConacytBean implements CargaArchivosConacytBeanLocal {
    private static final String className = "CargaArchivosConacytBean";
    private static final Logger LOGGER = Logger.getLogger("CargaArchivosConacytBean");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");
    RecordManager recordManager = null;
    
    @Override
    public JSONObject processMethod(String method, HttpServletRequest file) {
       String methodStr = className + "::processMethod";
       JSONObject result = null;
       try {
           if (method.equals("getArchivo")) {
                result = getCargaArchivo(file);
            } else if (method.equals("insertOrUpdateArchivo")) {
                result = insertOrUpdateArchivo(file);
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: método desconocido.");
            }
       } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + ">:: Problema en la identificación de Caso", e);
        }
       return result;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    private JSONObject getCargaArchivo(HttpServletRequest params) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private JSONObject insertOrUpdateArchivo(HttpServletRequest params) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
