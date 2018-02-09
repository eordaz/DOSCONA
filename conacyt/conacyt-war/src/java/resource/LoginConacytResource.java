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
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
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
    LoginConacytBeanLocal loginConacytBean = null;
    private static String className = "LoginConacytResource";
    private static final Logger LOGGER = Logger.getLogger("LoginConacytResource");


    /**
     * Creates a new instance of LoginConacytResource
     */
    public LoginConacytResource() {
        try {
            LOGGER.setLevel(Level.INFO);
            loginConacytBean = lookupLoginConacytBeanLocal();
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, className + "::LoginConacytResource>Error al instanciar el WS, bean no disponible. ", ex);
        }
    }

    /**
     * POST method for updating or creating an instance of LoginConacytResource
     *
     * @param method Método que será invocado.
     * @param json JSON de parámetros: {"param1_":"value1","param_2":"value_2"}
     * @return JSONObject {"campo1":"value1","campo2":"value2"}
     */
    @POST    
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject conacytPost(@PathParam("method") @DefaultValue("") String method, @FormParam("json") @DefaultValue("") String json) {
        return loginConacytResource(method, json);
    }

    /**
     * Método privado para realizar la invocación al bean de logica para la
     * ejecución de las funcionalidades requeridas para el login del usuario.
     *
     * @param method Método que será invocado.
     * @param json JSON de parámetros: {"param1_":"value1","param_2":"value_2"}
     * @return JSONObject {"campo1":"value1","campo2":"value2"}
     */
    private JSONObject loginConacytResource(String method, String json) {
        String methodStr = className + "::loginConacytResource";
        JSONObject result = null;

        // LOGGER.log(Level.WARNING, methodStr + ">params de tipo json "+json);
        try {
            if ((json != null && !json.isEmpty())
                    && (method != null && !method.isEmpty())) {                
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
