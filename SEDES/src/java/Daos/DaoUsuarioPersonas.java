/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.UsuarioPersonas;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI SENA
 */
public class DaoUsuarioPersonas {
    private conexion conexion;
    private ResultSet rs;
    private UsuarioPersonas UsuarioPersonas;
    private int numero;
    public DaoUsuarioPersonas(){
        
        conexion = new conexion ();
    }

    public ArrayList ListarUsuarioPersonas(int limite) {
        ArrayList ListarUsuarioPersonas = new ArrayList();
        
        String consulta = "Select p.documento_Persona, p.Nombre_Persona, p.Apellido_Persona, p.Direccion_Persona, p.Telefono_Persona,p.Email, u.Nombre_Usuario, tu.Nombre_Tipo_usuario\n"
                + "from persona p, usuario u, tipo_usuario tu\n"
                + "where p.documento_Persona=u.documento_Persona and u.Id_Tipo_usuario=tu.Id_Tipo_usuario order by p.documento_Persona ASC limit 5 offset "+limite+";";
          
        System.out.println(consulta);
        
           try {
               rs =conexion.seleccionarDatos(consulta);
               
               while (rs.next()){
                   UsuarioPersonas = new UsuarioPersonas();
                   UsuarioPersonas.setDocumento_persona(rs.getLong(1));
                   UsuarioPersonas.setNombre_persona(rs.getString(2));
                   UsuarioPersonas.setApellido_persona(rs.getString(3));
                   UsuarioPersonas.setDireccion_persona(rs.getString(4));
                   UsuarioPersonas.setTelefono_persona(rs.getLong(5));
                   UsuarioPersonas.setEmail(rs.getString(6));
                   UsuarioPersonas.setNombre_usuario(rs.getString(7));
                   UsuarioPersonas.setNombre_tipo_usuario(rs.getString(8));
                   
                   
                   ListarUsuarioPersonas .add (UsuarioPersonas);
               }
               conexion.desconectar();
               return ListarUsuarioPersonas;
           }catch (SQLException e){
               System.out.println(e.getMessage());
               conexion.desconectar();
               
               return null;
               
           }
           
               
    }
    
    public int  ContarRegistros() throws SQLException
    {
        String consulta ="select count(documento_Persona) from persona";
        
        rs=conexion.seleccionarDatos(consulta);
        while (rs.next()){
            
            numero =rs.getInt(1);
        }
        
        conexion.desconectar();
        
        return numero;
      
    }
}

    




