/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.Usuario;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoUsuario {
    
    private ResultSet rs;
     private conexion conexion;
     private Usuario Usuario;
     
     public DaoUsuario()
    {
        conexion = new conexion();
        
        
        
    }
    public boolean AgregarUsuario(String Nombre_Usuario,String Contraseña_Usuario, long documento_Persona,long Id_Tipo_usuario )
    {
        
        String Consulta = "insert into Usuario values ('"+Nombre_Usuario+"','"+Contraseña_Usuario+"',"+documento_Persona+","+Id_Tipo_usuario+");"; 
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
    public boolean EliminarUsuario(String Nombre_Usuario)
    {
        String Consulta = "delete from usuario where Nombre_Tipo_Usuario = '"+Nombre_Usuario+"'; "; 
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
     public boolean ModificarUsuario (String Nombre_Usuario,String Contraseña_Usuario) 
             
             
      {
    
      String Consulta = "Update usuario set Contraseña_Usuario = '"+Contraseña_Usuario+"' where Nombre_Usuario = '"+Nombre_Usuario+"';";
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
      
      
      public ArrayList ListarUsuario(){
          
          ArrayList ListarUsuario = new ArrayList();
                  
          String Consulta = "Select * from usuario ";
          
          try {
              
              rs = conexion.seleccionarDatos(Consulta);
              while (rs.next()){
                  
                  Usuario = new Usuario();

              Usuario.setNombre_Usuario(rs.getString(1));
              Usuario.setContraseña_Usuario(rs.getString(2));
              Usuario.setDocumento_persona(rs.getLong(3));
              Usuario.setId_Tipo_usuario(rs.getLong(4));
              
              
              ListarUsuario.add(Usuario);
              

}
              conexion.desconectar();
              return ListarUsuario;
          
      }
          catch(SQLException e){
              System.out.println(e.getMessage());
              conexion.desconectar();
              return null;
          }
              
          }
       public ArrayList ListarUsuarioUnico(String Nombre_Usuario){
          
          ArrayList ListarTipoUsuario = new ArrayList();
                  
          String Consulta = "Select * from usuario where documento_Persona='"+Nombre_Usuario+"'";
           System.out.print(Consulta);
          try {
              
              rs = conexion.seleccionarDatos(Consulta);
              while (rs.next()){
                  
                  Usuario = new Usuario();
                  
              Usuario.setNombre_Usuario(rs.getString(1));
              Usuario.setContraseña_Usuario(rs.getString(2));
              Usuario.setDocumento_persona(rs.getLong(3));
              Usuario.setId_Tipo_usuario(rs.getLong(4));
                  
                  
                  ListarTipoUsuario.add(Usuario);             
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
  public boolean VerificarUsuario (String Nombre_Usuario,String Contraseña_Usuario) throws SQLException{
      
         String Consulta = "Select * from usuario where Nombre_Usuario='"+Nombre_Usuario+"'and Contraseña_Usuario='"+Contraseña_Usuario+"'";
         System.out.println(Consulta);
         rs= conexion.seleccionarDatos(Consulta);
         
         while (rs.next())
         {
                  
                  Usuario = new Usuario();
                  
              Usuario.setNombre_Usuario(rs.getString(1));
              Usuario.setContraseña_Usuario(rs.getString(2));
              Usuario.setDocumento_persona(rs.getLong(3));
              Usuario.setId_Tipo_usuario(rs.getLong(4));
                  
                  if (Usuario.getNombre_Usuario().equals(Nombre_Usuario) && Usuario.getContraseña_Usuario().equals(Contraseña_Usuario)){
                      
                      Long TipoUsuario =rs.getLong(4);
                      
                      return true;
                  }

  } 
     return false;     
}
  public boolean VerificarContraseña (String Contraseña_Usuario) throws SQLException{
      
         String Consulta = "Select * from usuario where Contraseña_Usuario='"+Contraseña_Usuario+"'";
         
         rs= conexion.seleccionarDatos(Consulta);
         
         while (rs.next())
         {
                  
                  Usuario = new Usuario();
                  
              Usuario.setNombre_Usuario(rs.getString(1));
              Usuario.setContraseña_Usuario(rs.getString(2));
              Usuario.setDocumento_persona(rs.getLong(3));
              Usuario.setId_Tipo_usuario(rs.getLong(4));
                  
                  if ( Usuario.getContraseña_Usuario().equals(Contraseña_Usuario)){
                      
                      
                      return true;
                  }

  } 
     return false;     
}
  public ArrayList ListarUsuarioUnico2(String Nombre_Usuario){
          
          ArrayList ListarTipoUsuario = new ArrayList();
                  
          String Consulta = "Select * from usuario where Nombre_Usuario='"+Nombre_Usuario+"'";
           System.out.print(Consulta);
          try {
              
              rs = conexion.seleccionarDatos(Consulta);
              while (rs.next()){
                  
                  Usuario = new Usuario();
                  
              Usuario.setNombre_Usuario(rs.getString(1));
              Usuario.setContraseña_Usuario(rs.getString(2));
              Usuario.setDocumento_persona(rs.getLong(3));
              Usuario.setId_Tipo_usuario(rs.getLong(4));
                  
                  
                  ListarTipoUsuario.add(Usuario);             
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
  public String VerificarCorreo(String Email) throws SQLException{
    String Consulta =  "select u.Nombre_Usuario from persona p, usuario u where p.documento_Persona = u.documento_Persona and p.Email='"+Email+"';"; 
       System.out.print(Consulta);
       
        rs = conexion.seleccionarDatos(Consulta); 
            while(rs.next()){ 

                
                Usuario = new Usuario();
                
                Usuario.setNombre_Usuario(rs.getString(1));
                
                 if(Usuario.getNombre_Usuario()!= null){
                      
                      return Usuario.getNombre_Usuario();
                  }

  } 
     return null;    
       }
}
    

    

    

