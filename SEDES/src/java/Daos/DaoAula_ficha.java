/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;
import conexion.conexion;
import Clases.Aula_ficha;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

        
/**
 *
 * @author ADSI Sena
 */
public class DaoAula_ficha {
    
     private    conexion conexion;
      private ResultSet rs;
      public DaoAula_ficha()
      {
      conexion = new conexion();
      }
       public boolean almacenarAula_ficha (long numero_ficha, long id_aula){
            String consulta = "insert into aula_ficha (numero_ficha,id_aula) values('"+numero_ficha+"','"+id_aula+"');";
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
        public boolean eleminarAula_ficha (long id_aula_ficha)
    {
       
        String consulta = "delete from aula_ficha where id_aula_ficha="+id_aula_ficha+";";
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
        public boolean ActualizarAula_ficha(long id_aula_ficha,long id_aula)
    {
        String consulta = "UPDATE aula_ficha SET id_aula="+id_aula+"WHERE id_aula_ficha=("+id_aula_ficha+");";
        
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
         public ArrayList listarAula_ficha() throws SQLException{
           ArrayList listaraula_ficha = new ArrayList();
           String Consulta= "select * from aula_ficha";
           try{
               rs = conexion.seleccionarDatos(Consulta);
               Aula_ficha Aula_ficha;
               while (rs.next()){
                   Aula_ficha  = new Aula_ficha();
                 Aula_ficha.setId_aula_ficha(rs.getLong(1));
                 Aula_ficha.setNumero_ficha(rs.getLong(2));
                 Aula_ficha.setId_aula(rs.getLong(3));
    
                  listaraula_ficha.add(Aula_ficha);
               
                 }
               conexion.desconectar();
                 return listaraula_ficha;
            }
           catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
        return null;
            }
}
         public ArrayList ListarAula_fichaUnica(long id_aula_ficha){ // Creamos un nuevo método y por parámetro se recibe la llave primaria de la tabla que vayamos a listar
   
    ArrayList ListarAula_ficha = new ArrayList(); // Creamos un nuevo Array List 
    
    String Consulta = "select * from aula_ficha where id_aula_ficha ="+id_aula_ficha+""; // En Un String creamos la consulta, como pueden ver lleva el valor de llave primaria que pedimos por parámetro del método.
       
    try{
        rs = conexion.seleccionarDatos(Consulta); // Enviamos la consulta a la Base de Datos.
            while(rs.next()){ // Creamos el while para tomar los datos.

                Aula_ficha aula_ficha= new Aula_ficha(); // Creamos una nueva instacia de la clase que vamos a usar.
                
                //Tomamos cada uno de los valores que nos devuelve la Base de Datos.
                aula_ficha.setId_aula_ficha(rs.getLong(1));
                aula_ficha.setNumero_ficha(rs.getLong(2));
                aula_ficha.setId_aula(rs.getLong(3));
               
                
                //Adicionamos cada uno de esos valores al Array List.
                ListarAula_ficha.add(aula_ficha);
               }
               // Cerramos la conexion y devolvemos el Array List con los datos.
            conexion.desconectar();
            return ListarAula_ficha;
        }
    catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
}
         }
}