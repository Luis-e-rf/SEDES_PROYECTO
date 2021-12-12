/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;
import Clases.TipoDocumento;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoTipoDocumento {
    
    private conexion conexion;
    private ResultSet  rs;
    private TipoDocumento TipoDocumento;
    
    
    public DaoTipoDocumento()
    {
     conexion = new conexion();
    }
    
    public boolean AgregarTipoDocumento(String nombre_tipo_documento,String descripcion_tipo_documento)
    {
     String Consulta = "insert into tipo_documento (nombre_tipo_documento,descripcion_tipo_documento) values ('"+nombre_tipo_documento+"','"+descripcion_tipo_documento+"');";
     System.out.println(Consulta);
     
     if (conexion.insertarDatos(Consulta))
     {
         conexion.desconectar();
            
         return true;
     }
     else
     {
         conexion.desconectar();
         
         return false;
     }
    }
    
    public boolean EliminarTipoDocumento (long id_tipo_documento)
    {
         String Consulta = " Delete from Tipo_documento where id_tipo_documento= "+id_tipo_documento +";";
         System.out.println(Consulta);
         
         if (conexion.eliminarDatos(Consulta))
         {
             conexion.desconectar();
             return true;
         }
         
         else 
         {
         conexion.desconectar();
         return false;
         }
    }
    
    public boolean ModificarTipoDocumento (long id_tipo_documento, String descripcion_tipo_documento)
    {
        String Consulta = "Update Tipo_documento set  descripcion_tipo_documento='"+descripcion_tipo_documento+"' where id_tipo_documento="+id_tipo_documento+";";
        System.out.println(Consulta);
        
        if (conexion.modificarDatos(Consulta))
        {
            conexion.desconectar();
            return true;
        }
        else
        {
            conexion.desconectar();
            return false;
        }
    }
    public ArrayList ListarTipoDocumento ()
        {
         
         ArrayList ListarTipoDocumento = new ArrayList ();
         
         String Consulta = "select * from Tipo_documento";
          System.out.println(Consulta);
         try
         {
             rs = conexion.seleccionarDatos(Consulta);
             while (rs.next())
                {
                TipoDocumento = new TipoDocumento();
                
                TipoDocumento.setId_tipo_documento(rs.getLong(1));
                TipoDocumento.setNombre_tipo_documento(rs.getString(2));
                TipoDocumento.setDescripcion_tipo_documento(rs.getString(3));
                
                
                ListarTipoDocumento.add(TipoDocumento);
                }
             conexion.desconectar();
             return ListarTipoDocumento;
         }
            catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
        }
    }
    
     public ArrayList ListarTipoDocumentoUnico (long id_tipo_documento)
        {
         
         ArrayList ListarTipoDocumento  = new ArrayList ();
         
         String Consulta = "select * from  Tipo_documento where id_tipo_documento ="+id_tipo_documento+""; 
          System.out.println(Consulta);
         try
         {
             rs = conexion.seleccionarDatos(Consulta);
             while (rs.next())
                {
                TipoDocumento = new TipoDocumento();
                
                TipoDocumento.setId_tipo_documento(rs.getLong(1));
                TipoDocumento.setNombre_tipo_documento(rs.getString(2));
                TipoDocumento.setDescripcion_tipo_documento(rs.getString(3));
                
                
                ListarTipoDocumento.add(TipoDocumento);
                }
             conexion.desconectar();
             return ListarTipoDocumento;
         }
            catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
        }
    }
}