/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 *
 * @author: Edith Corina Ordaz Garnica
 * @correo institucional: 
 * @correo personal: edith.ordaz@gmail.com
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

/**
 * REST Web Service
 *
 * @author gigi
 */
@Path("conacyt/{method:.*}")
public class CatalogosConacytResources {


    @Context
    private UriInfo context;
    CatalogosConacytBeanLocal catalogosConacytBean = lookupCatalogosConacytBeanLocal();   
    private static String className = "ConacytResources";
    private static final Logger LOGGER = Logger.getLogger("ConacytResources");

    /**
     * Creates a new instance of ConacytResource
     */
    /**public ConacytResources() {
        try {
            LOGGER.setLevel(Level.INFO);
            javax.naming.Context initialContext = new InitialContext();
            Object obj = initialContext.lookup("ejb/ConacytRegistroBeanLocal");
            if (obj != null) {
                //editionManager = (EditCollectionsBeanRemote) obj;
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, className + "::EditResources>Error al instanciar el WS, bean no disponible. ", ex);
        }
    }*/

    /**
     * Retrieves representation of an instance of resource.ConacytResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces("application/json")
    public JSONObject conacytGet(@PathParam("method") @DefaultValue("") String method, @QueryParam("json") String json) {
        return conacytResource(method, json);
    }

    /**
     * PUT method for updating or creating an instance of ConacytResource
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @POST
    @Produces("application/json")
    public JSONObject conacytPost(@PathParam("method") @DefaultValue("") String method, @FormParam("json") @DefaultValue("{}") String json) {
        return conacytResource(method, json);
    }
    
     /**
     * Método genérico, el cuál, establece la invocación del método sobre el
     * bean que contiene la implementación de la lógica de negocios.
     *
     * @param method nombre del método,de acuerdo al servicio invocado.
     * @param json Cadena de parámetros
     * @return response dependienso el tipo de objeto.
     */
    public JSONObject conacytResource(String method, String json) {
        String methodStr = className + "::conacytResource";
        JSONObject result = null;
        
        try {
            if ((json != null && !json.isEmpty())
                    && (method != null && !method.isEmpty())) {

                //JSONRecord params = new JSONRecord(json);                
                JSONObject params = JSONObject.fromObject(json);
                result = catalogosConacytBean.processMethod(method, params);

                //responseResult = csvcreator.getMultiCollCSVfromCDB(params); //oldie
//                responseResult = csvcreator.exportMultiColl(params);  //Nuevo método para control desde session Manager
               /** responseResult = conacytLocalBean.processMethod(method, params);
                LOGGER.log(Level.FINE, methodStr + ">  responseResult..." + responseResult);
                if (responseResult != null) {

                    if (responseResult instanceof String) {
                        filename = (String) responseResult;
                        
                        archivoCSV = Response.ok(filename, "plain/text").build();
                    } else if (responseResult instanceof File) {
                        csvf = (File) responseResult;

                        LOGGER.log(Level.FINE, methodStr + ">  archivo..." + csvf.getName());
//                                if (csvf != null && csvf.exists() && csvf.isFile() && csvf.canRead()) {
                        if (csvf.exists() && csvf.isFile() && csvf.canRead()) {

                            String mt = new MimetypesFileTypeMap().getContentType(csvf);
//                        LOGGER.log(Level.INFO, className + "::tipo  csvf.getName() >" + csvf.getName());//borrar
                            archivoCSV = Response.ok(csvf, mt).header("Content-Disposition", "inline; filename=" + csvf.getName()).build();
                            LOGGER.log(Level.FINE, methodStr + ">  archivo..." + csvf.getName());
                        } else {
                            LOGGER.log(Level.WARNING, className + ">Error: No es posible acceder al archivo" + csvf.getAbsolutePath());
//                        return null;
                        }
                    }
                } else {
                    LOGGER.log(Level.WARNING, methodStr + ">Error: el archivo no ha sido generado");
                }*/
            } else {
                LOGGER.log(Level.WARNING, methodStr + ">Error: parámetro json nulo o vacío");
            }
            LOGGER.log(Level.INFO, className + "::Proceso concluido... >");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, className + ">:: Problema en la identificación de Caso", e);
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
    