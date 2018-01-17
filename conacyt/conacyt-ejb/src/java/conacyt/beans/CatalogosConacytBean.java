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
 * Clase de tipo Session Bean que contiene la logica de los servicios que se requieren
 * para las operaciones de los catálogos.
 * 
 * @author Edith Corina Ordaz Garnica <edith.ordaz@patronato.unam.mx> <edith.ordaz@gmail.com> 
 */
@Stateless
public class CatalogosConacytBean implements CatalogosConacytBeanLocal {

    private static final String className = "CatalogosConacytBean";
    private static final Logger LOGGER = Logger.getLogger("CatalogosConacytBean");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");
    RecordManager recordManager = null;

    @Override
    public void setLoggerLevel(Level level) {
        LOGGER.setLevel(Level.FINEST);
    }

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
                /**
                 * } else if (method.equals("getCatMonedas")) { result =
                 * getCatMonedas(params); } else if
                 * (method.equals("getCatDependencias")) { result =
                 * getCatDependencias(params); } else if
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
     * @return JSONArray [ {"id_cat_cat_catalogos":2,"id_cat_tabla":"Administrador","valor":"Rol asignado para Administrador"},
                           {"id_cat_cat_catalogos":3,"id_cat_tabla":"Dependencia","valor":"Rol asignada para Dependencias"}]
     */
    private JSONArray getCatalogo(JSONObject params) {
        String methodStr = className + "::getCatalogo";
        JSONArray result_query=null;
        JSONObject result = new JSONObject();
        String query_cat = null, query_cat_cat = null;
        Integer id_cat_tabla = null;
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject() && !params.getString("source").isEmpty()) {
                query_cat = "SELECT " + conacyt_cfg.getString("column_id_tabla") +
                            " FROM " + conacyt_cfg.getString("cat_tablas") + 
                            " WHERE valor = \'" + params.getString("source") + "\'";
                id_cat_tabla = recordManager.executeQueryToID(query_cat, conacyt_cfg.getString("column_id_tabla"));
                if(id_cat_tabla!=null && id_cat_tabla > 0){
                    //LOGGER.log(Level.INFO, methodStr + ">Que hay en el id_cat_tabla. " + id_cat_tabla);
                    //Teniendo el identificador del catálogo a explotar se realiza la consulta al catálogo de catálogos dónde 
                    //solicitaremos todos los registros que esten asociados con el ID que enviamos como parámetro.
                    query_cat_cat = "SELECT * FROM " + conacyt_cfg.getString("cat_catalogos") + " WHERE id_cat_tabla = \'" + id_cat_tabla + "\'";
                    result_query = recordManager.executeQueryToArray(query_cat_cat);
                    for (int i = 0; i < result_query.size(); i++) {
                        Object object = result_query.get(i);                       
                        result.put(i,object);
                    }
                } else {
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > El catálogo que esta solicitando no se encuentra registrado en la base de datos." + params.getString("source"));
                }
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, methodStr + ">Excepción al ejecutar el método. ", ex);
        }
        return result_query;
    }
}
