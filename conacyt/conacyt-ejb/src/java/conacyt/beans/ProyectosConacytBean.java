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
            } else if (method.equals("obtenerComprobacionesProyecto")) {
                result = obtenerComprobacionesProyecto(params);
            } else if (method.equals("updsertComprobacionesP")) {
                result = updsertComprobacionesP(params);
            } else if (method.equals("updsertEtapasProyecto")) {
                result = updsertEtapasProyecto(params);
            } else if (method.equals("updsertResponsablesProyecto")) {
                result = updsertResponsablesProyecto(params);
            } else if (method.equals("updsertDocumentoProyecto")) {
                result = updsertDocumentoProyecto(params);
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
        JSONObject result_json = null, json_docs = null,
                json_tmp = new JSONObject();
        JSONArray result = new JSONArray(), json_etapas_proyecto = null,
                result_resp = null;
        String query_proyecto = null, query_docs_proy = null, query_doc = null,
                query_etapas_proy = null, query_responsables_proy = null;
        Integer id_docs_proyecto = null, id_proyecto = 0;

        try {
            if (params != null && !params.isEmpty() && !params.isNullObject()
                    && params.getInt("id_recurso") > 0 && !params.getString("clave_proyecto").isEmpty()) {
                query_proyecto = "SELECT " + conacyt_cfg.getString("campos_proyecto_sel") + " FROM " + conacyt_cfg.getString("v_proyectos")
                        + " WHERE estatus = \'Activo\' " + "AND id_recurso = " + params.getInt("id_recurso") + " AND clave_proyecto = \'" + params.getString("clave_proyecto") + "\'";
                LOGGER.log(Level.FINER, methodStr + ">query_proyecto: > " + query_proyecto);
                result_json = recordManager.queryGetJSON(query_proyecto);
                LOGGER.log(Level.FINER, methodStr + ">result_json: > " + result_json);
                //Se valida el resultado para entonces obtener el documento que se subio en el momento del registro del proyecto.
                if (result_json != null && !result_json.isEmpty() && result_json.getInt("id_proyecto") > 0) {
                    id_proyecto = result_json.getInt("id_proyecto");
                    json_tmp.put("datosGenerales", (Object) result_json);
                    query_doc = "SELECT * FROM " + conacyt_cfg.getString("documentos")
                            + " WHERE " + conacyt_cfg.getString("column_id_proyecto") + " = " + id_proyecto;
                    LOGGER.log(Level.FINER, methodStr + ">query_doc: > " + query_doc);
                    json_docs = recordManager.queryGetJSON(query_doc);
                    LOGGER.log(Level.FINER, methodStr + ">json_docs: > " + json_docs);

                    if (json_docs != null && !json_docs.isEmpty()) {
                        json_tmp.put("documentos", (Object) json_docs);
                        //result.add(json_tmp);
                        query_etapas_proy = "SELECT * FROM " + conacyt_cfg.getString("v_etapas_proyecto")
                                + " WHERE " + conacyt_cfg.getString("column_id_proyecto") + "=" + result_json.getInt("id_proyecto");

                        LOGGER.log(Level.FINER, methodStr + ">Error: > El query_etapas_proy ." + query_etapas_proy);
                        json_etapas_proyecto = recordManager.queryGetJSONFromJSON(query_etapas_proy);

                        if (json_etapas_proyecto != null && !json_etapas_proyecto.isEmpty()) {
                            json_tmp.put("etapas_proyecto", (Object) json_etapas_proyecto);
                            //LOGGER.log(Level.FINER, methodStr + ">Error: > El json_tmp ." + json_tmp);
                            query_responsables_proy = "SELECT * FROM " + conacyt_cfg.getString("v_responsables_proyecto")
                                    + " WHERE " + conacyt_cfg.getString("column_id_proyecto") + "=" + result_json.getInt("id_proyecto");
                            result_resp = recordManager.queryGetJSONFromJSON(query_responsables_proy);
                            if (query_responsables_proy != null && !query_responsables_proy.isEmpty()) {
                                json_tmp.put("responsables", (Object) result_resp);
                                result.add(json_tmp);
                            } else {
                                result_json = new JSONObject().accumulate("obtenerProyectosPorClave", -1).accumulate("mensaje", "El proyecto solicitado no tiene responsables asociados.");
                                LOGGER.log(Level.WARNING, methodStr + ">Error: > El proyecto solicitado no tiene responsables asociados.");
                                result.add(result_json);
                            }
                        } else {
                            result_json = new JSONObject().accumulate("obtenerProyectosPorClave", -1).accumulate("mensaje", "El proyecto solicitado no tiene etapas asociadas.");
                            LOGGER.log(Level.WARNING, methodStr + ">Error: > El proyecto solicitado no tiene etapas asociadas.");
                            result.add(result_json);
                        }
                    } else {
                        result_json = new JSONObject().accumulate("obtenerProyectosPorClave", -1).accumulate("mensaje", "El proyecto solicitado no tiene un documento asociado.");
                        LOGGER.log(Level.WARNING, methodStr + ">Error: > El proyecto solicitado no tiene un documento asociado.");
                        result.add(result_json);
                    }
                } else {
                    result_json = new JSONObject().accumulate("obtenerProyectosPorClave", -1).accumulate("mensaje", " Ocurrió un error al realizar la consulta del proyecto requerido.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > Ocurrió un error al realizar la consulta del proyecto requerido.");
                    result.add(result_json);
                }
                //result = new JSONObject().accumulate("getProyectos", -1).accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
            } else {
                result_json = new JSONObject().accumulate("obtenerProyectosPorClave", -1).accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
                result.add(result_json);
            }
        } catch (Exception ex) {
            result_json = new JSONObject().accumulate("obtenerProyectosPorClave", -1).accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
            result.add(result_json);
        }
        //LOGGER.log(Level.FINER, methodStr + "result: >" + result);
        //result = JSONArray.fromObject(result_json).fromObject(json_docs);
        return result;
    }

    private JSONArray insertarOactualizarProyecto(JSONObject params) {
        String methodStr = className + "::insertarOactualizarProyecto";
        JSONObject result_json = null, jsonExisteProyecto = new JSONObject(), params_select_proyecto = new JSONObject();
        JSONArray result = null;
        String query_upsert_proyecto = null, query_upsert_etapas_proyecto = null, query_upsert_resp_proyecto = null, query_sel_documento = null;
        String clave_proyecto = null;
        int respuesta_upsert = 0, id_recurso = 0, id_proyecto = 0, count = 0;
        //LOGGER.log(Level.WARNING, methodStr + ">params.>"+params.containsKey("datosGenerales"));                
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject()
                    && params.containsKey("datosGenerales") && params.containsKey("etapasProyecto")
                    && params.containsKey("responsables") && params.containsKey("documentos")) {
                JSONObject json = JSONObject.fromObject(params);
                //LOGGER.log(Level.WARNING, methodStr + ">json.>" + json);
                /**
                 * INSERT O UPDATE DE DATOS GENERALES DEL PROYECTO
                 */
                if (!json.getString("datosGenerales").isEmpty()) {
                    JSONObject json_datosGrales = JSONObject.fromObject(json.getString("datosGenerales"));
                    //LOGGER.log(Level.WARNING, methodStr + ">json_datosGrales.>" + json_datosGrales);
                    id_proyecto = json_datosGrales.containsKey("id_proyecto") && json_datosGrales.getInt("id_proyecto") > 0 ? json_datosGrales.getInt("id_proyecto") : 0;
                    id_recurso = (json_datosGrales.containsKey("id_recurso") && json_datosGrales.getInt("id_recurso") > 0) ? (int) json_datosGrales.get("id_recurso") : 0;
                    clave_proyecto = json_datosGrales.containsKey("clave_proyecto") && !json_datosGrales.getString("clave_proyecto").isEmpty() ? (String) json_datosGrales.get("clave_proyecto") : "";
                    jsonExisteProyecto.accumulate("id_proyecto", id_proyecto);
                    jsonExisteProyecto.accumulate("id_recurso", id_recurso);
                    jsonExisteProyecto.accumulate("clave_proyecto", clave_proyecto);

                    if ((json_datosGrales.containsKey("id_proyecto") && json_datosGrales.getInt("id_proyecto") > 0)
                            && Utilerias.existeRegistro(conacyt_cfg.getString("v_proyectos"), conacyt_cfg.getString("column_id_proyecto"), jsonExisteProyecto)) {
                        // LOGGER.log(Level.INFO, methodStr + ">Existe proyecto: > TRUE.");
//                        query_upsert_proyecto = "UPDATE Proyecto SET ";
//                        query_upsert_proyecto += json_datosGrales.containsKey("id_fondo") && json_datosGrales.getInt("id_fondo") > 0 ? "id_fondo=?," : "";
//                        query_upsert_proyecto += json_datosGrales.containsKey("id_moneda") && json_datosGrales.getInt("id_moneda") > 0 ? "id_moneda=?," : "";
//                        query_upsert_proyecto += json_datosGrales.containsKey("id_recurso") && json_datosGrales.getInt("id_recurso") > 0 ? "id_recurso=?," : "";
//                        query_upsert_proyecto += json_datosGrales.containsKey("clave_proyecto") && !json_datosGrales.getString("clave_proyecto").isEmpty() ? "clave_proyecto=?," : "";
//                        query_upsert_proyecto += json_datosGrales.containsKey("nombre_proyecto") && !json_datosGrales.getString("nombre_proyecto").isEmpty() ? "nombre_proyecto=?," : "";
//                        query_upsert_proyecto += json_datosGrales.containsKey("id_cat_dependencia") && json_datosGrales.getInt("id_cat_dependencia") > 0 ? "id_cat_dependencia=?," : "";
//                        query_upsert_proyecto += json_datosGrales.containsKey("id_cat_subdependencia") && json_datosGrales.getInt("id_cat_subdependencia") > 0 ? "id_cat_subdependencia=?," : "";
//                        query_upsert_proyecto += json_datosGrales.containsKey("importe_total") && !json_datosGrales.getString("importe_total").isEmpty() ? "importe_total=?," : "";
//                        query_upsert_proyecto += json_datosGrales.containsKey("fecha_inicio") && !json_datosGrales.getString("fecha_inicio").isEmpty() ? "fecha_inicio=?," : "";
//                        query_upsert_proyecto += json_datosGrales.containsKey("fecha_fin") && !json_datosGrales.getString("fecha_fin").isEmpty() ? "fecha_fin=?," : "";
//                        query_upsert_proyecto += json_datosGrales.containsKey("id_usuario") && json_datosGrales.getInt("id_usuario") > 0 ? "id_usuario=?," : "";
//                        query_upsert_proyecto = query_upsert_proyecto.substring(0, query_upsert_proyecto.length() - 1);
//                        query_upsert_proyecto += " WHERE id_proyecto=" + (json_datosGrales.containsKey("id_proyecto") && json_datosGrales.getInt("id_proyecto") > 0 ? "?" : 0);
                        // LOGGER.log(Level.WARNING, methodStr + ">: > query_upsert_proyecto." + query_upsert_proyecto);
                    } else {
                        // LOGGER.log(Level.INFO, methodStr + ">Existe proyecto: > FALSE.");
                        //Se validan los campos requeridos para el registro del proyecto.
                        //EN EL CASO DEL INSERT SE ELIMINA EL ID DEL PROYECTO, EN CASO DE HABERSE ENVIADO
                        if (json_datosGrales.containsKey("id_proyecto")) {
                            json_datosGrales.remove("id_proyecto");
                        }
                        query_upsert_proyecto = "INSERT INTO " + conacyt_cfg.getString("proyecto")
                                + "( " + conacyt_cfg.getString("campos_proyecto_ins") + " ) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
                        // LOGGER.log(Level.WARNING, methodStr + ">: > query_upsert_proyecto." + query_upsert_proyecto);
                        // LOGGER.log(Level.WARNING, methodStr + ">: > json_datosGrales." + json_datosGrales);
                    }
                    respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_proyecto, json_datosGrales);
                    //LOGGER.log(Level.WARNING, methodStr + ">: > respuesta_upsert." + respuesta_upsert);
                    if (respuesta_upsert > 0) {
                        result_json = new JSONObject().accumulate("insertarOactualizarProyecto", "1").accumulate("mensaje", "Se inserto proyecto con éxito.");
                        LOGGER.log(Level.INFO, methodStr + ">Error: > Se inserto proyecto con éxito.");
                        query_sel_documento = "SELECT * FROM " + conacyt_cfg.getString("v_proyectos")
                                + " WHERE id_recurso = \'" + json_datosGrales.getInt("id_recurso") + "\' AND clave_proyecto = " + json_datosGrales.getString("clave_proyecto");
                        id_proyecto = recordManager.executeQueryToID(query_sel_documento, conacyt_cfg.getString("column_id_proyecto"));

                        /**
                         * INSERT O UPDATE DE ETAPAS DEL PROYECTO.
                         */
                        result_json = updsertEtapasProyectos(json, id_proyecto);
                        LOGGER.log(Level.INFO, methodStr + ">Error: > result_json." + result_json);

                        if (result_json.getInt("insertarOactualizarProyecto") > 0) {
                            result_json = updsertResponsablesProyectos(params, id_proyecto);
                            LOGGER.log(Level.INFO, methodStr + ">Error: > result_json." + result_json);
                            if (result_json.getInt("insertarOactualizarProyecto") > 0) {
                                result_json = updsertDocumentoProyectos(params, id_proyecto);
                                LOGGER.log(Level.INFO, methodStr + ">Error: > result_json." + result_json);
                            }
                        }

                    } else {
                        result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "No se inserto el proyecto con éxito.");
                        LOGGER.log(Level.WARNING, methodStr + ">Error: > No se inserto el usuario con éxito.");
                    }
                } else {
                    result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "El parámetro que contiene los datos generales esta vacío.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > El parámetro que contiene los datos generales esta vacío.");
                }
            } else {
                result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "Los parámetros que envía son nulos, vacíos o están incompletos.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos, vacíos o están incompletos.");
            }
        } catch (Exception ex) {
            result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        result = JSONArray.fromObject(result_json);
        return result;
    }

    private JSONArray updsertEtapasProyecto(JSONObject params) {
        String methodStr = className + "::updsertEtapasProyecto";
        JSONArray respuesta = null;
        JSONObject result_json = null;
        try {
            result_json = updsertEtapasProyectos(params, 4);
        } catch (Exception e) {
            result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "Excepción al ejecutar el método. " + e);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", e);
        }
        respuesta = JSONArray.fromObject(result_json);
        return respuesta;
    }

    private JSONObject updsertEtapasProyectos(JSONObject params, int id_proyecto) {
        String methodStr = className + "::updsertEtapasProyecto";
        JSONObject result_json = null;
        String query_upsert_etapas_proyecto = null;
        int respuesta_upsert = 0, count = 0;
        //LOGGER.log(Level.WARNING, methodStr + ">params.>"+params.containsKey("datosGenerales"));                
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject() && !params.getString("etapasProyecto").isEmpty()) {
                /**
                 * INSERT O UPDATE DE ETAPAS DEL PROYECTO.
                 */
                JSONArray json_etapasP = JSONArray.fromObject(params.getString("etapasProyecto"));
                int etapas_size = json_etapasP.size();
                LOGGER.log(Level.FINER, methodStr + ">: > json_etapasP." + json_etapasP);
                LOGGER.log(Level.FINER, methodStr + ">: > etapas_size." + etapas_size);
                //QUERY
                query_upsert_etapas_proyecto = "INSERT INTO " + conacyt_cfg.getString("etapas_proyecto")
                        + "(" + conacyt_cfg.getString("campos_etapas_proyecto_ins") + ") VALUES(?,?,?,?,?,?,?,?)";

                for (int i = 0; i < etapas_size; i++) {
                    JSONObject etapa = (JSONObject) json_etapasP.get(i);
                    LOGGER.log(Level.FINER, methodStr + ">: > etapa." + etapa);
                    JSONObject etapa_con_id = new JSONObject();
                    //,,,,,,,,,,,,importe_autorizado,id_usuario
                    etapa_con_id.accumulate("id_etapa", etapa.getInt("id_etapa")).accumulate("id_recurso", etapa.getInt("id_recurso")).accumulate("id_proyecto", id_proyecto)
                            .accumulate("id_ministracion", etapa.getInt("id_ministracion")).accumulate("id_cat_tipo_gasto", etapa.getInt("id_cat_tipo_gasto"))
                            .accumulate("importe_asignado", etapa.getString("importe_asignado")).accumulate("importe_autorizado", etapa.getString("importe_autorizado")).accumulate("id_usuario", etapa.getInt("id_usuario"));

                    LOGGER.log(Level.FINER, methodStr + ">: > etapa_con_id." + etapa_con_id);

                    respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_etapas_proyecto, etapa_con_id);
                    if (respuesta_upsert > 0) {
                        count++;
                    }
                }
                LOGGER.log(Level.FINER, methodStr + ">: > etapas_size." + etapas_size + " count " + count);

                if (etapas_size == count) {
                    result_json = new JSONObject().accumulate("insertarOactualizarProyecto", etapas_size).accumulate("mensaje", "Se insertaron etapas con éxito.");
                    LOGGER.log(Level.INFO, methodStr + ">: > Se insertaron etapas con éxito.");
                } else {
                    result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "Ocurrió un error, No se insertaron etapas con éxito.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: >Ocurrió un error, No se insertaron etapas con éxito.");
                }
            } else {
                result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "El parámetro que contiene las etapas del proyecto esta vacío.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > El parámetro que contiene las etapas del proyecto esta vacío.");
            }
        } catch (Exception ex) {
            result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        return result_json;
    }

    private JSONArray updsertDocumentoProyecto(JSONObject params) {
        String methodStr = className + "::updsertDocumentoProyecto";
        JSONArray respuesta = null;
        JSONObject result_json = null;
        try {
            result_json = updsertDocumentoProyectos(params, 4);
        } catch (Exception e) {
            result_json = new JSONObject().accumulate("updsertDocumentoProyecto", -1).accumulate("mensaje", "Excepción al ejecutar el método. " + e);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", e);
        }
        respuesta = JSONArray.fromObject(result_json);
        return respuesta;
    }

    private JSONObject updsertDocumentoProyectos(JSONObject params, int id_proyecto) {
        String methodStr = className + "::updsertDocumentoProyectos";
        JSONObject result_json = null, params_exist = new JSONObject(), documento_proyecto = null, campos_documento_ins = null;
        String query_sel_documento = null, query_upsert_documento = null, query_upsert_documentos_proyecto = null;
        int respuesta_upsert = 0, count = 0, id_documentos = 0;
        //LOGGER.log(Level.WARNING, methodStr + ">params.>"+params.containsKey("datosGenerales"));                
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject() && !params.getString("documentos").isEmpty()) {
                JSONArray json_documentosP = JSONArray.fromObject(params.getString("documentos"));
                int documentos_size = json_documentosP.size();
                //QUERY

                for (int i = 0; i < documentos_size; i++) {
                    JSONObject documento = (JSONObject) json_documentosP.get(i);
                    LOGGER.log(Level.FINER, methodStr + ">: > documento." + documento);
                    campos_documento_ins = new JSONObject();
                    campos_documento_ins.accumulate("id_cat_cat_documentos", documento.getInt("id_cat_cat_documentos")).accumulate("nombre_archivo", documento.getString("nombre_archivo"))
                            .accumulate("ruta", documento.getString("ruta")).accumulate("id_usuario", documento.getInt("id_usuario")).accumulate("id_proyecto", id_proyecto);
                    LOGGER.log(Level.INFO, methodStr + ">: > campos_documento_ins." + campos_documento_ins);
                    query_upsert_documento = "INSERT INTO " + conacyt_cfg.getString("documentos")
                            + "(" + conacyt_cfg.getString("campos_documentos_ins") + ") VALUES(?,?,?,?,?)";
                    LOGGER.log(Level.INFO, methodStr + ">: > query_upsert_documento." + query_upsert_documento);
                    respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_documento, campos_documento_ins);

                    if (respuesta_upsert > 0) {
                        query_sel_documento = "SELECT * FROM " + conacyt_cfg.getString("documentos")
                                + " WHERE estatus= \'Activo\' AND " + conacyt_cfg.getString("id_cat_cat_documentos") + "=" + documento.getInt("id_cat_cat_documentos") + " AND id_proyecto = " + id_proyecto;
                        id_documentos = recordManager.executeQueryToID(query_sel_documento, conacyt_cfg.getString("column_id_documentos"));
                        documento_proyecto = new JSONObject();
                        documento_proyecto.accumulate("id_documentos", id_documentos).accumulate("id_proyecto", id_proyecto).accumulate("id_usuario", documento.getInt("id_usuario"));
                        query_upsert_documentos_proyecto = "INSERT INTO " + conacyt_cfg.getString("documentos_proyecto")
                                + "(" + conacyt_cfg.getString("campos_documentos_proyecto_ins") + ") VALUES(?,?,?)";
                        respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_documentos_proyecto, documento_proyecto);

                        if (respuesta_upsert > 0) {
                            result_json = new JSONObject().accumulate("insertarOactualizarProyecto", respuesta_upsert).accumulate("mensaje", "Se inserto relación de documentos con éxito.");
                            LOGGER.log(Level.INFO, methodStr + ">: > Se inserto documento con éxito.");
                        } else {
                            result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "No se inserto relación de documentos con éxito.");
                            LOGGER.log(Level.INFO, methodStr + ">: > No se inserto el documento con éxito.");
                        }
                    }
                    count++;
                }
                LOGGER.log(Level.FINER, methodStr + ">: > documentos_size." + documentos_size + " count " + count);

                if (documentos_size == count) {
                    result_json = new JSONObject().accumulate("insertarOactualizarProyecto", documentos_size).accumulate("mensaje", "Se insertaron documentos con éxito.");
                    LOGGER.log(Level.INFO, methodStr + ">: > Se insertaron documentos con éxito.");
                } else {
                    result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "Ocurrió un error, No se insertaron documentos con éxito.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: >Ocurrió un error, No se insertaron documento con éxito.");
                }
            } else {
                result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "El parámetro que contiene las documentos del proyecto esta vacío.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > El parámetro que contiene las documentos del proyecto esta vacío.");
            }
        } catch (Exception ex) {
            result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        return result_json;
    }

    private JSONArray updsertResponsablesProyecto(JSONObject params) {
        String methodStr = className + "::updsertResponsablesProyecto";
        JSONArray respuesta = null;
        JSONObject result_json = null;
        try {
            result_json = updsertResponsablesProyectos(params, 4);
        } catch (Exception e) {
            result_json = new JSONObject().accumulate("updsertResponsablesProyecto", -1).accumulate("mensaje", "Excepción al ejecutar el método. " + e);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", e);
        }
        respuesta = JSONArray.fromObject(result_json);
        return respuesta;
    }

    private JSONObject updsertResponsablesProyectos(JSONObject params, int id_proyecto) {
        String methodStr = className + "::updsertResponsablesProyectos";
        JSONObject result_json = null, params_exist = null, responsable_proyecto = null;
        String query_sel_responsable = null, query_upsert_responsable = null, query_upsert_responsables_proyecto = null;
        int respuesta_upsert = 0, count = 0, id_responsable = 0;
        //LOGGER.log(Level.WARNING, methodStr + ">params.>"+params.containsKey("datosGenerales"));                
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject() && !params.getString("responsables").isEmpty()) {
                JSONArray json_responsablesP = JSONArray.fromObject(params.getString("responsables"));
                int responsables_size = json_responsablesP.size();
                //QUERY

                for (int i = 0; i < responsables_size; i++) {
                    JSONObject responsable = (JSONObject) json_responsablesP.get(i);
                    LOGGER.log(Level.FINER, methodStr + ">: > responsable." + responsable);
                    params_exist = new JSONObject();
                    params_exist.accumulate("rfc", responsable.getString("rfc")).accumulate("id_cat_tipo_responsable", responsable.getInt("id_cat_tipo_responsable"));
                    //respuesta_upsert = recordManager.executeQueryToID(query_sel_documento, conacyt_cfg.getString("column_id_responsable"));
                    if (Utilerias.existeRegistro(conacyt_cfg.getString("v_responsables_proyecto"), conacyt_cfg.getString("column_id_responsable"), params_exist)) {
                        query_sel_responsable = "SELECT * FROM " + conacyt_cfg.getString("responsables")
                                + " WHERE rfc = \'" + responsable.getString("rfc") + "\' AND id_cat_tipo_responsable = " + responsable.getInt("id_cat_tipo_responsable");
                        id_responsable = recordManager.executeQueryToID(query_sel_responsable, conacyt_cfg.getString("column_id_responsable"));
                        responsable_proyecto = new JSONObject();
                        responsable_proyecto.accumulate("id_proyecto", id_proyecto).accumulate("id_responsable", id_responsable).accumulate("id_usuario", responsable.getInt("id_usuario"));
                        query_upsert_responsables_proyecto = "INSERT INTO " + conacyt_cfg.getString("responsable_proyecto")
                                + "(" + conacyt_cfg.getString("campos_responsables_proyecto_ins") + ") VALUES(?,?,?)";
                        respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_responsables_proyecto, responsable_proyecto);
                        if (respuesta_upsert > 0) {
                            result_json = new JSONObject().accumulate("insertarOactualizarProyecto", respuesta_upsert).accumulate("mensaje", "Se inserto responable con éxito.");
                            LOGGER.log(Level.INFO, methodStr + ">: > Se inserto responable con éxito.");
                        } else {
                            result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "No se inserto el responable con éxito.");
                            LOGGER.log(Level.INFO, methodStr + ">: > No se inserto el responable con éxito.");
                        }
                    } else {
                        JSONObject campos_insert_responsable = (JSONObject) json_responsablesP.get(i);
                        campos_insert_responsable.remove("id_proyecto");
                        query_upsert_responsable = "INSERT INTO " + conacyt_cfg.getString("responsables")
                                + "(" + conacyt_cfg.getString("campos_responsable_ins") + ") VALUES(?,?,?,?,?,?,?,?,?)";
                        respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_responsable, responsable);
                        if (respuesta_upsert > 0) {
                            query_sel_responsable = "SELECT * FROM " + conacyt_cfg.getString("responsables")
                                    + " WHERE rfc = \'" + responsable.getString("rfc") + "\' AND id_cat_tipo_responsable = " + responsable.getInt("id_cat_tipo_responsable");
                            id_responsable = recordManager.executeQueryToID(query_sel_responsable, conacyt_cfg.getString("column_id_responsable"));
                            LOGGER.log(Level.INFO, methodStr + ">: > id_responsable." + id_responsable);
                            responsable_proyecto = new JSONObject();
                            responsable_proyecto.accumulate("id_proyecto", id_proyecto).accumulate("id_responsable", id_responsable).accumulate("id_usuario", responsable.getInt("id_usuario"));
                            query_upsert_responsables_proyecto = "INSERT INTO " + conacyt_cfg.getString("responsable_proyecto")
                                    + "(" + conacyt_cfg.getString("campos_responsables_proyecto_ins") + ") VALUES(?,?,?)";
                            respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_responsables_proyecto, responsable_proyecto);
                            if (respuesta_upsert > 0) {
                                result_json = new JSONObject().accumulate("insertarOactualizarProyecto", respuesta_upsert).accumulate("mensaje", "Se inserto responable con éxito.");
                                LOGGER.log(Level.INFO, methodStr + ">: > Se inserto responable con éxito.");
                            } else {
                                result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "No se inserto el responable con éxito.");
                                LOGGER.log(Level.INFO, methodStr + ">: > No se inserto el responable con éxito.");
                            }
                        }
                    }
                    count++;
                }
                LOGGER.log(Level.FINER, methodStr + ">: > etapas_size." + responsables_size + " count " + count);

                if (responsables_size == count) {
                    result_json = new JSONObject().accumulate("insertarOactualizarProyecto", responsables_size).accumulate("mensaje", "Se insertaron responables con éxito.");
                    LOGGER.log(Level.INFO, methodStr + ">: > Se insertaron responables con éxito.");
                } else {
                    result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "Ocurrió un error, No se insertaron responables con éxito.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: >Ocurrió un error, No se insertaron responables con éxito.");
                }
            } else {
                result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "El parámetro que contiene las responables del proyecto esta vacío.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > El parámetro que contiene las responables del proyecto esta vacío.");
            }
        } catch (Exception ex) {
            result_json = new JSONObject().accumulate("insertarOactualizarProyecto", -1).accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        return result_json;
    }

    private JSONArray obtenerComprobacionesProyecto(JSONObject params) {
        String methodStr = className + "::obtenerComprobacionesProyecto";
        JSONObject result_json = null;
        JSONArray result = new JSONArray();
        String query_comprobaciones_proyecto = null;

        try {
            if (params != null && !params.isEmpty() && !params.isNullObject()
                    && params.containsKey("id_recurso") && params.getInt("id_recurso") > 0
                    && params.containsKey("clave_proyecto") && !params.getString("clave_proyecto").isEmpty()) {
                query_comprobaciones_proyecto = "SELECT * FROM " + conacyt_cfg.getString("v_anexos_comprobaciones")
                        + " WHERE id_recurso = " + params.getInt("id_recurso") + " AND clave_proyecto = " + params.getString("clave_proyecto");
                result = recordManager.queryGetJSONFromJSON(query_comprobaciones_proyecto);
                LOGGER.log(Level.FINER, methodStr + ">result: > " + result);
                //Se valida el resultado para entonces obtener el documento que se subio en el momento del registro del proyecto.
                if (result != null && !result.isEmpty()) {
                    LOGGER.log(Level.INFO, methodStr + ">: > Se obtuvieron las comprobaciones asociadas al proyecto.");
                } else {
                    result_json = new JSONObject().accumulate("obtenerComprobacionesProyecto", -1).accumulate("mensaje", " Ocurrió un error al realizar la consulta de las comprobacion(es) requerida(s).");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > Ocurrió un error al realizar la consulta de las comprobacion(es) requerida(s).");
                    result.add(result_json);
                }
            } else {
                result_json = new JSONObject().accumulate("obtenerComprobacionesProyecto", -1).accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
                result.add(result_json);
            }
        } catch (Exception ex) {
            result_json = new JSONObject().accumulate("obtenerComprobacionesProyecto", -1).accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
            result.add(result_json);
        }
        //LOGGER.log(Level.FINER, methodStr + "result: >" + result);
        // result = JSONArray.fromObject(result_json);
        return result;
    }

    private JSONArray updsertComprobacionesP(JSONObject params) {
        String methodStr = className + "::updsertComprobacionesP";
        JSONArray respuesta = null;
        JSONObject result_json = null;
        try {
            result_json = updsertComprobaciones(params);
        } catch (Exception e) {
            result_json = new JSONObject().accumulate("updsertComprobacionesP", -1).accumulate("mensaje", "Excepción al ejecutar el método. " + e);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", e);
        }
        respuesta = JSONArray.fromObject(result_json);
        return respuesta;
    }

    private JSONObject updsertComprobaciones(JSONObject params) {
        String methodStr = className + "::updsertComprobaciones";
        JSONObject result_json = null, params_ins_comprobacion = new JSONObject();
        String query_sel_comprobaciones = null, query_upsert_comprobacion = null, query_upsert_documentos = null;
        int respuesta_upsert = 0, count = 0, id_proyecto = 0;
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject()
                    && params.containsKey("id_recurso") && params.getInt("id_recurso") > 0
                    && params.containsKey("clave_proyecto") && !params.getString("clave_proyecto").isEmpty()) {
                JSONObject json = JSONObject.fromObject(params);

                query_sel_comprobaciones = "SELECT * FROM " + conacyt_cfg.getString("proyecto")
                        + " WHERE clave_proyecto = \'" + json.getString("clave_proyecto") + "\' AND id_recurso = " + json.getInt("id_recurso");
                id_proyecto = recordManager.executeQueryToID(query_sel_comprobaciones, conacyt_cfg.getString("column_id_proyecto"));
                LOGGER.log(Level.WARNING, methodStr + ">id_proyecto.>" + id_proyecto);
                //armamos los parametros para el insert de comprobaciones
                query_upsert_comprobacion = "INSERT INTO" + conacyt_cfg.getString("comprobacion") + "(" + conacyt_cfg.getString("campos_comprobacion_ins") + ") VALUES (?,?,?,?,?,?,?,?)";
                params_ins_comprobacion.accumulate("id_proyecto", id_proyecto).accumulate("id_etapa_proyecto", json.getString("id_etapa_proyecto"))
                        .accumulate("concepto", json.getString("concepto")).accumulate("importe", json.getString("importe")).accumulate("no_total_documentos", json.getString("no_total_documentos"))
                        .accumulate("id_usuario", json.getInt("id_usuario")).accumulate("id_tipo_gasto", json.getInt("id_tipo_gasto"));
                respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_comprobacion, params_ins_comprobacion);
                if (respuesta_upsert > 0) {
                    //TODO:ESTARA EN CONSTRUCCION
                    //updsertDocumentoProyectos(params, id_proyecto);
                } else {
                    result_json = new JSONObject().accumulate("updsertComprobaciones", -1).accumulate("mensaje", "Ocurrió un error al insertar la comprobación del proyecto.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > Ocurrió un error al insertar la comprobación del proyecto.");
                }
            } else {
                result_json = new JSONObject().accumulate("updsertComprobaciones", -1).accumulate("mensaje", "El parámetro que contiene las etapas del proyecto esta vacío.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > El parámetro que contiene las etapas del proyecto esta vacío.");
            }
        } catch (Exception ex) {
            result_json = new JSONObject().accumulate("updsertComprobaciones", -1).accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        return result_json;
    }

}
