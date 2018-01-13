/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author eordazga
 */
 final class ConnectionManager {
    private static final String className = "ConnectionManager";
    private static final Logger LOGGER = Logger.getLogger("ConnectionManager");
    private static final ResourceBundle db_cfg = ResourceBundle.getBundle("db_cfg");
    
    public ConnectionManager() {
        try {
            LOGGER.setLevel(Level.FINEST);
        } catch(Exception e){
             LOGGER.log(Level.SEVERE, className + "::> Error al crear el objeto.", e);
        }
    }
            
    /** Uses JNDI and Datasource (preferred style).   */
  static final Connection getJNDIConnection(String dataSourceParam){
  
   String DATASOURCE_CONTEXT = !(dataSourceParam.isEmpty()) ? dataSourceParam : db_cfg.getString("datasource");
    
    Connection result = null;
    try {
        Context initialContext = new InitialContext();
      if ( initialContext == null){
           LOGGER.log(Level.WARNING, className + "::> JNDI problem. Cannot get InitialContext.");       
      }
        DataSource datasource = (DataSource)initialContext.lookup(DATASOURCE_CONTEXT);
      if (datasource != null) {
        result = datasource.getConnection();
      }
      else {
          LOGGER.log(Level.WARNING, className + "::> Failed to lookup datasource.");
      }
    }
    catch ( NamingException ex ) {
        LOGGER.log(Level.WARNING, className + "::> Cannot get connection." + ex);
    }
    catch(SQLException ex){
      LOGGER.log(Level.WARNING, className + "::> Cannot get connection." + ex);
    }         
  return result;
  }
}
