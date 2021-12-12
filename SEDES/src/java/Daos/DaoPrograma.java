/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.Programa;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoPrograma {
    
    private Programa programa;
    
    private conexion conexion;
    
    private ResultSet rs;
    
    public DaoPrograma()
    {
        conexion = new conexion();
    }
    
    public boolean AlmacenarPrograma (long id_programa, String nombre_programa, long version_programa, String descripcion_programa)
    {
        String consulta = "insert into programa values ("+id_programa+",'"+nombre_programa+"',"+version_programa+",'"+descripcion_programa+"');";
        
        System.out.println(consulta);
        
        if (conexion.insertarDatos(consulta))
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
    
    public boolean EliminarPrograma(long id_programa)
    {
        String consulta = "delete from programa where id_programa=("+id_programa+");";
        
        System.out.println(consulta);
        
        if (conexion.eliminarDatos(consulta))
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
    
    public boolean ActualizarPrograma(long id_programa, String nombre_programa, long version_programa, String descripcion_programa)
    {
        String consulta = "UPDATE programa SET nombre_programa='"+nombre_programa+"',version_programa="+version_programa+",descripcion_programa='"+descripcion_programa+"' WHERE id_programa=("+id_programa+");";
        
        System.out.println(consulta);
        
        if (conexion.modificarDatos(consulta))
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
    
    public ArrayList ListarPrograma()
        {
           
           ArrayList ListarPrograma = new ArrayList();
           
           String Consulta= "select * from programa";
           
           try
           {
               
               rs = conexion.seleccionarDatos(Consulta);
               
                 while (rs.next()){
               
                 programa = new Programa();
                 
                 programa.setId_programa(rs.getLong(1));
                 programa.setNombre_programa(rs.getString(2));
                 programa.setVersion_programa(rs.getLong(3));
                 programa.setDescripcion_programa(rs.getString(4));
                 
                    ListarPrograma.add(programa);
               
                 }
               conexion.desconectar();
                 return ListarPrograma;
            }
           catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
        return null;
            }
}
    
    public ArrayList ListarProgramaUnico (long id_programa){ // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar
   
        ArrayList ListarPrograma = new ArrayList(); // Creamos un nuevo Array List 
    
        String Consulta = "select * from programa where id_programa ="+id_programa+""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.
       
            try{
                rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
                while(rs.next()){ // Creamos el while para tomar los datos.

                programa = new Programa(); // Creamos una nueva instacia de la clase que vamos a usar.
                
                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                programa.setId_programa(rs.getLong(1));
                programa.setNombre_programa(rs.getString(2));
                programa.setVersion_programa(rs.getLong(3));
                programa.setDescripcion_programa(rs.getString(4));
                
                //Adicionamos cada uno de esos valores al Array List.
                ListarPrograma.add(programa);
               }
               // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarPrograma;
        }
    catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
    }

    }
    
}
