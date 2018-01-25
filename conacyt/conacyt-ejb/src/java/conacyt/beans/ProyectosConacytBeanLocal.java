/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.beans;

import javax.ejb.Local;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Interface local para la publicación de los servicios encargados de las 
 * operaciones del login.
 *
 * @author vsanchez
 */
@Local
public interface ProyectosConacytBeanLocal {
    /**
     * Proceso mediante el cuál se invocan servicios para el registro, edición
     * y actualización de proyectos CONACYT, dependiendo del método que sea invocado.
     * 
     * @param method Nombre del servicio que será invocado.
     * @param params JSON con los parámetros de entrada necesarios para el
     * servicio que fue invocado.
     * @return Regresa un JsonObject con la respuesta dependiendo del servicio
     * que haya sido invocado.
     */
    public abstract JSONArray processMethod(String method, JSONObject params);
}
