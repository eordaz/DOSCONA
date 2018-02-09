/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resource;

import com.sun.jersey.multipart.FormDataParam;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.POST;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import net.sf.json.JSONObject;
import conacyt.beans.ExportarArchivosConacytBeanLocal;
import java.io.InputStream;
import javax.ws.rs.FormParam;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;

/**
 * REST Web Service
 *
 * @author vsanchez
 */
@Path("conacyt/archivos/exportarArchivo")
public class ExportarArchivosConacytResource {

    @Context
    private UriInfo context;
    private static String className = "ExportarArchivosConacytResource";
    private static final Logger LOGGER = Logger.getLogger("ExportarArchivosConacytResource");

    ExportarArchivosConacytBeanLocal exportarArchivosConacytBean = null;
    public static final String FILE_NAME = "proyecto_conacyt_";

    /**
     * Creates a new instance of CargaArchivosConacyt
     */
    public ExportarArchivosConacytResource() {
        try {
            LOGGER.setLevel(Level.FINEST);
            exportarArchivosConacytBean = lookupExportarArchivosConacytBeanLocal();
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, className + "::ExportarArchivosConacytResource>Error al instanciar el WS, bean no disponible. ", ex);
        }
    }

    /**
     * POST method for updating or creating an instance of
     * ExportarArchivosConacytResource
     *
     * @param method
     * @param fileName
     * @param request
     * @param response
     * @return
     * @throws java.io.IOException
     */
    @POST
    @Produces(MediaType.MULTIPART_FORM_DATA)    
    public Response  exportArchivoPost(@FormDataParam("file") InputStream uploadedInputStream,
            @FormParam("json")  String json) throws IOException {
//        return exportResource(method, params, req, res);
        return exportResource(uploadedInputStream, json);
    }

    private Response  exportResource(InputStream uploadedInputStream, String json) throws IOException {
   // private Response exportResource(String method, String params, Request file) throws IOException {
        String methodStr = className + "::exportResource";
        Response resArchivo = null;
        Response  resultJson = null;
        Object responseResult = null;
        String filename = null, ext = null;
        try {
//            if ((params != null)
//                    && (method != null && !method.isEmpty())) {
                //Se clonan en un JSON los parámetros originales.
                JSONObject fileDetail = JSONObject.fromObject(json);

//                filename = !json.getString("nombre_archivo").isEmpty() ? json.getString("nombre_archivo") : "proyecto_conacyt";
//                ext = !json.getString("ext").isEmpty() ? json.getString("ext") : "";

                resArchivo = exportarArchivosConacytBean.exportarArchivo(uploadedInputStream, fileDetail);
                if (resArchivo != null) {

//                    final ByteArrayOutputStream bf = (ByteArrayOutputStream) responseResult;
//                    StreamingOutput outputStream = new StreamingOutput() {
//                        @Override
//                        public void write(OutputStream output) throws IOException, WebApplicationException {
//                            bf.writeTo(output);
//                        }
//                    };
//                    resArchivo = Response.ok(outputStream, "application/octet-stream").header("Content-Disposition", "inline; filename=" + filename + ext).build();
                    resArchivo =Response.status(Response.Status.OK).build();
                } else {
                    resArchivo = Response.status(Response.Status.BAD_REQUEST).build();
                }
//            } else {
//                LOGGER.log(Level.WARNING, methodStr + ">Error: parámetro json nulo o vacío");
//            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + ">:: Problema en la identificación de Caso", e);
        }
        return resultJson;
    }

    private ExportarArchivosConacytBeanLocal lookupExportarArchivosConacytBeanLocal() {
        try {
            javax.naming.Context c = new InitialContext();
            return (ExportarArchivosConacytBeanLocal) c.lookup("java:global/conacyt/conacyt-ejb/ExportarArchivosConacytBean!conacyt.beans.ExportarArchivosConacytBeanLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

}
