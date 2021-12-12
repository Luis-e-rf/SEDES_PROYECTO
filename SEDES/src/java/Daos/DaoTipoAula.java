/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.TipoAula;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoTipoAula {
    
    private conexion conexion;
    private ResultSet  rs;
    private TipoAula TipoAula;
    
    
    public DaoTipoAula()
    {
     conexion = new conexion();
    }
    
    public boolean AgregarTipoAula(String nombre_tipo_aula,String descripcion_tipo_aula)
    {
     String Consulta = "insert into tipo_aula (nombre_tipo_aula,descripcion_tipo_aula) values ('"+nombre_tipo_aula+"','"+descripcion_tipo_aula+"');";
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
    
    public boolean EliminarTipoAula (long id_tipo_aula)
    {
         String Consulta = " Delete from tipo_aula where id_tipo_aula= "+id_tipo_aula +";";
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
    
    public boolean ModificarTipoAula (long id_tipo_aula, String descripcion_tipo_aula)
    {
        String Consulta = "Update tipo_aula set  descripcion_tipo_aula="+ descripcion_tipo_aula+" where id_tipo_aula="+id_tipo_aula+";";
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
    public ArrayList ListarTipoAula ()
        {
         
         ArrayList ListarTipoAula = new ArrayList ();
         
         String Consulta = "select * from  tipo_aula";
          System.out.println(Consulta);
         try
         {
             rs = conexion.seleccionarDatos(Consulta);
             while (rs.next())
                {
                TipoAula = new TipoAula();
                
                TipoAula.setId_tipo_aula(rs.getLong(1));
                TipoAula.setNombre_tipo_aula(rs.getString(2));
                TipoAula.setDescripcion_tipo_aula(rs.getString(3));
                
                
                ListarTipoAula.add(TipoAula);
                }
             conexion.desconectar();
             return ListarTipoAula;
         }
            catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
        }
    }
    
     public ArrayList ListarTipoAulaUnica (long id_tipo_aula)
        {
         
         ArrayList ListarTipoAula  = new ArrayList ();
         
         String Consulta = "select * from  tipo_aula where id_tipo_aula ="+id_tipo_aula+""; 
          System.out.println(Consulta);
         try
         {
             rs = conexion.seleccionarDatos(Consulta);
             while (rs.next())
                {
                TipoAula = new TipoAula();
                
                TipoAula.setId_tipo_aula(rs.getLong(1));
                TipoAula.setNombre_tipo_aula(rs.getString(2));
                TipoAula.setDescripcion_tipo_aula(rs.getString(3));
                
                
                ListarTipoAula.add(TipoAula);
                }
             conexion.desconectar();
             return ListarTipoAula;
         }
            catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
        }
    }
}