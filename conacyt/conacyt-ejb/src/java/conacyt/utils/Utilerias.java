/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.utils;

import conacyt.entityObject.ProyectoEntidad;
import conacyt.entityObject.UsuarioEntidad;
import java.util.HashMap;
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
        String clave_recurso = null,clave_proyecto=null;
        try {
            clave_recurso = nombre.substring(0, 2);
            clave_proyecto = nombre.substring(2,nombre.length());
            nombreProyecto.accumulate("clave_recurso", clave_recurso).accumulate("clave_proyecto", clave_proyecto);

            //LOGGER.log(Level.INFO, methodStr + ">nombreProyecto: " + nombreProyecto);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, methodStr + ">Error: " + e);
        }
        return nombreProyecto;
    }            
    
    public static Object parseFromJSONArraytoObject(JSONArray array_orig) {
        String methodStr = className + "::parseFromJSONtoObject";
        JSONArray array_param = new JSONArray();
        Object objetoEntidad = new Object();
        
//        try {
            //Recorremos el Array
           
//            for (int i = 0; i < array_orig.size(); i++)
//            {
                //Obtenermos los objetos de la posición i
//                JSONObject object = (JSONObject)array.get(i);
          // System.out.println("Objeto  de Proyecto Entitty" + object.getInt("id_fondo"));
                
//                p.setId_fondo(object.getInt("id_fondo"));
//                p.setId_moneda(object.getInt("id_moneda"));
//                p.setId_recurso(object.getInt("id_moneda"));
//                p.setClave_proyecto(object.getString("clave_proyecto"));
//                p.setNombre_proyecto(object.getString("nombre_proyecto"));
//                p.setId_cat_dependencia(object.getInt("id_cat_dependencia"));
//                p.setImporte(object.getDouble("importe"));
//                p.setEstatus(object.getString("estatus"));
//                p.setUsuario_id(object.getInt("usuario_id"));
           
//            }
//
//           System.out.println("Objeto  de Proyecto Entitty" + p.toString());
//            //LOGGER.log(Level.INFO, methodStr + ">nombreProyecto: " + nombreProyecto);
//        } catch (Exception e) {
//            LOGGER.log(Level.SEVERE, methodStr + ">Error: " + e);
//        }
        return objetoEntidad;
    }            

    /**public static void main(String args[]) {
        separaNombreProyecto("CY1101019");
    }*/
}
