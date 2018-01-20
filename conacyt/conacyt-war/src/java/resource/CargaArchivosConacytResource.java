/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resource;

import conacyt.beans.CargaArchivosConacytBeanLocal;
import java.io.File;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.FormParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
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
@Path("conacyt/carga/{method:.*}")
public class CargaArchivosConacytResource {


    @Context
    private UriInfo context;   
    private static String className = "CargaArchivosConacytResource";
    private static final Logger LOGGER = Logger.getLogger("CargaArchivosConacytResource");
    CargaArchivosConacytBeanLocal cargaArchivosConacytBean = lookupCargaArchivosConacytBeanLocal();

    /**
     * Creates a new instance of CargaArchivosConacyt
     */
    public CargaArchivosConacytResource() {
    }

    /**
     * POST method for updating or creating an instance of CargaArchivosConacytResource
     * @param content representation for the resource
     */
    @POST
    @Produces(MediaType.MULTIPART_FORM_DATA)
    public JSONObject postCarga(@PathParam("method") @DefaultValue("") String method,
            @FormParam("file") File uploadedInputStream
            ) {
        return cargaResource(method, uploadedInputStream);
    }
    
     private JSONObject cargaResource(String method, File uploadedInputStream) {
       String methodStr = className + "::cargaResource";
        JSONObject result = null;
        
        
        try {
            if ((uploadedInputStream != null)
                    && (method != null && !method.isEmpty())) {
                
                 result = cargaArchivosConacytBean.processMethod(method, uploadedInputStream);
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: parámetro json nulo o vacío");
            }
        }  catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + ">:: Problema en la identificación de Caso", e);
        }
        return result;
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
