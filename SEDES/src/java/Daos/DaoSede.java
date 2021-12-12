/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.Sede;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoSede {
    
    private Sede sede;
    
    private conexion conexion;
    
    private ResultSet rs;
    
    public DaoSede()
    {
        conexion = new conexion();
    }
    
    public boolean AlmacenarSede ( String nombre_sede, String Horario_sede, String observaciones_sede)
    {
        String consulta = "insert into sede (nombre_sede,Horario_sede,observaciones_sede) values ('"+nombre_sede+"','"+Horario_sede+"','"+observaciones_sede+"');";
        
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
    
    public boolean EliminarSede(long id_sede)
    {
        String consulta = "delete from sede where id_sede="+id_sede+";";
        
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
    
    public boolean ActualizarSede(long id_sede, String nombre_sede,String Horario_sede, String observaciones_sede)
    {
        String consulta = "UPDATE sede SET nombre_sede='"+nombre_sede+"' ,Horario_sede='"+Horario_sede+"',observaciones_sede='"+observaciones_sede+"' WHERE id_sede=("+id_sede+");";
        
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
    
    public ArrayList ListarSede()
        {
           
           ArrayList ListarSede = new ArrayList();
           
           String Consulta= "select * from sede";
           
           try
           {
               
               rs = conexion.seleccionarDatos(Consulta);
               
                 while (rs.next()){
               
                 sede = new Sede();
                 
                 sede.setId_sede(rs.getLong(1));
                 sede.setNombre_sede(rs.getString(2));
                 sede.setHorario_sede(rs.getString(3));
                 sede.setObservaciones_sede(rs.getString(4));
                 
                    ListarSede.add(sede);
               
                 }
               conexion.desconectar();
                 return ListarSede;
            }
           catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
        return null;
            }
}
    
    public ArrayList ListarSedeUnica (long id_sede){ // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar
   
        ArrayList ListarSede = new ArrayList(); // Creamos un nuevo Array List 
    
        String Consulta = "select * from sede where id_sede ="+id_sede+""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.
       
            try{
                rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
                while(rs.next()){ // Creamos el while para tomar los datos.

                sede = new Sede();
                 
                sede.setId_sede(rs.getLong(1));
                sede.setNombre_sede(rs.getString(2));
                sede.setHorario_sede(rs.getString(3));
                sede.setObservaciones_sede(rs.getString(4));
                
                //Adicionamos cada uno de esos valores al Array List.
                ListarSede.add(sede);
               }
               // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarSede;
        }
    catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
    }

    }
    
}
