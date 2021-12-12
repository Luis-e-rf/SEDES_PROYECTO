/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;


import Clases.PersonaProfesion;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI SENA
 */
public class DaoPersonaProfesion 
{
     private conexion conexion;
    
    private ResultSet rs;
    
    public DaoPersonaProfesion()
    {
        
        conexion = new conexion();
    }
    public boolean AlmacenarPersonaProfesion (long documento_Persona, long id_profesion )
    {
   
        String consulta = "insert into Persona_profesion (documento_Persona,id_profesion) values("+documento_Persona+","+id_profesion+");";
        System.out.println(consulta);
        
        if (conexion.insertarDatos(consulta)){
            conexion.desconectar();
            
            return true;
            
        }
        else {
            conexion.desconectar();
            return false;
        }
    } 
     public boolean EliminarPersonaProfesion(long id_Persona_profesion)
    {
        String Consulta = "delete from persona_profesion where id_Persona_profesion = "+id_Persona_profesion+"; "; 
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
      public boolean ModificarPersonaProfesion (long id_Persona_profesion , long id_profesion)
    {
        
        String Consulta = "Update Persona_profesion set id_profesion="+id_profesion+" Where id_instructor_profesion= "+id_Persona_profesion+";";
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
    
    
      
    public ArrayList ListarPersonaProfesion() throws SQLException{
           ArrayList ListarPersonaProfesion = new ArrayList();
           String Consulta= "select * from Persona_profesion ";
           try{
               rs = conexion.seleccionarDatos(Consulta);
               while (rs.next()){
                 PersonaProfesion profesion = new PersonaProfesion();
                 profesion.setId_Persona_profesion(rs.getLong(1));
                 profesion.setDocumento_Persona(rs.getLong(2));
                 profesion.setId_profesion(rs.getLong(3));
              
               
                    ListarPersonaProfesion.add(profesion);
               
                 }
               conexion.desconectar();
                 return ListarPersonaProfesion;
            }
           catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
        return null;
            }
           
      
}
    
      public ArrayList ListarPersonaProfesion(Long id_instructor_profesion)
    { // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar
   
    ArrayList ListarPersonaProfesion = new ArrayList(); // Creamos un nuevo Array List 
    
    String Consulta = "select * from Persona_profesion where id_instructor_profesion ="+id_instructor_profesion+""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.
       
    try
    {
        rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
            while(rs.next()){ // Creamos el while para tomar los datos.

                // Creamos una nueva instacia de la clase que vamos a usar.
                
                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                  PersonaProfesion profesion = new PersonaProfesion();
                 profesion.setId_Persona_profesion(rs.getLong(1));
                 profesion.setDocumento_Persona(rs.getLong(2));
                 profesion.setId_profesion(rs.getLong(3));
              
                 
                
                //Adicionamos cada uno de esos valores al Array List.
                ListarPersonaProfesion.add(profesion);
               }
               // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarPersonaProfesion;
        }
            catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
    }

    }
}
    
    
    




