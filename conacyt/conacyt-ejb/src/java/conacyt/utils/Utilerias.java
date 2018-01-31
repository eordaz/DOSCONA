/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.utils;

import conacyt.db.RecordManager;
import conacyt.entityObject.ProyectoEntidad;
import conacyt.entityObject.UsuarioEntidad;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author eordazga
 */
public class Utilerias {

    private static final String className = "Utilerias";
    private static final Logger LOGGER = Logger.getLogger("Utilerias");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");

    static RecordManager  recordManager = new RecordManager(conacyt_cfg.getString("datasource"));

    public Utilerias() {
        try {
            LOGGER.setLevel(Level.FINEST);
           // recordManager = new RecordManager(conacyt_cfg.getString("datasource"));
//            LOGGER.setLevel(Level.WARNING);
//            LOGGER.setLevel(Level.INFO);
//            LOGGER.setLevel(Level.FINER);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + "::> Error al crear el objeto.", e);
        }

    }

    public static void forEachByMap(HashMap map) {
        String methodStr = className + "::forEachByMap";
        try {
            for (Object key : map.keySet()) {
                LOGGER.log(Level.INFO, methodStr + ">Iterating or looping map using java5 foreach loop: " + key);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, methodStr + ">Error: " + e);
        }
    }

    public static JSONObject separaNombreProyecto(String nombre) {
        String methodStr = className + "::separaNombreProyecto";
        JSONObject nombreProyecto = new JSONObject();
        String[] separador = null;
        String clave_recurso = null, clave_proyecto = null;
        try {
            clave_recurso = nombre.substring(0, 2);
            clave_proyecto = nombre.substring(2, nombre.length());
            nombreProyecto.accumulate("clave_recurso", clave_recurso).accumulate("clave_proyecto", clave_proyecto);

            //LOGGER.log(Level.INFO, methodStr + ">nombreProyecto: " + nombreProyecto);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, methodStr + ">Error: " + e);
        }
        return nombreProyecto;
    }

    public static boolean existeRegistro(String tabla, String columna, JSONObject params) {
        String methodStr = className + "::existeRegistro";
        boolean result = false;
        String query_usuario = null;
        Integer id_usuario = 0;
        try {
            if (!params.isEmpty() && !tabla.trim().isEmpty()) {
                //Se verifica si esiste el usuario
                //query_usuario = "SELECT * FROM " + tabla + " WHERE estatus = \'Activo\' AND rfc = \'" + rfc + "\' AND clave_empleado = \'" + clave_empleado + "\'";
                query_usuario = "SELECT * FROM " + tabla + " WHERE ";

                for (Iterator iterator = params.keys(); iterator.hasNext();) {
                    for (int i = 1; i <= params.size(); i++) {
                        String next = (String) iterator.next();
                        if (next.toString().startsWith("id_")) {
                             LOGGER.log(Level.INFO, methodStr + ">pase pstmt .posición "+i+" value " + next);
                            query_usuario +=  next + "=" + (int) params.get(next)+" AND " ;
                        } else {
                            LOGGER.log(Level.INFO, methodStr + ">pase pstmt entre lo demás.posición "+i+" campo "+ next+ " el valor "+ (String) params.get(next));
                            query_usuario +=  next + "=\'" + (String) params.get(next)+"\' AND ";
                        }
                    }
                }
                LOGGER.log(Level.INFO, methodStr + ">: > El columna.> " + columna);
                LOGGER.log(Level.INFO, methodStr + ">: > El query_.> " + query_usuario);
                query_usuario = query_usuario.substring(0, query_usuario.length() - 4);
                LOGGER.log(Level.INFO, methodStr + ">: > El query_.> " + query_usuario);
                id_usuario = recordManager.executeQueryToID(query_usuario, columna);
                //LOGGER.log(Level.FINEST, methodStr + ">Error: > El id_usuario.> " + id_usuario);
                if (id_usuario != null && id_usuario > 0) {
                    result = true;
                }
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
            }

        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, methodStr + "> Error: >Excepción al ejecutar el método. ", ex);
        }
        return result;
    }

    /**
     * public static void main(String args[]) {
     * separaNombreProyecto("CY1101019"); }
     */
}
