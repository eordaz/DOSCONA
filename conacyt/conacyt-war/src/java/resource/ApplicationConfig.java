/*
 * Patronato Universitario
 * Universidad Nacional Autónoma de México
 * 
 * @Date 12 de Enero del 2018   
 */

package resource;

import java.util.Set;
import javax.ws.rs.core.Application;

/**
 *
 * @author gigi
 */
@javax.ws.rs.ApplicationPath("resources")
public class ApplicationConfig extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        addRestResourceClasses(resources);
        return resources;
    }

    /**
     * Do not modify addRestResourceClasses() method.
     * It is automatically populated with
     * all resources defined in the project.
     * If required, comment out calling this method in getClasses().
     */
    private void addRestResourceClasses(Set<Class<?>> resources) {
        resources.add(resource.CargaArchivosConacytResource.class);
        resources.add(resource.CatalogosConacytResources.class);
        resources.add(resource.LoginConacytResource.class);
        resources.add(resource.ProyectosConacytResource.class);
    }
    
}
