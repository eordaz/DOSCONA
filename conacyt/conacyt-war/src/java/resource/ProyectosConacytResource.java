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
import javax.ws.rs.DefaultValue;
import javax.ws.rs.FormParam;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.QueryParam;
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

    ProyectosConacytBeanLocal proyectosConacytBean = null;

    private static String className = "ProyectosConacytResources";
    private static final Logger LOGGER = Logger.getLogger("ProyectosConacytResources");

    /**
     * Creates a new instance of ProyectosConacytResource
     */
    public ProyectosConacytResource() {
        try {
            LOGGER.setLevel(Level.INFO);
            proyectosConacytBean = lookupProyectosConacytBeanLocal();
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, className + "::ProyectosConacytResource>Error al instanciar el WS, bean no disponible. ", ex);
        }

    }

    /**
     * Retrieves representation of an instance of
     * resource.CatalogosConacytResources
     *
     * @param method
     * @param json
     * @return an instance of java.lang.String
     */
    @GET
    @Produces("application/json")
    public JSONArray proyectosConacytGet(@PathParam("method") @DefaultValue("") String method, @QueryParam("json") String json) {
        return proyectosConacytResource(method, json);
    }

    /**
     * POST method for updating or creating an instance of
     * ProyectosConacytResource
     *
     * @param content representation for the resource
     */
    @POST
    @Produces("application/json")
    public JSONArray proyectosConacytPost(@PathParam("method") @DefaultValue("") String method, @FormParam("json") @DefaultValue("{}") String json) {
        return proyectosConacytResource(method, json);
    }

    private JSONArray proyectosConacytResource(String method, String json) {
        String methodStr = className + "::proyectosConacytResource";
        JSONArray result = null;

        // LOGGER.log(Level.WARNING, methodStr + ">params de tipo json "+json);
        try {
            if ((json != null && !json.isEmpty())
                    && (method != null && !method.isEmpty())) {

                //JSONRecord params = new JSONRecord(json);                
                JSONObject params = JSONObject.fromObject(json);
                result = proyectosConacytBean.processMethod(method, params);
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: parámetro json nulo o vacío");
            }
            LOGGER.log(Level.INFO, className + "::Proceso concluido... >");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + ">:: Problema en la identificación de Caso", e);
        }
        return result;
    }

    private ProyectosConacytBeanLocal lookupProyectosConacytBeanLocal() {
        try {
            javax.naming.Context c = new InitialContext();
            return (ProyectosConacytBeanLocal) c.lookup("java:global/conacyt/conacyt-ejb/ProyectosConacytBean!conacyt.beans.ProyectosConacytBeanLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

}
