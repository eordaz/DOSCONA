/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resource;

import conacyt.beans.ProyectosConacytBeanLocal;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.FormParam;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * REST Web Service
 *
 * @author vsanchez
 */
@Path("conacyt/proyectos/{method:.*}")
public class ProyectosConacytResource {

    

    @Context
    private UriInfo context;

    
    private static String className = "ProyectosConacytResources";
    private static final Logger LOGGER = Logger.getLogger("ProyectosConacytResources");
    /**
     * Creates a new instance of ProyectosConacytResource
     */
    public ProyectosConacytResource() {
            try {
            LOGGER.setLevel(Level.INFO);
           
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, className + "::CatalogosConacytResources>Error al instanciar el WS, bean no disponible. ", ex);
    }

        
    }


    /**
     * PUT method for updating or creating an instance of ProyectosConacytResource
     * @param content representation for the resource
     */
    @POST
    @Produces("application/json")
    public JSONObject conacytPost(@PathParam("method") @DefaultValue("") String method, @FormParam("json") @DefaultValue("{}") String json) {
        return proyectosConacytResource(method, json);
    }
     private JSONObject proyectosConacytResource(String method, String json) {
        String methodStr = className + "::proyectosConacytResource";
        JSONObject result = null;

        // LOGGER.log(Level.WARNING, methodStr + ">params de tipo json "+json);
        try {
            if ((json != null && !json.isEmpty())
                    && (method != null && !method.isEmpty())) {

                //JSONRecord params = new JSONRecord(json);                
                JSONObject params = JSONObject.fromObject(json);
                //result = proyectosConacytBean.processMethod(method, params);
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: parámetro json nulo o vacío");
            }
                LOGGER.log(Level.INFO, className + "::Proceso concluido... >");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + ">:: Problema en la identificación de Caso", e);
        }
        return result;
    }
}
            
