/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 12 de Enero del 2018   
 */
package conacyt.beans;

import conacyt.db.RecordManager;
import conacyt.entityObject.UsuarioEntidad;
import conacyt.utils.Utilerias;
import java.text.SimpleDateFormat;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import net.sf.json.JSONObject;

/**
 * Clase de tipo Session Bean que contiene la logica de los servicios que se
 * requieren para las operaciones del Login.
 *
 * @author Edith Corina Ordaz Garnica <edith.ordaz@patronato.unam.mx>
 * <edith.ordaz@gmail.com>
 */
@Stateless
public class LoginConacytBean implements LoginConacytBeanLocal {

    private static final String className = "LoginConacytBean";
    private static final Logger LOGGER = Logger.getLogger("LoginConacytBean");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");

    SimpleDateFormat FORMAT_DATE = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
    RecordManager recordManager = null;

    public LoginConacytBean() {
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
    public JSONObject processMethod(String method, JSONObject params) {
        String methodStr = className + "::processMethod";
        JSONObject result = null;

        try {
            if (method.equals("getLogin")) {
                result = getLogin(params);
            } else if (method.equals("getUsuario")) {
                result = getUsuario(params);
            } else if (method.equals("insertaOactualizaUsuario")) {
                result = insertaOactualizaUsuario(params);
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
    private JSONObject getLogin(JSONObject params) {
        String methodStr = className + "::getLogin";
        JSONObject result = null;
        String query_usuario = null, query_usuario_rol = null;
        Integer id_usuario = null;

        try {
            if (params != null && !params.isEmpty() && !params.isNullObject()
                    && !params.getString("usuario").isEmpty() && !params.getString("pass").isEmpty()) {

                query_usuario = "SELECT * FROM " + conacyt_cfg.getString("usuario")
                        + " WHERE usuario = \'" + params.getString("usuario") + "\' AND password = \'" + params.getString("pass") + "\'";
                //LOGGER.log(Level.FINEST, methodStr + ">Error: > El query_usuario.> " + query_usuario);

                id_usuario = recordManager.executeQueryToID(query_usuario, conacyt_cfg.getString("column_id_usuario"));
                //LOGGER.log(Level.FINEST, methodStr + ">Error: > El id_usuario.> " + id_usuario);
                if (id_usuario != null && id_usuario > 0) {
                    query_usuario_rol = "SELECT * FROM " + conacyt_cfg.getString("v_usuario_rol")
                            + " WHERE id_usuario = " + id_usuario + " AND estatus=\'Activo\'";
                    //LOGGER.log(Level.FINEST, methodStr + ">Error: > El query_usuario_rol.> " + query_usuario_rol);
                    result = recordManager.queryGetJSON(query_usuario_rol);
                    result.accumulate("getLogin", "1");
                    //LOGGER.log(Level.FINEST, methodStr + ">Error: > El result.> " + result);
                } else {
                    result = new JSONObject().accumulate("getLogin", "-1").accumulate("mensaje", "El usuario que esta solicitando no es válido.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > El usuario que esta solicitando no es válido.");
                }
            } else {
                result = new JSONObject().accumulate("getLogin", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }
        } catch (Exception ex) {
            result = new JSONObject().accumulate("getLogin", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        return result;
    }

    private JSONObject insertaOactualizaUsuario(JSONObject params) {
        String methodStr = className + "::insertaOactualizaUsuario";
        JSONObject result = null, jsonExisteUsuario=new JSONObject();
        String query_upsert_usuario = null;
        int respuesta_upsert = 0;
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject()
                    && (params.containsKey("rfc") && !params.getString("rfc").isEmpty()) && (params.containsKey("clave_empleado") && !params.getString("clave_empleado").isEmpty())) {
                JSONObject json = JSONObject.fromObject(params);
                
                jsonExisteUsuario.accumulate("rfc", json.getString("rfc"));
                jsonExisteUsuario.accumulate("clave_empleado",  json.getString("clave_empleado"));
                    LOGGER.log(Level.WARNING, methodStr + ">: > EljsonExisteUsuario."+jsonExisteUsuario);
//Se verifica si esiste el usuario
                //if (existeUsuario(json.getString("rfc"), json.getString("clave_empleado"))) {
                if (Utilerias.existeRegistro(conacyt_cfg.getString("usuario"),conacyt_cfg.getString("column_id_usuario"),jsonExisteUsuario)) {
                    query_upsert_usuario = "UPDATE Usuarios SET ";
                    query_upsert_usuario += json.containsKey("rfc") && !json.getString("rfc").isEmpty() ? "rfc=?," : "";
                    query_upsert_usuario += json.containsKey("nombre") && !json.getString("nombre").isEmpty() ? "nombre=?," : "";
                    query_upsert_usuario += json.containsKey("apellido_p") && !json.getString("apellido_p").isEmpty() ? "apellido_p=?," : "";
                    query_upsert_usuario += json.containsKey("apellido_m") && !json.getString("apellido_m").isEmpty() ? "apellido_m=?," : "";
                    query_upsert_usuario += json.containsKey("clave_empleado") && !json.getString("clave_empleado").isEmpty() ? "clave_empleado=?," : "";
                    query_upsert_usuario += json.containsKey("correo") && !json.getString("correo").isEmpty() ? "correo=?," : "";
                    query_upsert_usuario += json.containsKey("telefono") && !json.getString("telefono").isEmpty() ? "telefono=?," : "";
                    query_upsert_usuario += json.containsKey("usuario") && !json.getString("usuario").isEmpty() ? "usuario=?," : "";
                    query_upsert_usuario += json.containsKey("password") && !json.getString("password").isEmpty() ? "password=?," : "";
                    query_upsert_usuario = query_upsert_usuario.substring(0, query_upsert_usuario.length() - 1);
                    query_upsert_usuario += " WHERE id_usuario=" + (json.containsKey("id_usuario") && json.getInt("id_usuario") > 0 ? "?" : 0);
                    LOGGER.log(Level.WARNING, methodStr + ">: > query_update_usuario." + query_upsert_usuario);
                    //result = new JSONObject().accumulate("insertaOactualizaUsuario", "0").accumulate("mensaje", "El usuario que desea registrar ya fue registrado anteriormente.");
                    //LOGGER.log(Level.WARNING, methodStr + ">Error: > El usuario que desea registrar ya fue registrado anteriormente.");

//                    respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_usuario, json);
                } else {
//Se validan los campos requeridos para el registro del usuario.
                    if (json.containsKey("id_usuario")) {
                        json.remove("id_usuario");
                    }

                    LOGGER.log(Level.WARNING, methodStr + ">: > valor del json." + json);
                    query_upsert_usuario = "INSERT INTO Usuarios(rfc, nombre, apellido_p, apellido_m, clave_empleado, correo, telefono, usuario, password) VALUES(?,?,?,?,?,?,?,?,?)";

                    LOGGER.log(Level.WARNING, methodStr + ">: > query_insert_usuario." + query_upsert_usuario);

                }
                    respuesta_upsert = recordManager.executeQueryUpsert(query_upsert_usuario, json);
                //LOGGER.log(Level.WARNING, methodStr + ">: > respuesta_ins." + respuesta_ins);
                if (respuesta_upsert > 0) {
                    result = new JSONObject().accumulate("insertaOactualizaUsuario", "1").accumulate("mensaje", "Se inserto usuario con éxito.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > Se inserto usuario con éxito.");
                } else {
                    result = new JSONObject().accumulate("insertaOactualizaUsuario", "-1").accumulate("mensaje", "No se inserto el usuario con éxito.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > No se inserto el usuario con éxito.");
                }
            } else {
                result = new JSONObject().accumulate("insertaOactualizaUsuario", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }

        } catch (Exception ex) {
            result = new JSONObject().accumulate("insertaOactualizaUsuario", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        return result;
    }

    private JSONObject getUsuario(JSONObject params) {
        String methodStr = className + "::getUsuario";
        JSONObject result = null;
        String query_usuario = null;
        String usuario = null, rfc = null, clave_empleado = null;

        try {
            if (params != null && !params.isEmpty() && !params.isNullObject()) {

                LOGGER.log(Level.WARNING, methodStr + ">Error: > El usuario ." + ((String) params.get("clave_empleado")));
                query_usuario = "SELECT * FROM " + conacyt_cfg.getString("usuario") + " WHERE ";
                query_usuario += params.containsKey("usuario") && !params.getString("usuario").isEmpty() ? "usuario=\'" + params.getString("usuario") + "\' AND " : "";
                query_usuario += params.containsKey("clave_empleado") && !params.getString("clave_empleado").isEmpty() ? "clave_empleado=\'" + params.getString("clave_empleado") + "\' AND " : "";
                query_usuario += params.containsKey("rfc") && !params.getString("rfc").isEmpty() ? "rfc=\'" + params.getString("rfc") + "\' AND " : "";
                query_usuario = query_usuario.substring(0, query_usuario.length() - 4);
                LOGGER.log(Level.WARNING, methodStr + ">: > query_update_usuario." + query_usuario);

                result = recordManager.queryGetJSON(query_usuario);

                if (result != null && result.isEmpty()) {
                    result = new JSONObject().accumulate("getUsuario", "-1").accumulate("mensaje", "El usuario no se encuentra registrado.");
                    LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
                }
            } else {
                result = new JSONObject().accumulate("getUsuario", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }

        } catch (Exception ex) {
            result = new JSONObject().accumulate("getUsuario", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        return result;

    }

    private UsuarioEntidad llenarEntidad(JSONObject params) {
        String methodStr = className + "::llenarEntidad";
        UsuarioEntidad entidad = new UsuarioEntidad();

        return entidad.parseFromJSONObjectToObject(params);

    }

//    private boolean existeUsuario(String rfc, String clave_empleado) {
//        String methodStr = className + "::existeUsuario";
//        boolean result = false;
//        String query_usuario = null;
//        Integer id_usuario = 0;
//        try {
//            if (!rfc.trim().isEmpty() && !clave_empleado.trim().isEmpty()) {
//                //Se verifica si esiste el usuario
//                query_usuario = "SELECT * FROM " + conacyt_cfg.getString("usuario")
//                        + " WHERE estatus = \'Activo\' AND rfc = \'" + rfc + "\' AND clave_empleado = \'" + clave_empleado + "\'";
//                id_usuario = recordManager.executeQueryToID(query_usuario, conacyt_cfg.getString("column_id_usuario"));
//                //LOGGER.log(Level.FINEST, methodStr + ">Error: > El id_usuario.> " + id_usuario);
//                if (id_usuario != null && id_usuario > 0) {
//                    result = true;
//                }
//            } else {
//                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
//            }
//
//        } catch (Exception ex) {
//            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
//        }
//        return result;
//    }

}
