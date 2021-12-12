/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.PersonaFicha;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI SENA
 */
public class DaoPersonaFicha 

{
    
    
    private conexion conexion;
    
    private ResultSet rs;
    
    public DaoPersonaFicha(){
        
        conexion = new conexion();
    }
    public boolean AlmacenarPersonaFicha (long numero_ficha, long documento_Persona )
    {
       
        String consulta = "insert into persona_ficha (numero_ficha ,documento_Persona) values("+numero_ficha+","+documento_Persona+");";
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
   public boolean ModificarPersonaFicha (long id_persona_ficha , long numero_ficha)
    {
        
        String Consulta = "Update persona_ficha set numero_ficha="+numero_ficha+" Where id_persona_ficha= "+id_persona_ficha+";";
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
    public boolean EliminarPersonaFicha(long id_persona_ficha) {
        String consulta = "delete from Ficha where id_persona_ficha(" + id_persona_ficha + ");";
        System.out.println(consulta);

        if (conexion.eliminarDatos(consulta)) {

            conexion.desconectar();

            return true;

        } else {
            conexion.desconectar();
            return false;
        }
    }
   
    public ArrayList ListarPersonaFicha() throws SQLException{
           ArrayList ListarPersonaFicha = new ArrayList();
           String Consulta= "select * from persona_ficha";
           try{
               rs = conexion.seleccionarDatos(Consulta);
               while (rs.next()){
                 PersonaFicha ficha = new PersonaFicha();
                 ficha.setId_Persona_ficha(rs.getLong(1));
                 ficha.setNumero_ficha(rs.getLong(2));
                 ficha.setDocumento_Persona(rs.getLong(3));
              
               
                    ListarPersonaFicha.add(ficha);
               
                 }
               conexion.desconectar();
                 return ListarPersonaFicha;
            }
           catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
        return null;
            }
           
           
}
    
    
    public ArrayList ListarPersonaFicha(Long id_persona_ficha)
    { // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar
   
    ArrayList ListarPersonaFicha = new ArrayList(); // Creamos un nuevo Array List 
    
    String Consulta = "select * from persona_ficha where id_persona_ficha ="+id_persona_ficha+""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.
       
    try
    {
        rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
            while(rs.next()){ // Creamos el while para tomar los datos.

                // Creamos una nueva instacia de la clase que vamos a usar.
                
                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                  PersonaFicha ficha = new PersonaFicha();
                 ficha.setId_Persona_ficha(rs.getLong(1));
                 ficha.setNumero_ficha(rs.getLong(2));
                 ficha.setDocumento_Persona(rs.getLong(3));
              
                 
                
                //Adicionamos cada uno de esos valores al Array List.
                ListarPersonaFicha.add(ficha);
               }
               // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarPersonaFicha;
        }
            catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
    }

    }
}


  



