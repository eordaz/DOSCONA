/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 13 de Enero del 2018   
 */
package conacyt.beans;

import conacyt.db.RecordManager;
import conacyt.utils.Utilerias;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.Iterator;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.Response;
import net.sf.json.JSONObject;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;

/**
 *
 * @author vsanchez
 */
@Stateless
public class ExportarArchivosConacytBean implements ExportarArchivosConacytBeanLocal {

    private static final String className = "ExportarArchivosConacytBean";
    private static final Logger LOGGER = Logger.getLogger("ExportarArchivosConacytBean");
    private static final ResourceBundle conacyt_cfg = ResourceBundle.getBundle("conacyt_cfg");
    RecordManager recordManager = null;

    /**
     * Constructor de la clase ExportarArchivosConacytBean.
     */
    public ExportarArchivosConacytBean() {
        try {
            LOGGER.setLevel(Level.FINEST);
            //recordManager = new RecordManager(conacyt_cfg.getString("datasource"));
//            LOGGER.setLevel(Level.WARNING);
//            LOGGER.setLevel(Level.INFO);
//            LOGGER.setLevel(Level.FINER);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + "::> Error al crear el objeto.", e);
        }

    }

    public JSONObject processMethod(String method, InputStream uploadedInputStream, String fileDetail) {
        String methodStr = className + "::processMethod";
        JSONObject result = null;
        try {
            if (method.equals("exportarArchivo")) {
                //result = exportarArchivo(uploadedInputStream, fileDetail);
            } else if (method.equals("insertOrUpdateArchivo")) {
//                result = insertOrUpdateArchivo(method);
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: método desconocido.");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + ">:: Problema en la identificación de Caso", e);
        }
        return result;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @Override
    public Response exportarArchivo(InputStream uploadedInputStream, JSONObject fileDetail) {
        String methodStr = className + "::exportarArchivo";
        Response response = null;
        byte[] content;
        OutputStream sos = null;
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String filename = null, ext = null, nombre = null, respuesta = null, name = null;
        try {
            LOGGER.log(Level.FINE, methodStr + ">Ingresé: >.");
//            if (params != null && !params.isEmpty()) {
//                JSONObject json_prams = JSONObject.fromObject(params);
//                filename = !json_prams.getString("nombre_archivo").isEmpty() ? json_prams.getString("nombre_archivo") : "proyecto_conacyt";
//                ext = !json_prams.getString("ext").isEmpty() ? json_prams.getString("ext") : "";
//                nombre = filename + ext;
//                LOGGER.log(Level.FINE, methodStr + ">Nombre del archivo: >." + nombre);
            ///EJEMPLO  3---------------------------------------------------------

            // uploads a file
            // check if all form parameters are provided
            if (uploadedInputStream == null || fileDetail == null) {
                LOGGER.log(Level.FINE, methodStr + ">Invalid form data >.");
                response = Response.status(400).entity("Invalid form data").build();
            }
            // create our destination folder, if it not exists
            try {
                createFolderIfNotExists(conacyt_cfg.getString("directorio"));
            } catch (SecurityException se) {
                LOGGER.log(Level.FINE, methodStr + ">Can not create destination folder on server.");
                response = Response.status(500)
                        .entity("Can not create destination folder on server")
                        .build();
            }
            String uploadedFileLocation = conacyt_cfg.getString("directorio") + fileDetail.getString("nombre_archivo");
            try {
                saveToFile(uploadedInputStream, uploadedFileLocation);

                LOGGER.log(Level.FINE, methodStr + ">respuesta: >." + "File saved to " + uploadedFileLocation);
            } catch (IOException e) {
                LOGGER.log(Level.FINE, methodStr + ">Can not save file.");
                respuesta = "File saved to " + uploadedFileLocation;
                response = Response.status(500).entity("Can not save file").build();
            }

//            } else {
//                result = new JSONObject().accumulate("exportarArchivo", "-1").accumulate("mensaje", "Los parámetros que envía son nulos o vacíos.");
//                LOGGER.log(Level.WARNING, methodStr + ">Error: > Los parámetros que envía son nulos o vacíos.");
//            }
            response = Response.status(200).entity("File saved to " + uploadedFileLocation).build();
        } catch (Exception ex) {
//            result = new JSONObject().accumulate("exportarArchivo", "-1").accumulate("mensaje", "Excepción al ejecutar el método. " + ex);
            LOGGER.log(Level.SEVERE, methodStr + "Error: >Excepción al ejecutar el método. ", ex);
        }
        return response;
    }

    private JSONObject insertOrUpdateArchivo(JSONObject params) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     * Utility method to save InputStream data to target location/file
     *
     * @param inStream - InputStream to be saved
     * @param target - full path to destination file
     */
    private void saveToFile(InputStream inStream, String target)
            throws IOException {
        String methodStr = className + "::saveToFile";
        LOGGER.log(Level.SEVERE, methodStr + " >inStream. " + inStream.available());
        OutputStream out = null;
        int read = 0;
        byte[] bytes = new byte[1024];
        out = new FileOutputStream(new File(target));
        while ((read = inStream.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }
        inStream.close();
        out.flush();
        out.close();
        LOGGER.log(Level.SEVERE, methodStr + "inStream. salí");
    }

    /**
     * Creates a folder to desired location if it not already exists
     *
     * @param dirName - full path to the folder
     * @throws SecurityException - in case you don't have permission to create
     * the folder
     */
    private void createFolderIfNotExists(String dirName)
            throws SecurityException {
        File theDir = new File(dirName);
        if (!theDir.exists()) {
            theDir.mkdir();
        }
    }

}
