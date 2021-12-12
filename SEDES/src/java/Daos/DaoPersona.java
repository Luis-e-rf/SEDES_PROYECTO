/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.Persona;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoPersona {
    private conexion conexion;
    private Persona persona;
   
    
    private ResultSet rs;
    
    public DaoPersona(){
        
        conexion = new conexion();
    }
    public boolean AlmacenarPersona (long documento_Persona, long id_tipo_documento, long Id_Tipo_Persona,String Nombre_Persona,String Apellido_Persona,String Direccion_Persona,long Telefono_Persona, String Email )
    {
       
        String consulta = "insert into Persona values("+documento_Persona+","+id_tipo_documento+","+Id_Tipo_Persona
                +",'"+Nombre_Persona+"','"+Apellido_Persona+"','"+Direccion_Persona+"',"+Telefono_Persona+",'"+Email+"');";
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
   public boolean ModificarPersona(long documento_Persona, String Direccion_Persona,long Telefono_Persona,String Email )
    {
        
        String Consulta = "Update persona set documento_Persona='"+documento_Persona+"', Direccion_Persona='"+Direccion_Persona+"',Telefono_Persona="+Telefono_Persona+",Email='"+Email+"'  Where documento_Persona= "+documento_Persona+";";
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
   public boolean EliminarPersona (long documento_Persona)
    {
       
        String consulta = "delete from persona where documento_Persona="+documento_Persona+";";
                
        System.out.println(consulta);
        
        if (conexion.eliminarDatos(consulta)){
            conexion.desconectar();
            
            return true;
            
        }
        else {
            conexion.desconectar();
            return false;
        }
    }



    public ArrayList ListarPersona() throws SQLException{
           ArrayList ListarPersona = new ArrayList();
           String Consulta= "select * from persona";
           try{
               rs = conexion.seleccionarDatos(Consulta);
               while (rs.next()){
                 persona = new Persona();
                 persona.setDocumento_Persona(rs.getLong(1));
                 persona.setId_tipo_documento(rs.getLong(2));
                 persona.setId_Tipo_Persona(rs.getLong(3));             
                 persona.setNombre_Persona(rs.getString(4));
                 persona.setApellido_Persona(rs.getString(5));
                 persona.setDireccion_Persona(rs.getString(6));
                 persona.setTelefono_Persona(rs.getLong(7));
                 persona.setEmail(rs.getString(8));
               
                 
                
                
               
                    ListarPersona.add(persona);
               
                 }
               conexion.desconectar();
                 return ListarPersona;
            }
           catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
        return null;
            }
           
           
}
public ArrayList ListarPersonaUnica(long documento_Persona){ // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar
   
    ArrayList ListarPersona = new ArrayList(); // Creamos un nuevo Array List 
    
    String Consulta = "select * from persona where documento_Persona ="+documento_Persona+""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.
       System.out.print(Consulta);
    try{
        rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
            while(rs.next()){ // Creamos el while para tomar los datos.

                // Creamos una nueva instacia de la clase que vamos a usar.
                
                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                 persona = new Persona();
                 persona.setDocumento_Persona(rs.getLong(1));
                 persona.setId_tipo_documento(rs.getLong(2));
                 persona.setId_Tipo_Persona(rs.getLong(3));
                 persona.setNombre_Persona(rs.getString(4));
                 persona.setApellido_Persona(rs.getString(5));
                 persona.setDireccion_Persona(rs.getString(6));
                 persona.setTelefono_Persona(rs.getLong(7));
                 persona.setEmail(rs.getString(8));
                
                
                 
                
                //Adicionamos cada uno de esos valores al Array List.
                ListarPersona.add(persona);
               }
               // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarPersona;
        }
    catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
    }

    }  
    
    public boolean VerificarPersona(long documento_Persona) throws SQLException{
    String Consulta =  "select * from persona where documento_Persona ="+documento_Persona+""; 
       System.out.print(Consulta);
       
        rs = conexion.seleccionarDatos(Consulta); 
            while(rs.next()){ 

                
                 persona = new Persona();
                 persona.setDocumento_Persona(rs.getLong(1));
                 persona.setId_tipo_documento(rs.getLong(2));
                 persona.setId_Tipo_Persona(rs.getLong(3));
                 persona.setNombre_Persona(rs.getString(4));
                 persona.setApellido_Persona(rs.getString(5));
                 persona.setDireccion_Persona(rs.getString(6));
                 persona.setTelefono_Persona(rs.getLong(7));
                 persona.setEmail(rs.getString(8));
                
                 if(persona.getDocumento_Persona()==documento_Persona){
                      
                      return true;
                  }

  } 
     return false;    
       }
     public boolean VerificarCorreo(String Email) throws SQLException{
    String Consulta =  "select * from persona where Email ='"+Email+"'"; 
       System.out.print(Consulta);
       
        rs = conexion.seleccionarDatos(Consulta); 
            while(rs.next()){ 

                
                 persona = new Persona();
                 persona.setDocumento_Persona(rs.getLong(1));
                 persona.setId_tipo_documento(rs.getLong(2));
                 persona.setId_Tipo_Persona(rs.getLong(3));
                 persona.setNombre_Persona(rs.getString(4));
                 persona.setApellido_Persona(rs.getString(5));
                 persona.setDireccion_Persona(rs.getString(6));
                 persona.setTelefono_Persona(rs.getLong(7));
                 persona.setEmail(rs.getString(8));
                
                 if(persona.getEmail().equals(Email)){
                      
                      return true;
                  }

  } 
     return false;    
       }
     
     public boolean ProcesarEnviarBDpersonas() throws SQLException {
        String Consulta = "load data local infile '/D:/mauro/SEDES PROYECTO/SEDES/web/CSV/mycsvpersonas.csv' into table persona fields terminated by ';' lines terminated by '\n' ignore 1 lines;";
        System.out.print(Consulta);

        if (conexion.modificarDatos(Consulta)) {

            conexion.desconectar();
            return true;

        } else {
            conexion.desconectar();
            return false;
        }

    }
    
    }


    

