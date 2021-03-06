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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Clase de tipo Session Bean que contiene la logica de los servicios que se
 * requieren para las operaciones de los catálogos.
 *
 * @author Edith Corina Ordaz Garnica <edith.ordaz@patronato.unam.mx>
 * <edith.ordaz@gmail.com>
 */
@Stateless
public class CatalogosConacytBean implements CatalogosConacytBeanLocal {

    private static final String className = "CatalogosConacytBean";
    private static final Logger LOGGER = Logger.getLogger("CatalogosConacytBean");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");
    RecordManager recordManager = null;

    /**
     * Constructor de la clase GenericExportCSV.
     */
    public CatalogosConacytBean() {
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
    public JSONArray processMethod(String method, JSONObject params) {
        String methodStr = className + "::processMethod";
        JSONArray result = null;

        try {
            if (method.equals("getCatalogo")) {
                result = getCatalogo(params);
            } else if (method.equals("insertOrUpdateCatalogo")) {
                result = insertOrUpdateCatalogo(params);
            } else if (method.equals("deleteCatalogo")) {
                result = deleteCatalogo(params);
            } else if (method.equals("getSubdependencias")) {
                result = getSubdependencias(params);
                /**
                 * TODO: por realizar } else if
                 * (method.equals("getCatSubDependencias")) { result =
                 * getCatSubDependencias(params);
                 */
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: método desconocido.");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método: " + method, e);
        }
        return result;
    }

    /**
     * Servicio genérico para obtener los registros de los catálogos, el modelo
     * de la base de datos nos permite generar un servicio para la obtención de
     * cualquier tipo de catálogo.
     *
     * @param params JSONObject p.ej. {"tabla":"nombre_del_catalogo"}
     * @return JSONArray [
     * {"id_cat_cat_catalogos":2,"id_cat_tabla":"Administrador","valor":"Rol
     * asignado para Administrador"},
     * {"id_cat_cat_catalogos":3,"id_cat_tabla":"Dependencia","valor":"Rol
     * asignada para Dependencias"}]
     */
    private JSONArray getCatalogo(JSONObject params) {
        String methodStr = className + "::getCatalogo";
        JSONArray result_query = null;
        JSONObject result = new JSONObject();
        String query_cat = null, query_cat_cat = null;
        Integer id_cat_tabla = null;
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject() && !params.getString("tabla").isEmpty()) {
                query_cat = "SELECT " + conacyt_cfg.getString("column_id_tabla")
                        + " FROM " + conacyt_cfg.getString("cat_tablas")
                        + " WHERE valor = \'" + params.getString("tabla") + "\'";
                id_cat_tabla = recordManager.executeQueryToID(query_cat, conacyt_cfg.getString("column_id_tabla"));
                if (id_cat_tabla != null && id_cat_tabla > 0) {
                    //LOGGER.log(Level.INFO, methodStr + ">Que hay en el id_cat_tabla. " + id_cat_tabla);
                    //Teniendo el identificador del catálogo a explotar se realiza la consulta al catálogo de catálogos dónde 
                    //solicitaremos todos los registros que esten asociados con el ID que enviamos como parámetro.
                    query_cat_cat = "SELECT * FROM " + conacyt_cfg.getString("cat_catalogos") + " WHERE id_cat_tabla = \'" + id_cat_tabla + "\'";
                    result_query = recordManager.executeQueryToArrayCatalogos(query_cat_cat, false);
                } else {
                    result = new JSONObject().accumulate("getCatalogo", "-1").accumulate("mensaje", "El catálogo que esta solicitando no se encuentra registrado en la base de datos.");
                    result_query = JSONArray.fromObject(result);
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > El catálogo que esta solicitando no se encuentra registrado en la base de datos." + params.getString("source"));
                }

            } else {
                result = new JSONObject().accumulate("getCatalogo", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                result_query = JSONArray.fromObject(result);
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }
        } catch (Exception ex) {
            result = new JSONObject().accumulate("getCatalogo", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            result_query = JSONArray.fromObject(result);
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método. ", ex);
        }
        return result_query;
    }

    private JSONArray insertOrUpdateCatalogo(JSONObject params) {
        String methodStr = className + "::insertOrUpdateCatalogo";
        JSONArray result_query = null;
        JSONObject result = new JSONObject();
        String query_cat = null, query_cat_cat = null;
        Integer id_cat_tabla = null;
        try {

        } catch (Exception ex) {
            result = new JSONObject().accumulate("insertOrUpdateCatalogo", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            result_query = JSONArray.fromObject(result);
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método. ", ex);
        }
        return result_query;
    }

    private JSONArray deleteCatalogo(JSONObject params) {
        String methodStr = className + "::deleteCatalogo";
        JSONArray result_query = null;
        JSONObject result = new JSONObject();
        String query_cat = null, query_cat_cat = null;
        Integer id_cat_tabla = null;
        try {

        } catch (Exception ex) {
            result = new JSONObject().accumulate("deleteCatalogo", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            result_query = JSONArray.fromObject(result);
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método. ", ex);
        }
        return result_query;
    }

    private JSONArray getSubdependencias(JSONObject params) {
        String methodStr = className + "::getSubdependencias";
        JSONArray result_query = null;
        JSONObject result = new JSONObject();
        String query_cat = null, query_cat_cat = null;
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject() && 
                    !params.getString("id_cat_catalogo").isEmpty()) {
                
                    query_cat = "SELECT * FROM " + conacyt_cfg.getString("cat_subdependencias")
                            + " WHERE id_cat_cat_catalogos = "+ params.getInt("id_cat_catalogo");

                //LOGGER.log(Level.WARNING, methodStr + ">tenemos en query_cat: > "+query_cat);
                result_query = recordManager.executeQueryToArrayCatalogos(query_cat, true);
                //LOGGER.log(Level.WARNING, methodStr + ">tenemos en result_query: > "+result_query);
            } else {
                result = new JSONObject().accumulate("getSubdependencias", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                result_query = JSONArray.fromObject(result);
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }
        } catch (Exception ex) {
            result = new JSONObject().accumulate("getSubdependencias", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            result_query = JSONArray.fromObject(result);
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método. ", ex);
        }
        return result_query;
    }

}
