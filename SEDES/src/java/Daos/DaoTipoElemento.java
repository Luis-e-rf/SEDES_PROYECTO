/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.TipoElemento;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Diego
 */
public class DaoTipoElemento {
    
    
     private ResultSet rs;
     private conexion conexion;
     private TipoElemento TipoElemento;
     
     
     public DaoTipoElemento()
             
     {
         conexion = new conexion();
     }
     
     public boolean AgregarTipoElemento (String Nombre_Tipo_Elemento)
     {
          String Consulta = "insert into tipo_elemento (Nombre_Tipo_Elemento) values ('"+Nombre_Tipo_Elemento+"');"; 
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
    public boolean EliminarTipoElemento(long idTipo_Elemento)
    {
        String Consulta = "delete from tipo_elemento where idTipo_Elemento = "+idTipo_Elemento+"; "; 
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
     public boolean ModificarTipoElemento (long idTipo_Elemento,String Nombre_Tipo_Elemento) 
             
             
      {
    
      String Consulta = "Update tipo_elemento set Nombre_Tipo_Elemento = '"+Nombre_Tipo_Elemento+"' where idTipo_Elemento = "+idTipo_Elemento+";";
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
      
      
      public ArrayList ListarTipoElemento(){
          
          ArrayList ListarTipoElemento = new ArrayList();
                  
          String Consulta = "Select * from tipo_elemento";
          
          try {
              
              rs = conexion.seleccionarDatos(Consulta);
              while (rs.next()){
                  
                  TipoElemento = new TipoElemento();

              TipoElemento.setIdTipo_Elemento(rs.getLong(1));
              TipoElemento.setNombre_Tipo_Elemento(rs.getString(2));
              
              
              ListarTipoElemento.add(TipoElemento);
              

}
              conexion.desconectar();
              return ListarTipoElemento;
          
      }
          catch(SQLException e){
              System.out.println(e.getMessage());
              conexion.desconectar();
              return null;
          }
              
          }
       public ArrayList ListarTipoElementounico(long idTipo_Elemento){
          
          ArrayList ListarTipoElemento = new ArrayList();
                  
          String Consulta = "Select * from tipo_elemento where idTipo_Elemento="+idTipo_Elemento+"";
          
          try {
              
              rs = conexion.seleccionarDatos(Consulta);
              while (rs.next()){
                  
                  TipoElemento = new TipoElemento();
                  
                  TipoElemento.setIdTipo_Elemento(rs.getLong(1));
              TipoElemento.setNombre_Tipo_Elemento(rs.getString(2));
             
              
              ListarTipoElemento.add(TipoElemento);
                             
              }
              conexion.desconectar();
              return ListarTipoElemento;
          
            }
          catch(SQLException e){
              System.out.println(e.getMessage());
              conexion.desconectar();
              return null;
        }
    }
}
    

    

    

