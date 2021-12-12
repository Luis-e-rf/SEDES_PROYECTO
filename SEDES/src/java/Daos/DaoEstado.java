/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.Estado;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoEstado {
    private conexion conexion;
    
    private ResultSet rs;
        public DaoEstado(){
        
        conexion = new conexion();
    }
        public boolean AlmacenarEstado (String Nombre_Estado, String Observaciones_Estado )
        {
            String consulta = "insert into deterioro (Nombre_Estado,Observaciones_Estado) values ('"+Nombre_Estado
                +"','"+Observaciones_Estado+"');";
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
        
        public boolean EliminarEstado (long Id_Estado)
        {
            String consulta = "delete from deterioro where Id_Deterioro("+Id_Estado+");";
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
        
        public boolean ActualizarEstado (String Observaciones_Estado, long Id_Estado )
        {
        String consulta = "UPDATE deterioro SET Observaciones_Estado='"+Observaciones_Estado+"' WHERE Id_Estado=("+Id_Estado+");";
        
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
        
        public ArrayList listarEstado() throws SQLException{
           ArrayList listarEstado = new ArrayList();
           String Consulta= "select * from estado";
           try{
               rs = conexion.seleccionarDatos(Consulta);
               while (rs.next()){
                 Estado Estado = new Estado();
                 
                 Estado.setId_Estado(rs.getLong(1));
                 Estado.setNombre_Estado(rs.getString(2));
                 Estado.setObservaciones_Estado(rs.getString(3));
               
                    listarEstado.add(Estado);
               
                 }
               conexion.desconectar();
                 return listarEstado;
            }
           catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
        return null;
            }
          }
        
        public ArrayList ListarEstadoUnico(Long Id_Estado){ // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar
   
    ArrayList listarEstado = new ArrayList(); // Creamos un nuevo Array List 

    
    String Consulta = "select * from Estado where Id_Estado ="+Id_Estado+""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.
       
    try{
        rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
            while(rs.next()){ // Creamos el while para tomar los datos.

               Estado Estado = new Estado(); // Creamos una nueva instacia de la clase que vamos a usar.
                
                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                Estado.setId_Estado(rs.getLong(1));
                Estado.setNombre_Estado(rs.getString(2));
                Estado.setObservaciones_Estado(rs.getString(3));
                
                //Adicionamos cada uno de esos valores al Array List.
                listarEstado.add(Estado);
               }
               // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return listarEstado;
        }
    catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
    }

    }
        
        
}
