/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 12 de Enero del 2018   
 */
package conacyt.beans;

import java.io.FileInputStream;
import java.io.InputStream;
import javax.ejb.Local;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Response;
import net.sf.json.JSONObject;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;

/**
 *
 * @author vsanchez
 */
@Local
public interface ExportarArchivosConacytBeanLocal {
     /**
     * Proceso mediante el cuál se invocan servicios para el registro, edición
     * y actualización de proyectos CONACYT, dependiendo del método que sea invocado.
     * 
     * @param method Nombre del servicio que será invocado.
     * @param params JSON con los parámetros de entrada necesarios para el
     * servicio que fue invocado.
     * @param request
     * @param response
     * @return Regresa un JSONArray con la respuesta dependiendo del servicio
     * que haya sido invocado.
     */
    public abstract Response exportarArchivo(InputStream uploadedInputStream, JSONObject fileDetail);
}
