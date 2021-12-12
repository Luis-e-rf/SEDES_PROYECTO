/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;


import Clases.Prestamos;
import Clases.Elementos;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI SENA
 */
public class DaoPrestamos 
{
    
     private conexion conexion;
   
      private Prestamos Prestamo ;
      private Elementos Elemento;
    private ResultSet rs;
      private SQLException e;
    public DaoPrestamos(){
        
        conexion = new conexion();
    }
    public boolean AlmacenarPrestamos (long documento_Persona,long Id_Elemento, String Fecha_Prestamos, String Hora_Prestamos)
    {
       
        String consulta = "insert into prestamos (documento_Persona,Id_Elemento,Fecha_Prestamos,Hora_Prestamos) values ("+documento_Persona+","+Id_Elemento+", '"+Fecha_Prestamos+"', '"+Hora_Prestamos+"');";
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
    public boolean EliminarPrestamos (long documento_Persona)
    {
       
        String consulta = "delete from prestamos where documento_Persona="+documento_Persona+";";
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
    
    public boolean ModificarPrestamo(long documento_Persona,String Fecha_Entrega, String Hora_entrega, String Observaciones)
    {
        
        String Consulta = "UPDATE prestamos SET Fecha_Entrega='"+Fecha_Entrega+"',Hora_entrega='"+Hora_entrega+"',Observaciones='"+Observaciones+"' WHERE documento_Persona="+documento_Persona+";";
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
    
    public boolean EntregarPrestamo(long documento_Persona,String Fecha_Entrega, String Hora_entrega, String Observaciones )
    {
        
        String Consulta = "UPDATE prestamos SET Fecha_Entrega='"+Fecha_Entrega+"',Hora_entrega='"+Hora_entrega+"',Observaciones='"+Observaciones+"' WHERE documento_Persona="+documento_Persona+";";
        System.out.println(Consulta);
        /*se crea un nuevo metodo para la entrega del prestamo que permite ingresar los datos faltantes */
        if (conexion.modificarDatos(Consulta))
        {
            /* se cierra la conexion si se cumple la condicion*/
            conexion.desconectar();
            return true;
        
        }
        
        else
        {
            conexion.desconectar();/* se cierra la conexion si no se cumple*/
            return false;
        }
        
        
        }


 public ArrayList ListarPrestamo() throws SQLException{
           ArrayList ListarPrestamo = new ArrayList();
           String Consulta= "select * from prestamos";
           try{
               rs = conexion.seleccionarDatos(Consulta);
               while (rs.next()){
                 Prestamo = new Prestamos();
                 Prestamo.setId_Prestamos(rs.getLong(1));
                 Prestamo.setDocumento_Persona(rs.getLong(2));
                 Prestamo.setId_Elemento(rs.getLong(3));
                 Prestamo.setFecha_Prestamos(rs.getDate(4));
                 Prestamo.setHora_Prestamos(rs.getTime(5));
                 Prestamo.setFecha_Entrega(rs.getDate(6));
                 Prestamo.setHora_entrega(rs.getTime(7));
                 Prestamo.setObservaciones(rs.getString(8));
               
               
                
                
               
                    ListarPrestamo.add(Prestamo);
               
                 }
               conexion.desconectar();
                 return ListarPrestamo;
            }
           catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
        return null;
            }
           
           
}
    
 public ArrayList ListarPrestamo(long Id_Prestamos){ // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar
   
    ArrayList ListarPrestamo = new ArrayList(); // Creamos un nuevo Array List 
    
    String Consulta = "select * from prestamos where Id_Prestamos ="+Id_Prestamos+""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.
       
    try{
        rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
            while(rs.next()){ // Creamos el while para tomar los datos.

                // Creamos una nueva instacia de la clase que vamos a usar.
                
                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                 Prestamo = new Prestamos();
                 Prestamo.setId_Prestamos(rs.getLong(1));
                 Prestamo.setDocumento_Persona(rs.getLong(2));
                 Prestamo.setId_Elemento(rs.getLong(3));
                 Prestamo.setFecha_Prestamos(rs.getDate(4));
                 Prestamo.setHora_Prestamos(rs.getTime(5));
                 Prestamo.setFecha_Entrega(rs.getDate(6));
                 Prestamo.setHora_entrega(rs.getTime(7));
                 Prestamo.setObservaciones(rs.getString(8));
               
                 
              
                
                //Adicionamos cada uno de esos valores al Array List.
                ListarPrestamo.add(Prestamo);
               }
               // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarPrestamo;
        }
    catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
    }

    }
 public ArrayList ListarPrestamoDoc(long documento_Persona){ // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar
   
    ArrayList ListarPrestamoDoc = new ArrayList(); // Creamos un nuevo Array List 
    
    String Consulta = "select * from prestamos where documento_Persona ="+documento_Persona+""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.
       
    try{
        rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
            while(rs.next()){ // Creamos el while para tomar los datos.

                // Creamos una nueva instacia de la clase que vamos a usar.
                
                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                 Prestamo = new Prestamos();
                 Prestamo.setId_Prestamos(rs.getLong(1));
                 Prestamo.setDocumento_Persona(rs.getLong(2));
                 Prestamo.setId_Elemento(rs.getLong(3));
                 Prestamo.setFecha_Prestamos(rs.getDate(4));
                 Prestamo.setHora_Prestamos(rs.getTime(5));
                 Prestamo.setFecha_Entrega(rs.getDate(6));
                 Prestamo.setHora_entrega(rs.getTime(7));
                 Prestamo.setObservaciones(rs.getString(8));
               
                 
              
                
                //Adicionamos cada uno de esos valores al Array List.
                ListarPrestamoDoc.add(Prestamo);
               }
               // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarPrestamoDoc;
        }
    catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
    }

    }
 public boolean VerificarPrestamo(long documento_Persona) throws SQLException{
    String Consulta =  "select * from prestamos where documento_Persona ="+documento_Persona+""; 
       System.out.print(Consulta);
       
        rs = conexion.seleccionarDatos(Consulta); 
            while(rs.next()){ 

                
                 Prestamo = new Prestamos();
                 Prestamo.setId_Prestamos(rs.getLong(1));
                 Prestamo.setDocumento_Persona(rs.getLong(2));
                 Prestamo.setId_Elemento(rs.getLong(3));
                 Prestamo.setFecha_Prestamos(rs.getDate(4));
                 Prestamo.setHora_Prestamos(rs.getTime(5));
                 Prestamo.setFecha_Entrega(rs.getDate(6));
                 Prestamo.setHora_entrega(rs.getTime(7));
                 Prestamo.setObservaciones(rs.getString(8));
                
                 if(Prestamo.getDocumento_Persona()==documento_Persona){
                      
                      return true;
                  }

  } 
     return false;    
       }
 
