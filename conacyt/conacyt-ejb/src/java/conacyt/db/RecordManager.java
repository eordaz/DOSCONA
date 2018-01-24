/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 14 de Enero del 2018   
 */
package conacyt.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author eordazga
 */
public class RecordManager {

    private static final String className = "RecordManager";
    private static final Logger LOGGER = Logger.getLogger("RecordManager");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");
    ConnectionManager cm = null;
    Connection conn = null;

    public RecordManager(String dataSource) {
        String methodStr = className + "::RecordManager";
        try {
            LOGGER.setLevel(Level.FINEST);
            cm = new ConnectionManager(dataSource);
            LOGGER.log(Level.FINEST, methodStr + ">Se inicializó la conexión con éxito." + cm);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + "::> Error al crear el objeto.", e);
        }
    }

    public Connection getConnection() {
        String methodStr = className + "::getConnection";
        try {

            conn = cm.getJNDIConnection();

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, methodStr + "::> Error al inicializar la conexión.", e);
        }
        return conn;
    }

    /**
     *
     * @param cm
     * @param query
     * @return
     */
    public ResultSet executeQuery(String query) {
        String methodStr = className + "::executeQuery";
        ResultSet resultados = null;
        //Object result = null;
        try {
            getConnection();
            PreparedStatement pstmt = conn.prepareStatement(query);
            resultados = pstmt.executeQuery();
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método: " + methodStr, ex);
        }
        return resultados;
    }

    public JSONObject queryGetLogin(String query) {
        String methodStr = className + "::queryGetLogin";
        ResultSet rs = null;
        JSONObject result = new JSONObject();
        int count = 1;
        try {
            getConnection();
            PreparedStatement pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            //LOGGER.log(Level.FINER, methodStr + ">resultados: " + resultados);
            ResultSetMetaData metadata = rs.getMetaData();
            int cols = metadata.getColumnCount();

            LOGGER.log(Level.INFO, methodStr + ">Que hay en cols. " + cols);

            LOGGER.log(Level.INFO, methodStr + ">Entre al for. ");
            //JSONObject json = new JSONObject();
            while (rs.next()) {
                for (int i = 1; i < cols; i++) {
                    //JSONObject json_individual = new JSONObject();
                    result.put(metadata.getColumnName(i), rs.getObject(i));
                    LOGGER.log(Level.INFO, methodStr + ">----- al result. " + result);

                    //LOGGER.log(Level.INFO, methodStr + ">Que hay en el json_result. " + result);
                    //result = JSONObject.fromObject(result);
                }
                //result.put(i, json);
            }
            LOGGER.log(Level.INFO, methodStr + ">Que hay en el json_result final. " + result);
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método: " + methodStr, ex);
        } finally {
            cm.closeConnection();
        }
        return result;
    }

    /**
     *
     * @param cm
     * @param query
     * @return
     */
    public JSONArray executeQueryToArrayCatalogos(String query, boolean esSubdependencia) {
        String methodStr = className + "::executeQueryToArrayCatalogos";
        JSONArray json_array = new JSONArray();
        JSONObject json_result = new JSONObject();
        ResultSet rs = null;
        //Object result = null;
        try {
            getConnection();
            PreparedStatement pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            ResultSetMetaData metadata = rs.getMetaData();
            int cols = metadata.getColumnCount();
            for (int i = 0; i < cols; i++) {

                while (rs.next()) {
                    JSONObject json_individual = new JSONObject();
                    if (!esSubdependencia) {
                        json_individual.put(metadata.getColumnName(i + 1), rs.getObject(i + 1));
                        json_individual.put(metadata.getColumnName(i + 3), rs.getObject(3));
                        json_individual.put(metadata.getColumnName(i + 4), rs.getString(4));
                    //json_result = JSONObject.fromObject(json_individual);
                    } else {
                        json_individual.put(metadata.getColumnName(i + 1), rs.getObject(i + 1));
                        json_individual.put(metadata.getColumnName(i + 4), rs.getObject(4));
                        json_individual.put(metadata.getColumnName(i + 5), rs.getString(5));
                    }
                    json_result = JSONObject.fromObject(json_individual);
                    json_array.add(json_result);
                    LOGGER.log(Level.INFO, methodStr + ">Que hay en el json_array final. " + json_array);
                }
            }
            //forEachByMap(resultMap);
            //   LOGGER.log(Level.INFO, methodStr + ">Que hay en el result_array. "+ result_array.size());
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método: " + methodStr, ex);
        } finally {
            cm.closeConnection();
        }
        return json_array;
    }

    /**
     * Método que permite ejecutar un query, para devolver el valor del
     * identificador del catálogo que fue solicitado.
     *
     * @param query Sentencia que se va ejecutar.
     * @param columnID Nombre de la columna de la cual se requiere el valor.
     * @return Regresa un entero el cual representa el identificador del
     * catálogo solicitado.
     */
    public int executeQueryToID(String query, String columnID) {
        String methodStr = className + "::executeQueryToID";
        int result = 0;
        ResultSet rs = null;
        //Object result = null;
        try {
            getConnection();
            PreparedStatement pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Object next = rs.getObject(columnID);
                LOGGER.log(Level.FINEST, methodStr + ">Que hay en el next. " + next);
                result = Integer.valueOf(next.toString());
                LOGGER.log(Level.FINEST, methodStr + ">Que hay en el result del query. " + result);
            }
            //   LOGGER.log(Level.INFO, methodStr + ">Que hay en el result_array. "+ result_array.size());
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método: " + methodStr, ex);
        } finally {
            cm.closeConnection();
        }
        return result;
    }

    /**
     *
     * @param query
     * @return
     * @throws Exception
     */
    public int executeQueryUpd(String query) throws Exception {
        String methodStr = className + "::executeQueryUpd";
        int resultadoIUpd;

        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            resultadoIUpd = pstmt.executeUpdate();
            if (resultadoIUpd > 0) {
                LOGGER.log(Level.INFO, methodStr + ">Se inserto el registro con exito.");
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Ocurrio un error en la insercion a la base.");
            }
        } catch (SQLException sqlE) {
            LOGGER.log(Level.SEVERE, methodStr + ">Ocurrio un error al ejecutar el query: " + query, sqlE);
            try {
                cm.conn.rollback();
            } catch (SQLException sqlEroll) {
                LOGGER.log(Level.SEVERE, methodStr + ">Ocurrio un error al realizar rollback." + sqlEroll);
                throw new SQLException("Error al realizar rollback: " + sqlEroll);
            }
            throw new SQLException("Error al ejecutar query: " + sqlE + "\n query: " + query);
        } catch (Exception namE) {
            throw new SQLException("No se pudo ejecutar el query: " + namE);
        } finally {
            cm.closeConnection();
        }
        return resultadoIUpd;
    }
}
