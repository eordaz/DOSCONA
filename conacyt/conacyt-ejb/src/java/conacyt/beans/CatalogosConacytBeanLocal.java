/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package conacyt.beans;

import java.util.logging.Level;
import javax.ejb.Local;
import net.sf.json.JSONObject;

/**
 *
 * @author gigi
 */
@Local
public interface CatalogosConacytBeanLocal {
    /**
     * Obtiene el nivel que se le dará a los mensajes.
     * @param level ya sea INFO,FINER, FINEST,SEVERE.
     */
    void setLoggerLevel(Level level);

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
    public abstract JSONObject processMethod(String method, JSONObject params);
}
