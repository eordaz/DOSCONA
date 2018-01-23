/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 12 de Enero del 2018   
 */
package conacyt.beans;

import java.io.File;
import javax.ejb.Local;
import net.sf.json.JSONObject;

/**
 *
 * @author vsanchez
 */
@Local
public interface CargaArchivosConacytBeanLocal {
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
    public abstract JSONObject processMethod(String method, File file);
}
