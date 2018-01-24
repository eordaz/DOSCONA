/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conacyt.utils;

import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author eordazga
 */
public class Utilerias {
    
    private static final String className = "Utilerias";
    private static final Logger LOGGER = Logger.getLogger("Utilerias");
    
     public void forEachByMap(HashMap map) {
        String methodStr = className + "::forEachByMap";
        for (Object key : map.keySet()) {
            LOGGER.log(Level.SEVERE, methodStr + ">Iterating or looping map using java5 foreach loop: " + methodStr);
            LOGGER.log(Level.SEVERE, methodStr + ">key: " + key + " value: " + map.get(key));

        }
    }
}
