package com.unam.pu.conacyt.beans;
import java.awt.Desktop;

import java.io.File;
import java.io.IOException;




public class BeanArchivo {

	//public static void main(String[] args) {
	public void cargarArchivo(String opcion,String archivo) {
		if (opcion == "abrir")
		{	abrirArchivo(archivo);}
		else 
		 {
			guardarArchivo();
		 }
		
		
	}
	
	private void abrirArchivo(String archivo) {
		//ruta del archivo en el pc
	/*  File directorio = new File("prueba.pdf");
	  try{ 	
	  Desktop.getDesktop().open(directorio);
	  Desktop d;
	  
	  
		  
	  }catch(IOException e){
	     e.printStackTrace();
	  }catch(IllegalArgumentException e){
	     JOptionPane.showMessageDialog(null, "No se pudo encontrar el archivo","Error",JOptionPane.ERROR_MESSAGE);
	     e.printStackTrace();
	 } */ 
		

		   try {
			      Desktop desktop = null;
			      if (Desktop.isDesktopSupported()) {
			        desktop = Desktop.getDesktop();
			      }
			      
			       desktop.open(new File(archivo));
			    } catch (IOException ioe) {
			      ioe.printStackTrace();

			    }
		
	}
	
	

		// Se crea el File del directorio
		//File directorio = new File("src/main/java/com/chuidiang/ejemplos/");
		//File directorio = new File("img/prueba");
		
		// Si es un directorio
		/*if (directorio.isDirectory()) {
			 obtenemos su contenido
			File[] ficheros = directorio.listFiles();
			 y lo sacamos por pantalla
			for (File fichero : ficheros)
				System.out.println(fichero.getName());
		}*/
		
	private void guardarArchivo() {	
		
		
		
	}	
		
	//}
}


