/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.TipoInventario;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoTipoInventario {
     private ResultSet rs;
     private conexion conexion;
     private TipoInventario TipoInventario;
     
     public DaoTipoInventario()
    {
        conexion = new conexion();
        
        
        
    }
    public boolean AgregarTipoInventario(String Nombre_Tipo_Inventario, String Descripcion_Tipo_Inventario)
    {
        
        String Consulta = "insert into tipo_inventario(Nombre_Tipo_Inventario, Descripcion_Tipo_Inventario)values ('"+Nombre_Tipo_Inventario+"','"+Descripcion_Tipo_Inventario+"');"; 
        System.out.println(Consulta);
        
        if(conexion.insertarDatos(Consulta))
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
    public boolean EliminarTipoInventario(long Id_Tipo_Inventario)
    {
        String Consulta = "delete from tipo_inventario where Id_Tipo_Inventario = "+Id_Tipo_Inventario+"; "; 
         System.out.println(Consulta);
      
      if(conexion.insertarDatos(Consulta))
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
     public boolean ModificarTipoInventario (long Id_Tipo_Inventario,String Nombre_Tipo_Inventario,String Descripcion_Tipo_Inventario) 
             
             
      {
    
      String Consulta = "Update tipo_inventario set Nombre_Tipo_Inventario = '"+Nombre_Tipo_Inventario+"' ,Descripcion_Tipo_Inventario = '" + Descripcion_Tipo_Inventario+"' where Id_Tipo_Inventario = "+Id_Tipo_Inventario+";";
      System.out.println(Consulta);
      
      if(conexion.insertarDatos(Consulta))
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
      
      
      public ArrayList ListarTipoInventario(){
          
          ArrayList ListarTipoInventario = new ArrayList();
                  
          String Consulta = "Select * from tipo_inventario ";
          
          try {
              
              rs = conexion.seleccionarDatos(Consulta);
              while (rs.next()){
                  
                  TipoInventario = new TipoInventario();

              TipoInventario.setId_Tipo_Inventario(rs.getLong(1));
              TipoInventario.setNombre_Tipo_Inventario(rs.getString(2));
              TipoInventario.setDescripcion_Tipo_Inventario(rs.getString(3));
              
              ListarTipoInventario.add(TipoInventario);
              

}
              conexion.desconectar();
              return ListarTipoInventario;
          
      }
          catch(SQLException e){
              System.out.println(e.getMessage());
              conexion.desconectar();
              return null;
          }
              
          }
       public ArrayList ListarTipoInventariounico(long Id_Tipo_Inventario){
          
          ArrayList ListarTipoInventario = new ArrayList();
                  
          String Consulta = "Select * from tipo_inventario where Id_Tipo_Inventario="+Id_Tipo_Inventario+"";
          
          try {
              
              rs = conexion.seleccionarDatos(Consulta);
              while (rs.next()){
                  
                  TipoInventario = new TipoInventario();
                  
                  TipoInventario.setId_Tipo_Inventario(rs.getLong(1));
                  TipoInventario.setNombre_Tipo_Inventario(rs.getString(2));
                  TipoInventario.setDescripcion_Tipo_Inventario(rs.getString(3));
                  
                  
                  ListarTipoInventario.add(TipoInventario);             
              }
              conexion.desconectar();
              return ListarTipoInventario;
          
      }
          catch(SQLException e){
              System.out.println(e.getMessage());
              conexion.desconectar();
              return null;
}
       }
}