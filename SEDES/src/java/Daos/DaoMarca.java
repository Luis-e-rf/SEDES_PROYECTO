/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.Marca;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Diego
 */
public class DaoMarca {
  
    private conexion conexion;
    
    private ResultSet rs;
    
        public DaoMarca(){
        
        conexion = new conexion();
        }
        public boolean AlmacenarMarca (String Nombre_Marca, String Descripcion_Marca )
        {
            String consulta = "insert into marca (Nombre_Marca,Descripcion_Marca) values ('"+Nombre_Marca+"','"+Descripcion_Marca+"');";
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
        
        public boolean EliminarMarca (long idMarca)
        {
            String consulta = "delete from marca where idMarca="+idMarca+";";
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
        
        public boolean ActualizarMarca (long idMarca,String Nombre_Marca,String Descripcion_Marca )
        {
        String consulta = "UPDATE marca SET Nombre_Marca='"+Nombre_Marca+"',Descripcion_Marca='"+Descripcion_Marca+"' WHERE idMarca =("+idMarca+");";
        
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
        public ArrayList listarMarca() throws SQLException{
           ArrayList listarMarca = new ArrayList();
           String Consulta= "select * from marca";
           try{
               rs = conexion.seleccionarDatos(Consulta);
               while (rs.next()){
                 Marca Marca = new Marca();
                 
                 Marca.setIdMarca(rs.getLong(1));
                 Marca.setNombre_Marca(rs.getString(2));
                 Marca.setDescripcion_Marca(rs.getString(3));
               
                    listarMarca.add(Marca);
               
                 }
               conexion.desconectar();
                 return listarMarca;
            }
           catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
        return null;
            }
          }
        
        public ArrayList ListarMarcaUnico(Long idMarca){ 
   
    ArrayList ListarMarca = new ArrayList(); 
    
    String Consulta = "select * from marca where idMarca ="+idMarca+""; 
    try{
        rs = conexion.seleccionarDatos(Consulta); 
            while(rs.next()){ 

                Marca Marca = new Marca(); 
                
                
                 Marca.setIdMarca(rs.getLong(1));
                 Marca.setNombre_Marca(rs.getString(2));
                 Marca.setDescripcion_Marca(rs.getString(3));
                
                
                ListarMarca.add(Marca);
               }
               
            conexion.desconectar();
            return ListarMarca;
            }
    catch(SQLException e){
            System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
       
        }

    }
}

    

