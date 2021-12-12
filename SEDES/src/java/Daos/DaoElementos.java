/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.Elementos;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoElementos {
    private conexion conexion;
    
    private ResultSet rs;
    
        public DaoElementos(){
        
        conexion = new conexion();
        }
        public boolean AlmacenarElementos (long Id_Elemento, long IdTipo_Elemento, long Id_Tipo_Inventario, long idMarca, long Id_Estado, String Nombre_Elemento ,String Descripcion_Elemento)
        {
            String consulta = "insert into elementos values ("+Id_Elemento+","+IdTipo_Elemento+","+Id_Tipo_Inventario+","+idMarca+",1,'"+Nombre_Elemento+"','"+Descripcion_Elemento+"');";
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
        
        public boolean EliminarElementos (long Id_Elemento)
        {
            String consulta = "delete from elementos where Id_Elemento="+Id_Elemento+";";
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
        
        public boolean ActualizarElemento ( long Id_Elemento, long Id_Tipo_Inventario, String Nombre_Elemento,String Descripcion_Elemento)
        {
        String consulta = "UPDATE elementos SET Id_Tipo_Inventario="+Id_Tipo_Inventario+",Nombre_Elemento='"+Nombre_Elemento+"',Descripcion_Elemento='"+Descripcion_Elemento+"' WHERE Id_Elemento=("+Id_Elemento+");";
        
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
        
        public boolean ActualizarEstadoElementoAuto ( long Id_Elemento, long Id_Estado)
        {
        String consulta = "UPDATE elementos SET Id_Estado="+Id_Estado+" WHERE Id_Elemento=("+Id_Elemento+");";
        
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
        
        public boolean ModificarElemento ( long Id_Elemento, long Id_Estado)/* se realizo la creacion de un nuevo modificar para la entrega de prestamos */
        {
        String consulta = "UPDATE elementos SET Id_Estado="+Id_Estado+" WHERE Id_Elemento=("+Id_Elemento+");";/*se toma el id_elemento y se ingresa el id estado el cual indica si el elemnto esta disponible o prestado*/
        
        System.out.println(consulta);/*se envia la consulta a la base de datos*/
        
        if (conexion.modificarDatos(consulta)) /* se modifican los datos*/
        {
            conexion.desconectar();/*se cierra la conexion*/
            
            return true;
        }
        
        else
        {
            
            conexion.desconectar();
            return false;
        }
        }

        
        
        public ArrayList listarElementos() throws SQLException{
           ArrayList listarElementos = new ArrayList();
           String Consulta= "select * from elementos";
           try{
               rs = conexion.seleccionarDatos(Consulta);
               while (rs.next()){
                 Elementos Elementos = new Elementos();
                 
                 Elementos.setId_Elemento(rs.getLong(1));
                 Elementos.setId_Tipo_Elemento(rs.getLong(2));
                 Elementos.setId_Tipo_Inventario(rs.getLong(3));
                 Elementos.setId_Marca(rs.getLong(4));
                 Elementos.setId_Estado(rs.getLong(5));
                 Elementos.setNombre_Elemento(rs.getString(6));
                 Elementos.setDescripcion_Elemento(rs.getString(7));
                 
               
                    listarElementos.add(Elementos);
               
                 }
               conexion.desconectar();
                 return listarElementos;
            }
           catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
        return null;
            }
          }
        
        public ArrayList ListarElementosUnico(Long Id_Elemento){ // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar
   
    ArrayList ListarElementos = new ArrayList(); // Creamos un nuevo Array List 

    
    String Consulta = "select * from elementos where Id_Elemento ="+Id_Elemento+""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.
       
    try{
        rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
            while(rs.next()){ // Creamos el while para tomar los datos.

                Elementos Elementos = new Elementos(); // Creamos una nueva instacia de la clase que vamos a usar.
                
                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                 Elementos.setId_Elemento(rs.getLong(1));
                 Elementos.setId_Tipo_Elemento(rs.getLong(2));
                 Elementos.setId_Tipo_Inventario(rs.getLong(3));
                 Elementos.setId_Marca(rs.getLong(4));
                 Elementos.setId_Estado(rs.getLong(5));
                 Elementos.setNombre_Elemento(rs.getString(6));
                 Elementos.setDescripcion_Elemento(rs.getString(7));
                
                //Adicionamos cada uno de esos valores al Array List.
                ListarElementos.add(Elementos);
               }
               // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarElementos;
        }
    catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
    }

    }
        public boolean VerificarElemento(long Id_Elemento) throws SQLException{
    String Consulta =  "select * from elementos where Id_Elemento ="+Id_Elemento+""; 
       System.out.print(Consulta);
       
        rs = conexion.seleccionarDatos(Consulta); 
            while(rs.next()){ 

                
                 Elementos Elementos = new Elementos();
                 
                 Elementos.setId_Elemento(rs.getLong(1));
                 Elementos.setId_Tipo_Elemento(rs.getLong(2));
                 Elementos.setId_Tipo_Inventario(rs.getLong(3));
                 Elementos.setId_Marca(rs.getLong(4));
                 Elementos.setId_Estado(rs.getLong(5));
                 Elementos.setNombre_Elemento(rs.getString(6));
                 Elementos.setDescripcion_Elemento(rs.getString(7));
                
                 if(Elementos.getId_Elemento()==Id_Elemento){
                      
                      return true;
                  }

  } 
     return false;    
       }
        
        public boolean VerificarEstadoElemento(long Id_Elemento, long Id_Estado) throws SQLException{
    String Consulta =  "select * from elementos where Id_Elemento="+Id_Elemento+" and Id_Estado = "+Id_Estado+" "; 
       System.out.print(Consulta);
       
        rs = conexion.seleccionarDatos(Consulta); 
            while(rs.next()){ 

                
                 Elementos Elementos = new Elementos();
                 
                 Elementos.setId_Elemento(rs.getLong(1));
                 Elementos.setId_Tipo_Elemento(rs.getLong(2));
                 Elementos.setId_Tipo_Inventario(rs.getLong(3));
                 Elementos.setId_Marca(rs.getLong(4));
                 Elementos.setId_Estado(rs.getLong(5));
                 Elementos.setNombre_Elemento(rs.getString(6));
                 Elementos.setDescripcion_Elemento(rs.getString(7));
                
                 if(Elementos.getId_Estado()==Id_Estado){
                      
                      return true;
                  }

  } 
     return false;    
       }
        
        public boolean ProcesarEnviarBDelementos() throws SQLException {
        String Consulta = "load data local infile '/D:/mauro/SEDES PROYECTO/SEDES/web/CSV/mycsvelementos.csv' into table elementos fields terminated by ';' lines terminated by '\n' ignore 1 lines;";
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
