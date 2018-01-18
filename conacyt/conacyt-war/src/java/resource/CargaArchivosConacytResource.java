/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resource;

import conacyt.beans.CargaArchivosConacytBeanLocal;
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
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
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
     * Retrieves representation of an instance of resource.CargaArchivosConacytResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject getCarga(@PathParam("method") @DefaultValue("") String method, @QueryParam("json") String json) {
        return cargaResource(method, json);
    }

    /**
     * POST method for updating or creating an instance of CargaArchivosConacytResource
     * @param content representation for the resource
     */
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject postCarga(@PathParam("method") @DefaultValue("") String method, @FormParam("json") @DefaultValue("{}") String json) {
        return cargaResource(method, json);
    }
    
     private JSONObject cargaResource(String method, String json) {
       String methodStr = className + "::cargaResource";
        JSONObject result = null;
        
        try {
            if ((json != null && !json.isEmpty())
                    && (method != null && !method.isEmpty())) {
                 JSONObject params = JSONObject.fromObject(json);
                 result = cargaArchivosConacytBean.processMethod(method, params);
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