 public boolean VerificarPrestamoEstadoPersona(long documento_Persona, long Id_Elemento, long Id_Estado) throws SQLException{
    String Consulta =  "select p.documento_Persona, e.Id_Elemento, e.Id_Estado \n"
            + "from prestamos p, elementos e \n"
            + "where p.documento_Persona ="+documento_Persona+" and e.Id_Elemento="+Id_Elemento+" and e.Id_Estado=2"; 
       System.out.print(Consulta);
       
        rs = conexion.seleccionarDatos(Consulta); 
            while(rs.next()){ 

                
                 Prestamo = new Prestamos();
                 Elemento = new Elementos();
                 Prestamo.setId_Prestamos(rs.getLong(1));
                 Prestamo.setDocumento_Persona(rs.getLong(2));
                 Prestamo.setId_Elemento(rs.getLong(3));
                 Prestamo.setFecha_Prestamos(rs.getDate(4));
                 Prestamo.setHora_Prestamos(rs.getTime(5));
                 Prestamo.setFecha_Entrega(rs.getDate(6));
                 Prestamo.setHora_entrega(rs.getTime(7));
                 Prestamo.setObservaciones(rs.getString(8));
                 
                 Elemento.setId_Elemento(rs.getLong(1));
                 Elemento.setId_Tipo_Elemento(rs.getLong(2));
                 Elemento.setId_Tipo_Inventario(rs.getLong(3));
                 Elemento.setId_Marca(rs.getLong(4));
                 Elemento.setId_Estado(rs.getLong(5));
                 Elemento.setNombre_Elemento(rs.getString(6));
                 Elemento.setDescripcion_Elemento(rs.getString(7));
                
                 if(Prestamo.getDocumento_Persona()==documento_Persona){
                     if(Elemento.getId_Elemento()==Id_Elemento){
                         if(Elemento.getId_Estado()==Id_Estado){
                             
                             return true;
                             
                         }
                     }                       
                  }

  } 
     return false;    
       }
 
 public ArrayList ListarPrestamos(int limite) {
        ArrayList ListarPrestamos = new ArrayList();
        
        String consulta = "Select p.Id_Prestamos, p.documento_Persona, p.Fecha_Prestamos, p.Hora_Prestamos, p.Fecha_Entrega,p.Hora_entrega, p.Observaciones/n"
                +"from prestamo p/n"
                +"where order by p.Id_Prestamos ASC limit 5 offset "+limite+";";
                
          
        System.out.println(consulta);
        
           try {
               rs =conexion.seleccionarDatos(consulta);
               
               while (rs.next()){
                   Prestamo = new Prestamos();
                   Prestamo.setId_Prestamos(rs.getLong(1));
                 Prestamo.setDocumento_Persona(rs.getLong(2));
                 Prestamo.setId_Elemento(rs.getLong(3));
                 Prestamo.setFecha_Prestamos(rs.getDate(4));
                 Prestamo.setHora_Prestamos(rs.getTime(5));
                 Prestamo.setFecha_Entrega(rs.getDate(6));
                 Prestamo.setHora_entrega(rs.getTime(7));
                 Prestamo.setObservaciones(rs.getString(8));

                   ListarPrestamos.add(Prestamo);
               }
               conexion.desconectar();
               return ListarPrestamos;
           }catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
               
               return null;
               
           }
           
               
    }

    public int  ContarRegistrosP() throws SQLException
    {
        String consulta ="select count(Id_Prestamos) from prestamos";
        
        rs=conexion.seleccionarDatos(consulta);
         int numero = 0;
        while (rs.next()){
            
            numero =rs.getInt(1);
        }
        
        conexion.desconectar();
        
        return numero;
      
    }


    
}
 
    

