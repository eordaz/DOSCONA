/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.beans;

import conacyt.db.RecordManager;
import conacyt.utils.Utilerias;
import java.text.SimpleDateFormat;
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
    
    SimpleDateFormat FORMAT_DATE = new SimpleDateFormat("yyyy-mm-dd");
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
        JSONObject result_json = null, nombre_proyecto = null, json_docs = null,
                  json_tmp = new JSONObject();
        JSONArray result = new JSONArray(),json_etapas_proyecto = null,result_resp = null;
        boolean esComprobacion = false;
        String query_proyecto = null, query_docs_proy = null, query_doc = null, query_etapas_proy = null, query_responsables_proy = null;
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
                    //LOGGER.log(Level.WARNING, methodStr + ">query_comprobacion: > " + query_proyecto);
                } else {
                    query_proyecto = "SELECT " + conacyt_cfg.getString("campos_proyecto")
                            + " FROM " + conacyt_cfg.getString("v_proyectos") + " WHERE estatus = \'Activo\' "
                            + "AND clave_recurso = " + clave_recurso + " AND clave_proyecto = " + clave_proyecto;
                   // LOGGER.log(Level.FINER, methodStr + ">query_proyecto: > " + query_proyecto);
                }
                result_json = recordManager.queryGetJSON(query_proyecto);
                //Se valida el resultado para entonces obtener el documento que se subio en el momento del registro del proyecto.
                if (result_json != null && !result_json.isEmpty() && result_json.getInt("id_proyecto") > 0) {
                    json_tmp.put("datosGenerales", (Object) result_json);
                   // LOGGER.log(Level.FINER, methodStr + ">json_tmp: > " + json_tmp);
                    //result.add(json_tmp);
                    query_docs_proy = "SELECT * FROM " + conacyt_cfg.getString("documentos_proyecto")
                            + " WHERE id_proyecto=" + result_json.getInt("id_proyecto");

                    id_docs_proyecto = recordManager.executeQueryToID(query_docs_proy, conacyt_cfg.getString("column_documentos_proyecto"));
                    if (id_docs_proyecto != null && id_docs_proyecto > 0) {
                        query_doc = "SELECT * FROM " + conacyt_cfg.getString("documentos")
                                + " WHERE " + conacyt_cfg.getString("column_documentos") + " = " + id_docs_proyecto;
                        json_docs = recordManager.queryGetJSON(query_doc);
                        if (json_docs != null && !json_docs.isEmpty()) {
                            json_tmp.put("documentos", (Object) json_docs);
                            //result.add(json_tmp);
                            query_etapas_proy = "SELECT * FROM " + conacyt_cfg.getString("v_etapas_proyecto")
                                    + " WHERE id_proyecto=" + result_json.getInt("id_proyecto");

                            LOGGER.log(Level.FINER, methodStr + ">Error: > El query_etapas_proy ." + query_etapas_proy);
                            json_etapas_proyecto = recordManager.queryGetJSONFromJSON(query_etapas_proy);

                            if (json_etapas_proyecto != null && !json_etapas_proyecto.isEmpty()) {
                                json_tmp.put("etapas_proyecto", (Object) json_etapas_proyecto);
                                //LOGGER.log(Level.FINER, methodStr + ">Error: > El json_tmp ." + json_tmp);
                                query_responsables_proy = "SELECT * FROM " + conacyt_cfg.getString("v_responsables_proyecto")
                                        + " WHERE id_proyecto=" + result_json.getInt("id_proyecto");
                                result_resp = recordManager.queryGetJSONFromJSON(query_responsables_proy);
                                if (query_responsables_proy != null && !query_responsables_proy.isEmpty()) {
                                    json_tmp.put("responsables", (Object) result_resp);
                                    result.add(json_tmp);
                                } else {
                                    result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", "El proyecto solicitado no tiene responsables asociados.");
                                    LOGGER.log(Level.WARNING, methodStr + ">Error: > El proyecto solicitado no tiene responsables asociados.");
                                    result.add(result_json);
                                }
                            } else {
                                result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", "El proyecto solicitado no tiene etapas asociadas.");
                                LOGGER.log(Level.WARNING, methodStr + ">Error: > El proyecto solicitado no tiene etapas asociadas.");
                                result.add(result_json);
                            }
                        } else {
                            result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", "El proyecto solicitado no tiene un documento asociado.");
                            LOGGER.log(Level.WARNING, methodStr + ">Error: > El proyecto solicitado no tiene un documento asociado.");
                            result.add(result_json);
                        }

                    } else {
                        result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", "El identificador que esta solicitando no es válido.");
                        LOGGER.log(Level.WARNING, methodStr + ">Error: > El usuario que esta solicitando no es válido.");
                        result.add(result_json);
                    }
                } else {
                    result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", " Ocurrió un error al realizar la consulta del proyecto requerido.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > Ocurrió un error al realizar la consulta del proyecto requerido.");
                    result.add(result_json);
                }
                //result = new JSONObject().accumulate("getProyectos", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
            } else {
                result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
                result.add(result_json);
            }
        } catch (Exception ex) {
            result_json = new JSONObject().accumulate("obtenerProyectosPorClave", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
            result.add(result_json);
        }
        //LOGGER.log(Level.FINER, methodStr + "result: >" + result);
        //result = JSONArray.fromObject(result_json).fromObject(json_docs);
        return result;
    }

    private JSONArray insertarOactualizarProyecto(JSONObject params) {
        String methodStr = className + "::insertarOactualizarProyecto";
        JSONObject result_json = null, nombre_proyecto = null,
                jsonExisteProyecto = new JSONObject();
        JSONArray result = null;
        boolean esComprobacion = false;
        String query_upsert_proyecto = null;
        String clave_proyecto = null, clave_recurso = null;
        Integer id_proyecto = null;
        int respuesta_upsert = 0;
        //LOGGER.log(Level.WARNING, methodStr + ">params.>"+params.containsKey("datosGenerales"));                
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject()
                    && params.containsKey("datosGenerales") && params.containsKey("etapasProyecto")
                    && params.containsKey("responsables") && params.containsKey("documentos")) {
                JSONObject json = JSONObject.fromObject(params);
                LOGGER.log(Level.WARNING, methodStr + ">json.>" + json);
                if (!json.getString("datosGenerales").isEmpty()) {
                    JSONObject json_datosGrales = JSONObject.fromObject(json.getString("datosGenerales"));

                    LOGGER.log(Level.WARNING, methodStr + ">json_datosGrales.>" + json_datosGrales);
                    clave_recurso = (String) json_datosGrales.get("clave_recurso");
                    clave_proyecto = (String) json_datosGrales.get("clave_proyecto");

                    jsonExisteProyecto.accumulate("clave_recurso", clave_recurso);
                    jsonExisteProyecto.accumulate("clave_proyecto", clave_proyecto);
                    if (Utilerias.existeRegistro(conacyt_cfg.getString("v_proyectos"), conacyt_cfg.getString("column_id_proyecto"), jsonExisteProyecto)) {
                        LOGGER.log(Level.WARNING, methodStr + ">Existe proyecto: > TRUE.");
                        query_upsert_proyecto = "UPDATE Proyecto SET ";
                        query_upsert_proyecto += json_datosGrales.containsKey("id_fondo") && json_datosGrales.getInt("id_fondo") > 0 ? "id_fondo=?," : "";
                        query_upsert_proyecto += json_datosGrales.containsKey("id_moneda") && json_datosGrales.getInt("id_moneda") > 0 ? "id_moneda=?," : "";
                        query_upsert_proyecto += json_datosGrales.containsKey("id_recurso") && json_datosGrales.getInt("id_recurso") > 0 ? "id_recurso=?," : "";
                        query_upsert_proyecto += json_datosGrales.containsKey("clave_proyecto") && !json_datosGrales.getString("clave_proyecto").isEmpty() ? "clave_proyecto=?," : "";
                        query_upsert_proyecto += json_datosGrales.containsKey("nombre_proyecto") && !json_datosGrales.getString("nombre_proyecto").isEmpty() ? "nombre_proyecto=?," : "";
                        query_upsert_proyecto += json_datosGrales.containsKey("id_dependencia") && json_datosGrales.getInt("id_dependencia") > 0 ? "id_cat_dependencia=?," : "";
                        query_upsert_proyecto += json_datosGrales.containsKey("id_subdependencia") && json_datosGrales.getInt("id_subdependencia") > 0 ? "id_cat_subdependencia=?," : "";
                        query_upsert_proyecto += json_datosGrales.containsKey("importe_total") && !json_datosGrales.getString("importe_total").isEmpty() ? "importe_total=?," : "";
                        query_upsert_proyecto += json_datosGrales.containsKey("usuario") && !json_datosGrales.getString("usuario").isEmpty() ? "usuario=?," : "";
                        query_upsert_proyecto = query_upsert_proyecto.substring(0, query_upsert_proyecto.length() - 1);
                        query_upsert_proyecto += " WHERE id_proyecto=" + (json_datosGrales.containsKey("id_proyecto") && json_datosGrales.getInt("id_proyecto") > 0 ? "?" : 0);
                        LOGGER.log(Level.WARNING, methodStr + ">: > query_update_usuario." + query_upsert_proyecto);

//                    respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_proyecto, json_datosGrales);
                    } else {
//Se validan los campos requeridos para el registro del proyecto.
                        if (json_datosGrales.containsKey("id_proyecto")) {
                            json_datosGrales.remove("id_proyecto");
                        }

                        LOGGER.log(Level.WARNING, methodStr + ">: > valor del json_datosGrales." + json_datosGrales);
                        query_upsert_proyecto = "INSERT INTO Proyecto(id_fondo, id_moneda, id_recurso, clave_proyecto, nombre_proyecto, id_cat_dependencia, id_cat_subdependencia, importe_total, usuario) VALUES(?,?,?,?,?,?,?,?,?)";

                        LOGGER.log(Level.WARNING, methodStr + ">: > query_insert_usuario." + query_upsert_proyecto);

                    }
                    //respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_proyecto, json_datosGrales);
                    //LOGGER.log(Level.WARNING, methodStr + ">: > respuesta_ins." + respuesta_ins);
                    if (respuesta_upsert > 0) {
                        result_json = new JSONObject().accumulate("insertaOactualizaUsuario", "1").accumulate("mensaje", "Se inserto usuario con éxito.");
                        LOGGER.log(Level.WARNING, methodStr + ">Error: > Se inserto usuario con éxito.");
                    } else {
                        result_json = new JSONObject().accumulate("insertaOactualizaUsuario", "-1").accumulate("mensaje", "No se inserto el usuario con éxito.");
                        LOGGER.log(Level.WARNING, methodStr + ">Error: > No se inserto el usuario con éxito.");
                    }
                } else {
                    result_json = new JSONObject().accumulate("insertarOactualizarProyecto", "-1").accumulate("mensaje", "Los parámetros que envía son nulos, vacíos o están incompletos.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos, vacíos o están incompletos.");
                }
            } else {
                result_json = new JSONObject().accumulate("insertarOactualizarProyecto", "-1").accumulate("mensaje", "El parámetro que contiene los datos generales esta vacío.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > El parámetro que contiene los datos generales esta vacío.");
            }
        } catch (Exception ex) {
            result_json = new JSONObject().accumulate("insertarOactualizarProyecto", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        result = JSONArray.fromObject(result_json);
        return result;
    }

}
