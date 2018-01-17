/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 12 de Enero del 2018   
 */

package conacyt.beans;

import java.util.logging.Level;
import javax.ejb.Local;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Interface local para la publicación de los servicios encargados de las 
 * operaciones de los catálogos.
 * 
 * @author Edith Corina Ordaz Garnica <edith.ordaz@patronato.unam.mx> <edith.ordaz@gmail.com> 
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
     * @return Regresa un JSONArray con la respuesta dependiendo del servicio
     * que haya sido invocado.
     */
    public abstract JSONArray processMethod(String method, JSONObject params);
}
