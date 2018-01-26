/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.beans;

import conacyt.db.RecordManager;
import conacyt.utils.Utilerias;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author vsanchez Edithiña
 */
@Stateless
public class ProyectosConacytBean implements ProyectosConacytBeanLocal {

    private static final String className = "ProyectosConacytBean";
    private static final Logger LOGGER = Logger.getLogger("ProyectosConacytBean");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");
    RecordManager recordManager = null;

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public ProyectosConacytBean() {
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
            if (method.equals("obtenerProyectosPorClave")) {
                result = obtenerProyectosPorClave(params);
            } else if (method.equals("insertarOactualizarProyecto")) {
                result = insertarOactualizarProyecto(params);
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
    private JSONArray obtenerProyectosPorClave(JSONObject params) {
        String methodStr = className + "::obtenerProyectosPorClave";
        JSONObject result_json = null, nombre_proyecto = null, json_docs = null;
        JSONArray result = new JSONArray();
        boolean esComprobacion = false;
        String query_proyecto = null, query_docs_proy = null, query_doc = null;
        String clave_proyecto = null, clave_recurso = null;
        Integer id_docs_proyecto = null;

        try {
            if (params != null && !params.isEmpty() && !params.isNullObject()
                    && !params.getString("clave_proyecto").isEmpty()) {
                nombre_proyecto = Utilerias.separaNombreProyecto(params.getString("clave_proyecto"));
                clave_recurso = "\'" + (String) nombre_proyecto.get("clave_recurso") + "\'";
                clave_proyecto = "\'" + (String) nombre_proyecto.get("clave_proyecto") + "\'";
                esComprobacion = params.containsKey("esComprobacion") ? params.getBoolean("esComprobacion") : esComprobacion;
                /*Verifica que exista el recurso en la tabla */
                if (esComprobacion) {
                    query_proyecto = "SELECT " + conacyt_cfg.getString("campos_comprobacion")
                            + " FROM " + conacyt_cfg.getString("v_proyectos") + " WHERE estatus = \'Activo\' "
                            + "AND clave_recurso = " + clave_recurso + " AND clave_proyecto = " + clave_proyecto;
                    LOGGER.log(Level.WARNING, methodStr + ">query_comprobacion: > " + query_proyecto);
                } else {
                    query_proyecto = "SELECT " + conacyt_cfg.getString("campos_proyecto")
                            + " FROM " + conacyt_cfg.getString("v_proyectos") + " WHERE estatus = \'Activo\' "
                            + "AND clave_recurso = " + clave_recurso + " AND clave_proyecto = " + clave_proyecto;
                    LOGGER.log(Level.WARNING, methodStr + ">query_proyecto: > " + query_proyecto);
                }

                result_json = recordManager.queryGetJSON(query_proyecto);
                //Se valida el resultado para entonces obtener el documento que se subio en el momento del registro del proyecto.
                if (result_json != null && !result_json.isEmpty() && result_json.getInt("id_proyecto") > 0) {
                    //result = JSONArray.fromObject(result_json);
                    result.add(result_json);
                    query_docs_proy = "SELECT * FROM " + conacyt_cfg.getString("documentos_proyecto")
                            + " WHERE id_proyecto=" + result_json.getInt("id_proyecto");

                    id_docs_proyecto = recordManager.executeQueryToID(query_docs_proy, conacyt_cfg.getString("column_documentos_proyecto"));
                    if (id_docs_proyecto != null && id_docs_proyecto > 0) {
                        query_doc = "SELECT * FROM " + conacyt_cfg.getString("documentos")
                                + " WHERE " + conacyt_cfg.getString("column_documentos") + " = " + id_docs_proyecto;
                        json_docs = recordManager.queryGetJSON(query_doc);
                        if (json_docs != null) {
                            //result = JSONArray.fromObject(json_docs);
                            result.add(json_docs);
                        } else {
                            result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", "El proyecto solicitado no tiene un documento asociado.");
                            LOGGER.log(Level.WARNING, methodStr + ">Error: > El proyecto solicitado no tiene un documento asociado.");
                        }

                    } else {
                        result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", "El identificador que esta solicitando no es válido.");
                        LOGGER.log(Level.WARNING, methodStr + ">Error: > El usuario que esta solicitando no es válido.");
                    }
                } else {
                    result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", " Ocurrió un error al realizar la consulta del proyecto requerido.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > Ocurrió un error al realizar la consulta del proyecto requerido.");
                }
                //result = new JSONObject().accumulate("getProyectos", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
            } else {
                result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }
        } catch (Exception ex) {
            result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
            LOGGER.log(Level.SEVERE, methodStr + "result: >"+result);
        //result = JSONArray.fromObject(result_json).fromObject(json_docs);
        return result;
    }

    private JSONArray insertarOactualizarProyecto(JSONObject params) {
        String methodStr = className + "::insertarOactualizarProyecto";
        JSONObject result_json = null, nombre_proyecto = null;
        JSONArray result = null;
        boolean esComprobacion = false;
        String query_proyecto = null;
        String clave_proyecto = null, clave_recurso = null;
        Integer id_proyecto = null;

        try {
            if (params != null && !params.isEmpty() && !params.isNullObject()
                    && !params.getString("clave_proyecto").isEmpty()) {

            } else {
                result_json = new JSONObject().accumulate("insertarOactualizarProyecto", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }
        } catch (Exception ex) {
            result_json = new JSONObject().accumulate("insertarOactualizarProyecto", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        result = JSONArray.fromObject(result_json);
        return result;
    }

}
