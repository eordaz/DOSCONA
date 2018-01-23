/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 12 de Enero del 2018   
 */

package resource;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.FormParam;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import net.sf.json.JSONObject;
import conacyt.beans.CatalogosConacytBeanLocal;
import net.sf.json.JSONArray;

/**
 * REST Web Service
 *
 * @author Edith Corina Ordaz Garnica <edith.ordaz@patronato.unam.mx> <edith.ordaz@gmail.com>
 */
@Path("conacyt/catalogos/{method:.*}")
public class CatalogosConacytResources {


    @Context
    private UriInfo context;
    CatalogosConacytBeanLocal catalogosConacytBean = null;   
    private static String className = "CatalogosConacytResources";
    private static final Logger LOGGER = Logger.getLogger("CatalogosConacytResources");

    /**
     * Creates a new instance of CatalogosConacytResources
     */
    public CatalogosConacytResources() {
        try {
            LOGGER.setLevel(Level.INFO);
            catalogosConacytBean = lookupCatalogosConacytBeanLocal(); 
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, className + "::CatalogosConacytResources>Error al instanciar el WS, bean no disponible. ", ex);
        }
    }

    /**
     * Retrieves representation of an instance of resource.CatalogosConacytResources
     * @param method
     * @param json
     * @return an instance of java.lang.String
     */
    @GET
    @Produces("application/json")
    public JSONArray conacytGet(@PathParam("method") @DefaultValue("") String method, @QueryParam("json") String json) {
        return catalogosConacytResource(method, json);
    }

    /**
     * POST method for updating or creating an instance of CatalogosConacytResources
     * @param method
     * @param json
     * @return an HTTP response with content of the updated or created resource.
     */
    @POST
    @Produces("application/json")
    public JSONArray conacytPost(@PathParam("method") @DefaultValue("") String method, @FormParam("json") @DefaultValue("{}") String json) {
        return catalogosConacytResource(method, json);
    }
    
     /**
     * Método genérico, el cuál, establece la invocación del método sobre el
     * bean que contiene la implementación de la lógica de negocios.
     *
     * @param method nombre del método,de acuerdo al servicio invocado.
     * @param json Cadena de parámetros
     * @return response dependienso el tipo de objeto.
     */
    public JSONArray catalogosConacytResource(String method, String json) {
        String methodStr = className + "::catalogosConacytResource";
        JSONArray result = null;
        
        try {
            if ((json != null && !json.isEmpty())
                    && (method != null && !method.isEmpty())) {
                            
                JSONObject params = JSONObject.fromObject(json);
                result = catalogosConacytBean.processMethod(method, params);
                
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: parámetro json nulo o vacío");
            }
            //LOGGER.log(Level.INFO, className + "::Proceso concluido... >");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + ">Error:: Problema en la identificación de Caso", e);
        }
        return result;
    }

    private CatalogosConacytBeanLocal lookupCatalogosConacytBeanLocal() {
        try {
            javax.naming.Context c = new InitialContext();
            return (CatalogosConacytBeanLocal) c.lookup("java:global/conacyt/conacyt-ejb/CatalogosConacytBean!conacyt.beans.CatalogosConacytBeanLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

         
}
    