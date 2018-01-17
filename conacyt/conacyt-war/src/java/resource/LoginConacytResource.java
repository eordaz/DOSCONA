/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 13 de Enero del 2018   
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
 * @author eordazga
 */
@Path("conacyt/login/{method:.*}")
public class LoginConacytResource {


    @Context
    private UriInfo context;
    LoginConacytBeanLocal loginConacytBean = lookupLoginConacytBeanLocal();
    private static String className = "LoginConacytResource";
    private static final Logger LOGGER = Logger.getLogger("LoginConacytResource");

    /**
     * Creates a new instance of LoginConacytResource
     */
    public LoginConacytResource() {
    }

    /**
     * POST method for updating or creating an instance of LoginConacytResource
     * @param content representation for the resource
     */
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject conacytPost(@PathParam("method") @DefaultValue("") String method, @FormParam("json") @DefaultValue("{}") String json) {
        return loginConacytResource(method, json);
    }

    private JSONObject loginConacytResource(String method, String json) {
        String methodStr = className + "::conacytResource";
        JSONObject result = null;
        
        try {
            if ((json != null && !json.isEmpty())
                    && (method != null && !method.isEmpty())) {

                //JSONRecord params = new JSONRecord(json);                
                JSONObject params = JSONObject.fromObject(json);
                result = loginConacytBean.processMethod(method, params);
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
