/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.db;

import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author eordazga
 */
public class RecordManager {
    private static final String className = "RecordManager";
    private static final Logger LOGGER = Logger.getLogger("RecordManager");
    private static final ResourceBundle db_cfg = ResourceBundle.getBundle("db_cfg");
    
    public RecordManager() {
        try {
            LOGGER.setLevel(Level.FINEST);
        } catch(Exception e){
             LOGGER.log(Level.SEVERE, className + "::> Error al crear el objeto.", e);
        }
    }
    
    
}
