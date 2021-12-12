/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.TipoPersona;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



/**
 *
 * @author ADSI Sena
 */
public class DaoTipoPersona {
      
     private ResultSet rs;
     private conexion conexion;
     private TipoPersona TipoPersona;
     
     public DaoTipoPersona()
    {
        conexion = new conexion();
        
        
        
    }
    public boolean AgregarTipoPersona(String Nombre_Tipo_Persona, String Descripcion_Tipo_Persona)
    {
        
        String Consulta = "insert into tipo_persona (Nombre_Tipo_Persona,Descripcion_Tipo_Persona)values ('"+Nombre_Tipo_Persona+"','"+Descripcion_Tipo_Persona+"');"; 
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
    public boolean EliminarTipoPersona(long id_Tipo_Persona)
    {
        String Consulta = "delete from tipo_persona where id_Tipo_Persona = "+id_Tipo_Persona+"; "; 
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
     public boolean ModificarTipoPersona (long id_Tipo_Persona,String Nombre_Tipo_Persona,String Descripcion_Tipo_Persona) 
             
             
      {
    
      String Consulta = "Update tipo_persona set Nombre_Tipo_Persona = '"+Nombre_Tipo_Persona+"' ,Descripcion_Tipo_Persona = '"+Descripcion_Tipo_Persona+"' where Id_Tipo_Inventario = "+id_Tipo_Persona+";";
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
      
      
      public ArrayList ListarTipoPersona(){
          
          ArrayList ListarTipoPersona = new ArrayList();
                  
          String Consulta = "Select * from tipo_persona ";
          
          try {
              
              rs = conexion.seleccionarDatos(Consulta);
              while (rs.next()){
                  
                  TipoPersona = new TipoPersona();

              TipoPersona.setId_Tipo_Persona(rs.getLong(1));
              TipoPersona.setNombre_Tipo_Persona(rs.getString(2));
              TipoPersona.setDescripcion_Tipo_Persona(rs.getString(3));
              
              ListarTipoPersona.add(TipoPersona);
              

}
              conexion.desconectar();
              return ListarTipoPersona;
          
      }
          catch(SQLException e){
              System.out.println(e.getMessage());
              conexion.desconectar();
              return null;
          }
              
          }
       public ArrayList ListarTipoPersonaunico(long id_Tipo_Persona){
          
          ArrayList ListarTipoPersona = new ArrayList();
                  
          String Consulta = "Select * from tipo_persona where id_Tipo_Persona="+id_Tipo_Persona+"";
          
          try {
              
              rs = conexion.seleccionarDatos(Consulta);
              while (rs.next()){
                  
                  TipoPersona = new TipoPersona();
                  
                  TipoPersona.setId_Tipo_Persona(rs.getLong(1));
                  TipoPersona.setNombre_Tipo_Persona(rs.getString(2));
                  TipoPersona.setDescripcion_Tipo_Persona(rs.getString(3));
                  
                  
                  ListarTipoPersona.add(TipoPersona);             
              }
              conexion.desconectar();
              return ListarTipoPersona;
          
      }
          catch(SQLException e){
              System.out.println(e.getMessage());
              conexion.desconectar();
              return null;
}
       }
            
}
    

