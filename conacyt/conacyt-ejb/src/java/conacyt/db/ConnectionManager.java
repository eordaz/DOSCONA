/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 12 de Enero del 2018   
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
 * @author Edith Corina Ordaz Garnica <edith.ordaz@patronato.unam.mx> <edith.ordaz@gmail.com>
 */
final class ConnectionManager {

    private static final String className = "ConnectionManager";
    private static final Logger LOGGER = Logger.getLogger("ConnectionManager");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");
    Context initialContext = null;
    DataSource datasource = null;
    Connection conn = null;
    public String datasourceStr = null;

    public ConnectionManager(String dataSource) {
        try {
            LOGGER.setLevel(Level.FINEST);
            datasourceStr = dataSource;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + "::> Error al crear el objeto.", e);
        }
    }

    /**
     * Uses JNDI and Datasource (preferred style).
     * @return Connection
     */
    public Connection getJNDIConnection() {
        String methodStr = className + "::getJNDIConnection";

        String DATASOURCE_CONTEXT = !(datasourceStr.isEmpty()) ? datasourceStr : conacyt_cfg.getString("datasource");
        LOGGER.log(Level.INFO, methodStr + "::> DATASOURCE_CONTEXT: "+ DATASOURCE_CONTEXT);
        try {
            initialContext = new InitialContext();
            if (initialContext == null) {
                LOGGER.log(Level.WARNING, methodStr + "::> JNDI problem. Cannot get InitialContext.");
            }
            datasource = (DataSource) initialContext.lookup(DATASOURCE_CONTEXT);
            if (datasource != null) {
                conn = datasource.getConnection();
            } else {
                LOGGER.log(Level.WARNING, methodStr + "::> Failed to lookup datasource.");
            }
        } catch (NamingException ex) {
            LOGGER.log(Level.SEVERE, methodStr + "::> Cannot get connection." + ex);
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, methodStr + "::> Cannot get connection." + ex);
        }
        return conn;
    }

    public void closeConnection() {
        String methodStr = className + "::closeConnection";
        try {
            conn.close();
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, methodStr + "::> Cannot close connection." + ex);
        }
    }
}
