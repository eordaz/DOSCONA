package com.unam.pu.conacyt.beans;

import java.sql.*;
import java.util.*;
import com.unam.pu.conacyt.db.Conexion;
import java.util.Date;
import java.text.SimpleDateFormat;

public class BeanDatosProyecto
{
/*
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub

	BeanConvenio convenioBean = new BeanConvenio();
	convenioBean.setId_proyecto(9);
	convenioBean.setId_auditoria(9);
	convenioBean.setClave_proyecto("9proyecto");
	convenioBean.setNombre("Proyecto");
	convenioBean.setId_fondo(1);
	
	
	System.out.println("Hola Mundo");
	int respuesta = registraContrato(convenioBean);

	}
*/
	/*
   public int agregarFolio( BeanFactura visitante ) throws Exception
	   {
	      Conexion conn = new Conexion();
		  String strSql = "";
		  int resultado=0,
				  salida=0;

		    Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    String strDate = sdf.format(date);

		  visitante.setEstatus("VIGENTE");
		  visitante.setIdFactura(consecutivoFact());
		  visitante.setIdProveedor(1);
		  visitante.setFechaF(visitante.getFechaF().substring(0, 10));
		  visitante.setTipo("FACTURA");
		  
		  if (visitante.getCfdiRfcEmisor().length()<7 ||
		      visitante.getCfdiRfcReceptor().length()<7 ) {
			  
		  } else {
			  
		  try
		  {
	         strSql = "INSERT INTO XXCPF_BPM_FACTURA (id, fecha, numero, rfc_receptor, nombre_receptor, rfc_emisor, "
	         		+ "nombre_emisor, iva, subtotal, total, creation_date, created_by, last_update_date, last_updated_by) " +
	                  "VALUES (" + visitante.getIdFactura() + ", " +
        							"TO_DATE('" + visitante.getFechaF() + "','YYYY-MM-DD'), '" +
	                  				visitante.getSerie() + " " + visitante.getFolio() + "', '" +
	                                visitante.getCfdiRfcReceptor() + "', '" +
	                                visitante.getNombreReceptor() + "', '" +
	                                visitante.getCfdiRfcEmisor() + "', '" +
	                                visitante.getNombreEmisor() + "', " +
	                                visitante.getIvaF() + ", " +
	                                visitante.getSubtotalF() + ", " +
	                                visitante.getImporteF() + ", " +
	                  				"TO_DATE('" + strDate + "','DD/MM/YYYY'), '" +
	                  				"portalValidacionFactura" + "', " +
	                  				"TO_DATE('" + strDate + "','DD/MM/YYYY'), '" +
	                  				"portalValidacionFactura" + "')";

	         System.out.println("Query de insercion: " + strSql);
	         resultado = conn.ejecutarQueryI(strSql);
		  }
		  catch(SQLException e)
		  {
				System.out.println("Fallo el metodo : " + e);
		  }
		 
		  } // if visitante length

		  if (resultado>0) {
			  salida= visitante.getIdFactura();
		  }
		  
		  return salida;

	}
*/
   public int registraContrato(BeanProyecto convenio ) throws Exception
   {
      Conexion conn = new Conexion();
	  String strSql = "";
	  int resultado=0,
			  salida=0;

	  Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	    String strDate = sdf.format(date);
       
/*	    
	  visitante.setEstatus("En revision");
	  visitante.setIdFactura(consecutivoContrato());
	  
	  if (visitante.getCfdiRfcEmisor().length()<7 ||
	      visitante.getCfdiRfcReceptor().length()<7 ) {
		  
	  } else {
	*/	  
	  try
	  {
         strSql = "INSERT INTO SPCGCONACYTDEV.dbo.Proyecto " +
        		 "(id_fondo, id_moneda, clave_proyecto, clave_recurso, nombre_proyecto,importe, fecha_inicio, fecha_fin, fecha_registro, fecha_actualizacion, usuario_id) " +
         		 //"(id_fondo, id_dependencia_proyecto, clave_proyecto, nombre_proyecto, importe, fecha_vig_ini, fecha_vig_fin, id_responsable_proyecto, id_auditoria, fecha_reg, fecha_act, usuario_id, id_moneda, clave_estatus) " + 
         		//"VALUES( 1, 1, ('987654'), ('TÉCNICAS DE ESTUDIO'), 12678.90, (getdate()),(getdate()), 1, 1, (getdate()), ('1900-01-01 00:00:00'), ((1)), ((1)), 'VI');\r\n" + 
                  "VALUES ('" + convenio.getId_fondo() + "', '" +
                  			convenio.getId_moneda() + "', '"+
                  			convenio.getClave_proyecto() + "', '" +
                  			convenio.getClave_recurso() + "', '"+
                  			convenio.getNombre_proyecto() + "', '"+
                  			convenio.getImporte() + "', "+
                  			"getdate()" + ", " +
                  			"getdate()" + ", " +
                  			"getdate()" + ", " +
                  			"getdate()" + ", '" +
                  			/*convenio.getFecha_inicio() + "', '"+
                  			convenio.getFecha_fin() + "', '"+
                  			convenio.getFecha_registro() + "', '"+
                  			convenio.getFecha_actualizacion() + "', '"+*/
                  			//convenio.getEstatus() + "', '"+
                  			convenio.getUsuario_id() +"')";
                  			/*convenio.getNombre_proyecto() + "', " +
                  			convenio.getImporte() + ", " +
                  			"getdate()" + ", " +
                  			"getdate()" + ", " +
                  			"1" + ", " +
                  			convenio.getId_auditoria() + ", " +
                  			"'1900-01-01 00:00:00'" + ", " +
                  			"'1900-01-01 00:00:00'" + ", " +
                  			"1"  + ", " +
                  			"1"  + ", " +
                  			"'VI'" + ") ";*/

         System.out.println("Query de insercion: " + strSql);
         resultado = conn.ejecutarQueryI(strSql);
	  }
	  catch(SQLException e)
	  {
			System.out.println("Fallo el metodo : " + e);
	  }
	 /*
	  } // if visitante length

	  if (resultado>0) {
		  salida= visitante.getIdFactura();
	  }
	  */
	  return salida;

}
   
   
   public List getListaDependencias() throws Exception
   {
      Conexion conn = new Conexion();
	  String strSql = "";
	  List Resultado = null;

	  try
	  {
		 strSql = "SELECT nombre_cat_dependencias FROM Cat_dependencias";
		 Resultado = conn.ejecutarQueryL(strSql);

	  }
	  catch(SQLException e)
	  {
			System.out.println("Dependencias: " + e);
	  }
      return Resultado;
   }
/*
   public List getListaObservaciones() throws Exception
   {
      Conexion conn = new Conexion();
	  String strSql = "";
	  List Resultado = null;

	  try
	  {
		 strSql = "SELECT nombre, paterno, email FROM IDENTIFICA";
		 Resultado = conn.ejecutarQueryL(strSql);

	  }
	  catch(SQLException e)
	  {
			System.out.println("Lista de Obs: " + e);
	  }
      return Resultado;
   }

   public BeanFactura getDTOFactura(String nupo) throws Exception
   {
	      Connection conexion =null;
	      Conexion conn = new Conexion();
		  String strSql = "";
	      ResultSet  lCursor;
	 		PreparedStatement lstm         = null; 
		    //ResultSet         lrst         = null; 
		    //ResultSet resultados = null;
		    conexion = conn.getConexion();

		    BeanFactura visitante = new BeanFactura();

		  try {
			 strSql = "SELECT id_observacion, id_tipo_observacion, fecha_registro, id_unidad_responsable, id_ubicacion, id_plaza_cobro, " +
	                  "carril_plaza_cobro, id_cuerpo_plaza_cobro, id_tramo, km_tramo, id_cuerpo_tramo, id_puente, km_puente, " +
	                  "id_cuerpo_puente, id_tipo_accidente, id_prioridad, observacion " +
			 		"FROM OBSERVACIONES.OBSERVACION " +
			 		"where folio = '" + nupo + "'";

	         //System.out.println("Este es INICIANDO buscando a folio: " + nupo);
		    lstm = conexion.prepareStatement(strSql); 
		    lCursor = lstm.executeQuery(); 
		     
		    if (lCursor.next()) { 


		         //visitante.setIdObservacion   		( lCursor.getInt("id_observacion") );
		         //System.out.println("Este  visitante.setIdObservacion: " +  visitante.getIdObservacion());

		         //visitante.setFolio  				( lCursor.getString("folio") == null ? "" : lCursor.getString("folio") );
		         //visitante.setFechaRegistro   	    ( lCursor.getString(4) == null ? "" : lCursor.getString(4) );
		         //visitante.setIdUnidadResponsable   ( lCursor.getInt(5) );
		         
		         visitante.setCarrilPlazaCobro 		( lCursor.getString(8) == null ? "" : lCursor.getString(8) );
		         visitante.setIdCuerpoPlazaCobro	( lCursor.getInt(9) );
		         visitante.setIdTramo   ( lCursor.getInt(10) );
		         visitante.setKmTramo 	   ( lCursor.getString(11) == null ? "" : lCursor.getString(11) );
		         visitante.setIdCuerpoTramo	   ( lCursor.getInt(12) );
		         visitante.setIdPuente  	   ( lCursor.getInt(13) );
		         visitante.setKmPuente	   ( lCursor.getString(14) == null ? "" : lCursor.getString(14) );
		         visitante.setIdCuerpoPuente   ( lCursor.getInt(15) );
		         visitante.setIdTipoAccidente  	   ( lCursor.getInt(16) );
		         visitante.setIdPrioridad        ( lCursor.getInt(17) );
		         visitante.setObservacion ( lCursor.getString(18) == null ? "" : lCursor.getString(18) );
	           
		         System.out.println("Este folio next del lCursor: " + lCursor.getString(3));
		         System.out.println("Este folio next del lCursor: " + lCursor.getString(4));
		         System.out.println("Este folio next del lCursor: " + lCursor.getString("id_ubicacion"));
		         System.out.println("Este folio next del lCursor: " + lCursor.getString("id_plaza_cobro"));
		         
		         
	         }
		    lCursor.close(); 
		    lstm.close(); 
	         
	     }
	     catch(SQLException err) {
	         System.out.println(err.getMessage());
	     }
		 System.out.println("Se devuelve DTO visitante: " + visitante);
		 return visitante;
   }

   public List getListaObservacion2(String nomb, String pate,String mate) throws Exception
   {
      Conexion conn = new Conexion();
	  String strSql = "";
	  List Resultado = null;

	  try
	  {
		 strSql = "SELECT nombre, paterno, materno, nacimiento, edad, calle, " +
 				  "numero, codigoPostal, delegacion, ciudad, estado, pais, " +
 				  "telCasa, telOficina, telCel, email, medicoRefiere, nup, colonia, sexo " +
		 		  "FROM IDENTIFICA " +
                  "where nombre like '%%' ";

            if (pate!=null && pate.length()>0)
               strSql = strSql + " and paterno like '%" + pate + "%' ";
            if (nomb!=null && nomb.length()>0)
               strSql = strSql + " and nombre like '%" + nomb + "%' ";
            if (mate!=null && mate.length()>0)
               strSql = strSql + " and materno like '%" + mate + "%' ";

		 Resultado = conn.ejecutarQueryL(strSql);
	  }
	  catch(SQLException e)
	  {
			System.out.println("Lista de Pacientes: " + e);
	  }
      return Resultado;
   }

   public ArrayList cargaListaObservaciones(String idUR) throws Exception
   {
      Conexion conn = new Conexion();
	  String strSql = "";
      ArrayList  Contenido  = new ArrayList(),
      			 arregloTmp;
      ResultSet  lCursor;
      String lsFolio = "",
             lsObservacion = "", 
             lsFechaRegistro = "",
             lsUR = "";

	  try
	  {
		 strSql = "SELECT folio, observacion, fecha_registro, id_unidad_responsable " +
		 		  "FROM OBSERVACION " +
                  "where id_unidad_responsable = " + idUR;
                  //"where nombre like '%%' ";

            if (pate!=null && pate.length()>0)
               strSql = strSql + " and paterno like '%" + pate + "%' ";
            if (nomb!=null && nomb.length()>0)
               strSql = strSql + " and nombre like '%" + nomb + "%' ";
            if (mate!=null && mate.length()>0)
               strSql = strSql + " and materno like '%" + mate + "%' ";
            if (tuto!=null && tuto.length()>0)
                strSql = strSql + " and tutor like '%" + tuto + "%' ";
            if (nupo!=null && nupo.length()>0)
                strSql = strSql + " and nup = " + nupo + " ";
            
         lCursor = conn.ejecutaQuery(strSql);

         while (lCursor.next() ) {
             arregloTmp = new ArrayList();
             lsFolio = lCursor.getString(1) == null ? "" : lCursor.getString(1);
             lsObservacion = lCursor.getString(2) == null ? "" : lCursor.getString(2);
             lsFechaRegistro = lCursor.getString(3) == null ? "" : lCursor.getString(3);
             lsUR = lCursor.getString(4) == null ? "" : lCursor.getString(4);
             arregloTmp.add(lsFolio);
             arregloTmp.add(lsObservacion);
             arregloTmp.add(lsFechaRegistro);
             arregloTmp.add(lsUR);
             Contenido.add(arregloTmp);
         }
         lCursor.close();
     }
     catch(SQLException err) {
         System.out.println(err.getMessage());
     }
     return Contenido;
   }
   
   public int consecutivoFact () throws Exception {

	    Connection conexion =null;
	    Conexion conn = new Conexion();
		String strSql = "";
		ResultSet  lCursor;
 		PreparedStatement lstm         = null; 
	    conexion = conn.getConexion();

		int nuevo = 0,
				res = 0;

		  try {
			 strSql = "select id from XXCPF_BPM_FACTURA order by id DESC";
			 lstm = conexion.prepareStatement(strSql); 
			 lCursor = lstm.executeQuery(); 
		    
			    if (lCursor.next()) { 

					 res = lCursor.getInt("id");
				     nuevo = (res+1);
			         System.out.println("cursor factura va en: ------ : " + lCursor);
			         
		         }
			    lCursor.close(); 
			    lstm.close(); 
	         
	     }
	     catch(Exception err) {
	         System.out.println(err.getMessage());
	     }
    
	     return nuevo;
   }

   public int consecutivoContrato () throws Exception {

	    Connection conexion =null;
	    Conexion conn = new Conexion();
		String strSql = "";
		ResultSet  lCursor;
		PreparedStatement lstm         = null; 
	    conexion = conn.getConexion();

		int nuevo = 0,
				res = 0;

		  try {
			 strSql = "select id from XXCPF_BPM_SOL_PAG_FACTURA_PROV order by id DESC";
			 lstm = conexion.prepareStatement(strSql); 
			 lCursor = lstm.executeQuery(); 
		    
			    if (lCursor.next()) { 

					 res = lCursor.getInt("id");
				     nuevo = (res+1);
			         System.out.println("cursor va en: ------ : " + lCursor);
			         
		         }
			    lCursor.close(); 
			    lstm.close(); 
	         
	     }
	     catch(Exception err) {
	         System.out.println(err.getMessage());
	     }
   
	     return nuevo;
  }

   public String isContrato (String contrato) throws Exception {

	    Connection conexion =null;
	    Conexion conn = new Conexion();
		String strSql = "";
		ResultSet  lCursor;
		PreparedStatement lstm         = null; 
	    conexion = conn.getConexion();
	    String sCursor="";
		String nuevo = "";

		  try {
			 strSql = "select numero from MAAG.CONTRATO " +
					 "where ESTATUS = 'activo' " +
					 "and NUMERO like '%" + contrato + "%'";
			 
			 System.out.println("query: ------ : " + strSql);
			 lstm = conexion.prepareStatement(strSql); 
			 lCursor = lstm.executeQuery(); 
		    
			    if (lCursor.next()) { 

					 sCursor = lCursor.getString("numero");
					 nuevo = sCursor;
			         //System.out.println("Si existe Contrato: ------ : " + sCursor);
			         
		         }
			    lCursor.close(); 
			    lstm.close(); 
	         
	     }
	     catch(Exception err) {
	         System.out.println(err.getMessage());
	     }
		  //System.out.println("Se devolverá contrato: ------ : " + nuevo);
	     return nuevo;
  }
   
   public int buscaIdContrato (String folio) throws Exception {

	    Connection conexion =null;
	    Conexion conn = new Conexion();
		String strSql = "";
		ResultSet  lCursor;
		PreparedStatement lstm         = null; 
	    conexion = conn.getConexion();

		int res = 0;

		  try {
			 strSql = "select id_contrato from CONTRATO " +
					 "where numero = '" + folio + "'";
			 lstm = conexion.prepareStatement(strSql); 
			 lCursor = lstm.executeQuery(); 
		    
			    if (lCursor.next()) { 

					 res = lCursor.getInt("id_contrato");
				     System.out.println("id_contrato obtenido : ------ : " + res);
			         
		         }
			    lCursor.close(); 
			    lstm.close(); 
	         
	     }
	     catch(Exception err) {
	         System.out.println(err.getMessage());
	     }

	     return res;
}

   public int updateForm (String folio) throws Exception {

	    Connection conexion =null;
	    Conexion conn = new Conexion();
		String strSql = "";
		PreparedStatement lstm         = null; 
	    conexion = conn.getConexion();

		int res = 0;

		  try {
			 strSql = "UPDATE XXCPF_BPM_SOL_PAG_FACTURA_PROV " +
					 	"SET ES_SOLICITUD_CREADA = '0' " +
					 "WHERE ID = " + folio;

			 System.out.println("query Update: ------ : " + strSql);

			 lstm = conexion.prepareStatement(strSql); 
			 res = lstm.executeUpdate(); 
            
	     }
	     catch(Exception err) {
	         System.out.println(err.getMessage());
	     }
	    lstm.close(); 

	     return res;
   }

   
   public ResultSet buscaAcciones (String clave) throws Exception {

	    Connection conexion =null;
	    Conexion conn = new Conexion();
		String strSql = "";
		ResultSet  lCursor = null;;
		PreparedStatement lstm         = null; 
	    conexion = conn.getConexion();

		  try {
			 strSql = "select FAC.NUMERO, SOL.ES_RECHAZADA, COM.COMENTARIO " +
		  "from XXCPF_BPM_SOL_PAG_FACTURA_PROV SOL, XXCPF_BPM_FACTURA FAC, XXCPF_BPM_COMENTARIO_SOL_P_FAC COM " +
		  "where SOL.ES_RECHAZADA = 1 " +
		  "and FAC.ID = SOL.ID_FACTURA " +
		  "and SOL.ID_FACTURA = COM.ID_SOLICITUD " +
		  "and SOL.NUMERO_CONTRATO = " + clave;
			 lstm = conexion.prepareStatement(strSql); 
			 lCursor = lstm.executeQuery(); 
	     }
	     catch(Exception err) {
	         System.out.println(err.getMessage());
	     }

	     return lCursor;
}
 
*/   
}
