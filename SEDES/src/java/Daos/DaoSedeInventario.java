/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;
import Clases.SedeInventario;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoSedeInventario {
    
    private conexion conexion;
    private ResultSet  rs;
    private SedeInventario SedeInventario;
    
    
    public DaoSedeInventario()
    {
     conexion = new conexion();
    }
    
    public boolean AgregarSedeInventario(long Id_sede,long Id_Tipo_Inventario)
    {
     String Consulta = "insert into Sede_inventario (Id_sede,Id_Tipo_Inventario) values ("+Id_sede+","+Id_Tipo_Inventario+");";
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
    
    public boolean EliminarSedeInventario (long Id_Sede_inventario)
    {
         String Consulta = " Delete from Sede_inventario where Id_Sede_inventario= "+Id_Sede_inventario +";";
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
    
    public boolean ModificarSedeInventario (long Id_Sede_inventario, long Id_Tipo_Inventario)
    {
        String Consulta = "Update Sede_inventario set Id_Tipo_Inventario="+Id_Tipo_Inventario+" where Id_Sede_inventario="+Id_Sede_inventario+";";
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
    public ArrayList ListarSedeInventario ()
        {
         
         ArrayList ListarSedeInventario =new ArrayList ();
         
         String Consulta = "select * from  Sede_inventario";
    
         try
         {
             rs = conexion.seleccionarDatos(Consulta);
             while (rs.next())
                {
                SedeInventario = new SedeInventario();
                
                SedeInventario.setId_Sede_Inventario(rs.getLong(1));
                SedeInventario.setId_sede(rs.getLong(2));
                SedeInventario.setId_Tipo_Inventario(rs.getLong(3));
                
                
                ListarSedeInventario.add(SedeInventario);
                }
             conexion.desconectar();
             return ListarSedeInventario;
         }
            catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
        }
    }
    
     public ArrayList ListarSedeInventarioUnico (long Id_Sede_inventario)
        {
         
         ArrayList ListarSedeInventario= new ArrayList ();
         
         String Consulta = "select * from  Sede_inventario where Id_Sede_inventario ="+Id_Sede_inventario+""; 
          System.out.println(Consulta);
         try
         {
             rs = conexion.seleccionarDatos(Consulta);
             while (rs.next())
                {
                SedeInventario = new SedeInventario();
                
                SedeInventario.setId_Sede_Inventario(rs.getLong(1));
                SedeInventario.setId_sede(rs.getLong(2));
                SedeInventario.setId_Tipo_Inventario(rs.getLong(3));
                
                
                ListarSedeInventario.add(SedeInventario);
                }
             conexion.desconectar();
             return ListarSedeInventario;
         }
            catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
        }
    }
}