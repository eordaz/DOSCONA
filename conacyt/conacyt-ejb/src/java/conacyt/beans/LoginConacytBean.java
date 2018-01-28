/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 12 de Enero del 2018   
 */
package conacyt.beans;

import conacyt.db.RecordManager;
import conacyt.entityObject.UsuarioEntidad;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        JSONObject result = null;
        String query_insert_usuario = null, query_update_usuario = null, apellido_m = null, telefono = null, password = null;
        Date fecha_registro = new Date();
        int respuesta_ins = 0;
        try {
            if (params != null && !params.isEmpty() && !params.isNullObject()
                    && !params.getString("rfc").isEmpty() && !params.getString("clave_empleado").isEmpty()) {
                //Se verifica si esiste el usuario
                if (existeUsuario(params.getString("rfc"), params.getString("clave_empleado"))) {
                    if (!params.getString("nombre").isEmpty() || !params.getString("apellido_p").isEmpty() || !params.getString("apellido_m").isEmpty() || !params.getString("correo").isEmpty()
                            || !params.getString("usuario").isEmpty() || !params.getString("password").isEmpty() || !params.getString("telefono").isEmpty()) {
                        
                        query_update_usuario = "UPDATE Usuario SET ";
                        query_update_usuario += !params.getString("rfc").isEmpty() ? "rfc=\'" + params.getString("rfc") + "\'," : "";
                        query_update_usuario += !params.getString("nombre").isEmpty() ? "nombre=\'" + params.getString("nombre") + "\'," : "";
                        query_update_usuario += !params.getString("apellido_p").isEmpty() ? "apellido_p=\'" + params.getString("apellido_p") + "\'," : "";
                        query_update_usuario += !params.getString("apellido_m").isEmpty() ? "apellido_m=\'" + params.getString("apellido_m") + "\'," : "";
                        query_update_usuario += !params.getString("clave_empleado").isEmpty() ? "clave_empleado=\'" + params.getString("clave_empleado") + "\'," : "";
                        query_update_usuario += !params.getString("correo").isEmpty() ? "correo=\'" + params.getString("correo") + "\'," : "";
                        query_update_usuario += !params.getString("telefono").isEmpty() ? "telefono=\'" + params.getString("telefono") + "\'," : "";
                        query_update_usuario += !params.getString("usuario").isEmpty() ? "usuario=\'" + params.getString("usuario") + "\'," : "";
                        query_update_usuario += !params.getString("password").isEmpty() ? "password=\'" + params.getString("password") + "\'," : "";
                        query_update_usuario += "\'" + FORMAT_DATE.format(fecha_registro) + "\'," + "estatus=\'Activo'";

                        LOGGER.log(Level.WARNING, methodStr + ">Error: > query_update_usuario." + query_update_usuario);
                        //result = new JSONObject().accumulate("insertaOactualizaUsuario", "0").accumulate("mensaje", "El usuario que desea registrar ya fue registrado anteriormente.");
                        //LOGGER.log(Level.WARNING, methodStr + ">Error: > El usuario que desea registrar ya fue registrado anteriormente.");
                    } else {
                        result = new JSONObject().accumulate("insertaOactualizaUsuario", "-1").accumulate("mensaje", "Los parámetros que envía para la actualización estàn incompletos.");
                        LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía para el registro estàn incompletos.");
                    }
                } else {
//Se validan los campos requeridos para el registro del usuario.
                    if (!params.getString("nombre").isEmpty() && !params.getString("apellido_p").isEmpty() && !params.getString("correo").isEmpty()
                            && !params.getString("usuario").isEmpty() && !params.getString("password").isEmpty()) {
                        apellido_m = !params.getString("apellido_m").isEmpty() ? params.getString("apellido_m") : "";
                        telefono = !params.getString("telefono").isEmpty() ? params.getString("telefono") : "";
                        password = !params.getString("password").isEmpty() ? params.getString("password") : "";
                        //llenarEntidad(params);
//                        query_insert_usuario = "INSERT INTO Usuarios(rfc, nombre, apellido_p, apellido_m, clave_empleado, correo, telefono, usuario, password) VALUES(\'" + params.getString("rfc") + "\',\'" + params.getString("nombre") + "\',\'" + params.getString("apellido_p") + "\',"
//                                + "\'" + apellido_m + "\',\'" + params.getString("clave_empleado") + "\',\'" + params.getString("correo") + "\',\'" + telefono + "\',\'" + params.getString("usuario") + "\',\'"
//                                + password + "\')";
                        query_insert_usuario = "INSERT INTO Usuarios(rfc, nombre, apellido_p, apellido_m, clave_empleado, correo, telefono, usuario, password) VALUES(?,?,?,?,?,?,?,?,?)";

                        LOGGER.log(Level.WARNING, methodStr + ">: > query_insert_usuario." + query_insert_usuario);
                        respuesta_ins = recordManager.executeQueryInsertUsuario(query_insert_usuario,llenarEntidad(params));
                        LOGGER.log(Level.WARNING, methodStr + ">: > respuesta_ins." + respuesta_ins);
                        
                    } else {
                        result = new JSONObject().accumulate("insertaOactualizaUsuario", "-1").accumulate("mensaje", "Los parámetros que envía para el registro estàn incompletos.");
                        LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía para el registro estàn incompletos.");
                    }
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

    private UsuarioEntidad llenarEntidad(JSONObject params) {
        String methodStr = className + "::llenarEntidad";
        UsuarioEntidad entidad = new UsuarioEntidad();

        return entidad.parseFromJSONObjectToObject(params);

    }

    private boolean existeUsuario(String rfc, String clave_empleado) {
        String methodStr = className + "::existeUsuario";
        boolean result = false;
        String query_usuario = null;
        Integer id_usuario = 0;
        try {
            if (!rfc.trim().isEmpty() && !clave_empleado.trim().isEmpty()) {
                //Se verifica si esiste el usuario
                query_usuario = "SELECT * FROM " + conacyt_cfg.getString("usuario")
                        + " WHERE estatus = \'Activo\' AND rfc = \'" + rfc + "\' AND clave_empleado = \'" + clave_empleado + "\'";
                id_usuario = recordManager.executeQueryToID(query_usuario, conacyt_cfg.getString("column_id_usuario"));
                //LOGGER.log(Level.FINEST, methodStr + ">Error: > El id_usuario.> " + id_usuario);
                if (id_usuario != null && id_usuario > 0) {
                    result = true;
                }
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }

        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        return result;
    }
}
