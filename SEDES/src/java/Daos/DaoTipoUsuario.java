/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.TipoUsuario;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



/**
 *
 * @author ADSI Sena
 */
public class DaoTipoUsuario {
    

     private ResultSet rs;
     private conexion conexion;
     private TipoUsuario TipoUsuario;
     
     public DaoTipoUsuario()
    {
        conexion = new conexion();
        
        
        
    }
    public boolean AgregarTipoUsuario(String Nombre_Tipo_usuario, String Descripcion_Tipo_usuario)
    {
        
        String Consulta = "insert into tipo_usuario (Nombre_Tipo_usuario,Descripcion_Tipo_usuario) values ('"+Nombre_Tipo_usuario+"','"+Descripcion_Tipo_usuario+"');"; 
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
    public boolean EliminarTipoUsuario(long Id_Tipo_usuario)
    {
        String Consulta = "delete from tipo_usuario where Id_Tipo_usuario = "+Id_Tipo_usuario+"; "; 
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
     public boolean ModificarTipoUsuario (long Id_Tipo_usuario,String Nombre_Tipo_usuario,String Descripcion_Tipo_usuario) 
             
             
      {
    
      String Consulta = "Update tipo_usuario set Nombre_Tipo_usuario = '"+Nombre_Tipo_usuario+"' ,Descripcion_Tipo_usuario = '" + Descripcion_Tipo_usuario+"' where Id_Tipo_Inventario = "+Id_Tipo_usuario+";";
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
      
      
      public ArrayList ListarTipoUsuario(){
          
          ArrayList ListarTipoUsuario = new ArrayList();
                  
          String Consulta = "Select * from tipo_usuario ";
          
          try {
              
              rs = conexion.seleccionarDatos(Consulta);
              while (rs.next()){
                  
                  TipoUsuario = new TipoUsuario();

              TipoUsuario.setId_Tipo_usuario(rs.getLong(1));
              TipoUsuario.setNombre_Tipo_usuario(rs.getString(2));
              TipoUsuario.setDescripcion_Tipo_usuario(rs.getString(3));
              
              ListarTipoUsuario.add(TipoUsuario);
              

}
              conexion.desconectar();
              return ListarTipoUsuario;
          
      }
          catch(SQLException e){
              System.out.println(e.getMessage());
              conexion.desconectar();
              return null;
          }
              
          }
       public ArrayList ListarTipoUsuariounico(long Id_Tipo_usuario){
          
          ArrayList ListarTipoUsuario = new ArrayList();
                  
          String Consulta = "Select * from tipo_usuario where Id_Tipo_usuario="+Id_Tipo_usuario+"";
          
          try {
              
              rs = conexion.seleccionarDatos(Consulta);
              while (rs.next()){
                  
                  TipoUsuario = new TipoUsuario();
                  
                  TipoUsuario.setId_Tipo_usuario(rs.getLong(1));
                  TipoUsuario.setNombre_Tipo_usuario(rs.getString(2));
                  TipoUsuario.setDescripcion_Tipo_usuario(rs.getString(3));
                  
                  
                  ListarTipoUsuario.add(TipoUsuario);             
              }
              conexion.desconectar();
              return ListarTipoUsuario;
          
      }
          catch(SQLException e){
              System.out.println(e.getMessage());
              conexion.desconectar();
              return null;
}
       }
}
    

    
