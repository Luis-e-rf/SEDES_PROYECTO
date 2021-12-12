/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author Adsi Sena
 */
public class conexion {
    
    
  private Statement stmt;
    private java.sql.Connection con;
    private String url;
    private String driver;
    private ResultSet rs;
    
    
    public conexion() {
    }
    
    public void conectar(){
    
        
        try{
            
        driver ="com.mysql.jdbc.Driver";
        Class.forName(driver);
        url= "jdbc:mysql://localhost/sedes";
        
        con= DriverManager.getConnection(url, "root","123456");
        stmt= con.createStatement();     
        
        System.out.println("Conexion con Exito");
        
        }catch (SQLException e){
        
        e.printStackTrace();
        }
        catch(ClassNotFoundException e){
        System.out.println("Mensaje de error de base de datos" + e.getMessage());
        
        }
        }
    
    public void desconectar(){
    
        try{
        
        stmt.close();
        con.close();
        
         System.out.println("Conexion Terminada");
        }catch(SQLException e){
        e.printStackTrace();
        }
        }
        
    

    public boolean insertarDatos(String consulta){
    try {
        
        conectar();
        stmt.execute(consulta);
        return true;
        
    }
    
    catch(SQLException e){
    System.out.println(e.getMessage());
    return false;
    }
    
    
    
    }
    public ResultSet seleccionarDatos (String consulta){
    try{
        
    conectar();
    rs= stmt.executeQuery(consulta);
    return rs;
    }
    catch(SQLException e){
    System.out.println(e.getMessage());
    return rs;
    }
    
    }    
    public boolean eliminarDatos(String consulta){
    try {
        
        conectar();
        stmt.execute(consulta);
        return true;
        
    }
    
    catch(SQLException e){
    System.out.println(e.getMessage());
    return false;
    }
    }
    
    public boolean modificarDatos(String consulta){
    try {
        
        conectar();
        stmt.execute(consulta);
        return true;
        
    }
    
    catch(SQLException e){
    System.out.println(e.getMessage());
    return false;
    }
    }

  
    }