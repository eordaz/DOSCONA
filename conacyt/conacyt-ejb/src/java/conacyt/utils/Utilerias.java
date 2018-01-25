/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.utils;

import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    /**public static void main(String args[]) {
        separaNombreProyecto("CY1101019");
    }*/
}
