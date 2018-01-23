/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resource;

import conacyt.beans.CargaArchivosConacytBeanLocal;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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

/**
 * REST Web Service
 *
 * @author vsanchez
 */
@Path("conacyt/archivos/{method:.*}")
public class CargaArchivosConacytResource {


    @Context
    private UriInfo context;   
    private static String className = "CargaArchivosConacytResource";
    private static final Logger LOGGER = Logger.getLogger("CargaArchivosConacytResource");
    CargaArchivosConacytBeanLocal cargaArchivosConacytBean = null;

    /**
     * Creates a new instance of CargaArchivosConacyt
     */
    public CargaArchivosConacytResource() {
        try{
            LOGGER.setLevel(Level.FINER);
            cargaArchivosConacytBean = lookupCargaArchivosConacytBeanLocal();
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, className + "::CargaArchivosConacytResource>Error al instanciar el WS, bean no disponible. ", ex);
        }
    }

    /**
     * POST method for updating or creating an instance of CargaArchivosConacytResource
     * @param method
     * @param fileName
     * @param request
     * @param response
     * @return 
     * @throws java.io.IOException 
     */
    @POST
    @Produces(MediaType.MULTIPART_FORM_DATA)
    public Response postCarga(@PathParam("method") @DefaultValue("") String method,
           @PathParam("file")  File fileName,
           @Context HttpServletRequest request,
           @Context HttpServletResponse response
            ) throws IOException {
        return cargaResource(method, fileName, request, response);
    }
    
     private Response cargaResource(String method,File fileName,HttpServletRequest request, HttpServletResponse response) throws IOException {
       String methodStr = className + "::cargaResource";
       Response res = null;
        JSONObject result = null;
                LOGGER.log(Level.WARNING, methodStr + ">A ver: "+ " method:>"+ request.getMethod()+ " ContextPath:> " + request.getContextPath());
        
        try {
            if ((fileName != null && !fileName.exists())
                    && (method != null && !method.isEmpty())) {
                
                LOGGER.log(Level.WARNING, methodStr + ">A ver: "+ " request:>"+ request.getContextPath());
                LOGGER.log(Level.WARNING, methodStr + ">A ver: "+ " request:>"+ request.getMethod());
                
                LOGGER.log(Level.WARNING, methodStr + ">A ver: "+ " response:>"+ response.getBufferSize());
                LOGGER.log(Level.WARNING, methodStr + ">A ver fileName : "+fileName+ " method:>"+ response.getHeaderNames());
                 result = cargaArchivosConacytBean.processMethod(method,fileName);
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: parámetro json nulo o vacío");
            }
        }  catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + ">:: Problema en la identificación de Caso", e);
        }
        return res;
    }

     
     
    private CargaArchivosConacytBeanLocal lookupCargaArchivosConacytBeanLocal() {
        try {
            javax.naming.Context c = new InitialContext();
            return (CargaArchivosConacytBeanLocal) c.lookup("java:global/conacyt/conacyt-ejb/CargaArchivosConacytBean!conacyt.beans.CargaArchivosConacytBeanLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

   
    
    
}
