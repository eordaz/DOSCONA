/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 26 de Enero del 2018   
 */
package resource;

import conacyt.beans.LoginConacytBeanLocal;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.FormParam;
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
 * @author Edith Corina Ordaz Garnica <edith.ordaz@patronato.unam.mx> <edith.ordaz@gmail.com>
 */
@Path("conacyt/usuarios/{method:.*}")
public class ConacytUsuariosResource {


    @Context
    private UriInfo context;

    LoginConacytBeanLocal usuariosConacytBean = null;
    private static String className = "ConacytUsuariosResource";
    private static final Logger LOGGER = Logger.getLogger("ConacytUsuariosResource");
    /**
     * Creates a new instance of ConacytUsuariosResource
     */
    public ConacytUsuariosResource() {
        try {
            LOGGER.setLevel(Level.INFO);
            usuariosConacytBean = lookupLoginConacytBeanLocal();
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, className + "::ConacytUsuariosResource>Error al instanciar el WS, bean no disponible. ", ex);
        }
    }

    /**
     * Retrieves representation of an instance of resource.CatalogosConacytResources
     * @param method
     * @param json
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject conacytGet(@PathParam("method") @DefaultValue("") String method, @QueryParam("json") String json) {
        return usuarioConacytResource(method, json);
    }
    
    /**
     * POST method for updating or creating an instance of ConacytUsuariosResource
     * @param content representation for the resource
     */
    @POST
   @Produces(MediaType.APPLICATION_JSON)
    public JSONObject postJson(@PathParam("method") @DefaultValue("") String method, @FormParam("json") @DefaultValue("") String json) {
        return usuarioConacytResource(method, json);
    }

    private JSONObject usuarioConacytResource(String method, String json) {
        String methodStr = className + "::loginConacytResource";
        JSONObject result = null;

        // LOGGER.log(Level.WARNING, methodStr + ">params de tipo json "+json);
        try {
            if ((json != null && !json.isEmpty())
                    && (method != null && !method.isEmpty())) {

                //JSONRecord params = new JSONRecord(json);                
                JSONObject params = JSONObject.fromObject(json);
                result =usuariosConacytBean.processMethod(method, params);
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: parámetro json nulo o vacío");
            }
            LOGGER.log(Level.INFO, className + "::Proceso concluido... >");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + ">:: Problema en la identificación de Caso", e);
        }
        return result;
    }

    private LoginConacytBeanLocal lookupLoginConacytBeanLocal() {
        try {
            javax.naming.Context c = new InitialContext();
            return (LoginConacytBeanLocal) c.lookup("java:global/conacyt/conacyt-ejb/LoginConacytBean!conacyt.beans.LoginConacytBeanLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
    
    
}
