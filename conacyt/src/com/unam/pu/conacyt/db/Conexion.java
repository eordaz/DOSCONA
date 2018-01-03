package com.unam.pu.conacyt.db;

import java.sql.*;
import java.util.*;

public class Conexion
{

   private Connection conexion = null;
 
   public Connection getConexion() throws Exception
   {

       try {
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conexion = DriverManager.getConnection("jdbc:sqlserver://192.168.29.81:1433;databaseName=", "conacyt", "c0n4cyt$");
         System.out.println("Conectado a la Base...");

      }
      catch(ClassNotFoundException e)
      {
        System.out.println("ClassNotFoundException generada");
        e.printStackTrace();
      }
      catch(SQLException e)
      {
        System.out.println("SQLException generada");
        e.printStackTrace();
      }
      return conexion;
   }

   public void cerrarConexion(Connection con) throws Exception
   {
		if( con != null)
		{
		   try
		   {
			  if(!con.isClosed())
			  {
			     con.close();
			     System.out.println("**************** Conexion cerrada *********************");
		      }
		   }
  		   catch ( SQLException excepcionSQL )
  		   {
              System.out.println("*** No se pudo cerrar la conexión ***");
              excepcionSQL.printStackTrace();
           }
	    }
   }

   public int ejecutarQueryI(String query)throws Exception{

		int resultado;
		Connection con = null;
		try{
			con = getConexion();
			PreparedStatement pstmt = con.prepareStatement(query);
			resultado = pstmt.executeUpdate();
			   if(resultado > 0)
				    System.out.println("Se inserto el registro con exito");
				   else
				    System.out.println("Ocurrio un error en la insercion a la base");
				   con.close();
			}
		catch(SQLException sqlE){
			try{
				con.rollback();
			} catch(SQLException sqlEroll) {
				throw new SQLException("Error al realizar rollback: " + sqlEroll);
			}
			throw new SQLException("Error al ejecutar query: " + sqlE+"\n query: "+query);
		}catch(Exception namE){
			throw new SQLException("No se pudo ejecutar el query: " + namE);
		}finally{
			cerrarConexion(con);
		}
		return resultado;
	}
  

   public List ejecutarQueryL(String query) throws Exception
    {

		Connection con = null;
        List Contenido = new ArrayList();

		try
		{
			con = getConexion();
	        ResultSet resultados;

			PreparedStatement pstmt = con.prepareStatement(query);
			resultados = pstmt.executeQuery();

		      while ( resultados.next() )
		      {
/*
		         visitante.setNombre   		( resultados.getString(1) == null ? "" : resultados.getString(1) );
		         visitante.setPaterno  		( resultados.getString(2) == null ? "" : resultados.getString(2) );
		         visitante.setMaterno  		( resultados.getString(3) == null ? "" : resultados.getString(3) );
		         visitante.setNacimiento   	( resultados.getString(4) == null ? "" : resultados.getString(4) );
		         visitante.setEdad 			( resultados.getInt(5) );
		         visitante.setCalle  		( resultados.getString(6) == null ? "" : resultados.getString(6) );
		         visitante.setNumero 		( resultados.getString(7) == null ? "" : resultados.getString(7) );
		         visitante.setCodigoPostal	( resultados.getInt(8) );
		         visitante.setDelegacion    ( resultados.getString(9) == null ? "" : resultados.getString(9) );
		         visitante.setCiudad 	   ( resultados.getString(10) == null ? "" : resultados.getString(10) );
		         visitante.setEstado	   ( resultados.getString(11) == null ? "" : resultados.getString(11) );
		         visitante.setPais  	   ( resultados.getString(12) == null ? "" : resultados.getString(12) );
		         visitante.setTelCasa	   ( resultados.getString(13) == null ? "" : resultados.getString(13) );
		         visitante.setTelOficina   ( resultados.getString(14) == null ? "" : resultados.getString(14) );
		         visitante.setTelCel  	   ( resultados.getString(15) == null ? "" : resultados.getString(15) );
		         visitante.setEmail        ( resultados.getString(16) == null ? "" : resultados.getString(16) );
		         visitante.setMedicoRefiere( resultados.getString(17) == null ? "" : resultados.getString(17) );
		         visitante.setNup  		   ( resultados.getInt(18) );
		         visitante.setColonia	   ( resultados.getString(19) == null ? "" : resultados.getString(19) );
		         visitante.setSexo  	   ( resultados.getString(20) == null ? "" : resultados.getString(20) );
*/
		         //Contenido.add( visitante );
              }

        }
        catch(SQLException err)
        {
            System.out.println("SQL Error: " + err);
        }
        finally
        {
            cerrarConexion(con);
        }

        return Contenido;
    }

   
   public ResultSet ejecutaQuery(String query) throws Exception
   {
		//Connection con = null;
		/*
	   Statement stmt = null;
		ResultSet resultados = null;
        System.out.println("Query que ejecutara: " + query);
        
		try {
			conexion = getConexion();
			//stmt = conexion.createStatement();
			stmt = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				   ResultSet.CONCUR_READ_ONLY);
			
			resultados = stmt.executeQuery(query);
		}
        catch(SQLException err) {
           System.out.println("SQL Error en Conexion.java: " + err);
        }
        finally {
            //stmt.close();
        	//cerrarConexion(conexion);
        }
		*/
		PreparedStatement lstm         = null; 
	    ResultSet         lrst         = null; 
	    //ResultSet resultados = null;
	    conexion = getConexion();
	    
	    lstm = conexion.prepareStatement(query); 
	    lrst = lstm.executeQuery(); 
	     
	    //El 'next' hay que hacerlo en un 'if' o 'while'  
	    //para asegurar que hay registro 
	    if (lrst.next()) { 
	        //Leer el registro 
	         System.out.println("Este folio next del conexion: " + lrst.getString("id_observacion"));
	         System.out.println("Este folio next del conexion: " + lrst.getString("id_tipo_observacion"));
	         System.out.println("Este folio next del conexion: " + lrst.getString(3));
	         System.out.println("Este folio next del conexion: " + lrst.getString(4));

	    } 
	    lrst.close(); 
	    lstm.close(); 
	    
		System.out.println("REsulset que se devuelve: " + lrst);
		return lrst;
   }
   
   private static String eliminaNulo(String dato)
	{
		if(dato == null)
			dato = "";
		if(dato.equalsIgnoreCase("NULL"))
			dato = "";
		return dato.trim();
	}


}
