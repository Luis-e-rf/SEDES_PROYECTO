/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.Profesion;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoProfesion {
    
    private Profesion profesion;
    
    private conexion conexion;
    
    private ResultSet rs;
    
    public DaoProfesion()
    {
        conexion = new conexion();
    }
    
    public boolean AlmacenarProfesion (String nombre_profesion, String descripcion_profesion)
    {
        String consulta = "insert into profesion (nombre_profesion,descripcion_profesion) values ('"+nombre_profesion+"','"+descripcion_profesion+"');";
        
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
    
    public boolean EliminarProfesion(long id_profesion)
    {
        String consulta = "delete from profesion where id_profesion=("+id_profesion+");";
        
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
    
    public boolean ActualizarProfesion(long id_profesion, String nombre_profesion, String descripcion_profesion)
    {
        String consulta = "UPDATE profesion SET nombre_profesion='"+nombre_profesion+"',descripcion_profesion='"+descripcion_profesion+"' WHERE id_profesion=("+id_profesion+");";
        
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
    
    public ArrayList ListarProfesion()
        {
           
           ArrayList ListarProfesion = new ArrayList();
           
           String Consulta= "select * from profesion";
           
           try
           {
               
               rs = conexion.seleccionarDatos(Consulta);
               
                 while (rs.next()){
               
                 profesion = new Profesion();
                 
                 profesion.setId_profesion(rs.getLong(1));
                 profesion.setNombre_profesion(rs.getString(2));
                 profesion.setDescripcion_profesion(rs.getString(3));
                 
                    ListarProfesion.add(profesion);
               
                 }
               conexion.desconectar();
                 return ListarProfesion;
            }
           catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
        return null;
            }
}
    
    public ArrayList ListarProfesionUnica(long id_profesion){ // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar
   
        ArrayList ListarProfesion = new ArrayList(); // Creamos un nuevo Array List 
    
        String Consulta = "select * from profesion where id_profesion ="+id_profesion+""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.
       
            try{
                rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
                while(rs.next()){ // Creamos el while para tomar los datos.

                profesion = new Profesion(); // Creamos una nueva instacia de la clase que vamos a usar.
                
                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                profesion.setId_profesion(rs.getLong(1));
                profesion.setNombre_profesion(rs.getString(2));
                profesion.setDescripcion_profesion(rs.getString(3));
                
                //Adicionamos cada uno de esos valores al Array List.
                ListarProfesion.add(profesion);
               }
               // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarProfesion;
        }
    catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
    }

    }
    
}
