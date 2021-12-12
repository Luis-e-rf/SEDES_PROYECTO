/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.Aprendiz;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADSI Sena
 */
public class DaoAprendiz {
private conexion conexion;
    private ResultSet rs;
    private Aprendiz Aprendiz;
    private int numero;
    public DaoAprendiz(){
        
        conexion = new conexion ();
    }

    public ArrayList ListarAprendiz(int limite) {
        ArrayList ListarAprendiz = new ArrayList();
        
        String consulta = "Select td.nombre_tipo_documento, p.documento_Persona, p.Nombre_Persona, p.Apellido_Persona, p.Direccion_Persona, p.Telefono_Persona,p.Email,f.numero_ficha,pr.nombre_programa,af.id_aula\n"
                + "from persona p, tipo_persona tp,tipo_documento td,ficha f, programa pr, persona_ficha pf, aula_ficha af \n"
                + "where p.id_tipo_documento=td.id_tipo_documento and p.Id_Tipo_Persona=tp.id_Tipo_Persona and p.documento_Persona=pf.documento_Persona and f.numero_ficha=pf.numero_ficha and  pr.id_programa=f.id_programa and tp.Nombre_Tipo_Persona='Aprendiz' and af.numero_ficha=f.numero_ficha order by  f.numero_ficha,p.Nombre_Persona ASC limit 5 offset "+limite+";";
          
        System.out.println(consulta);
        
           try {
               rs =conexion.seleccionarDatos(consulta);
               
               while (rs.next()){
                   Aprendiz = new Aprendiz();
                   Aprendiz.setNombre_tipo_documento(rs.getString(1));
                   Aprendiz.setDocumento_persona(rs.getLong(2));
                   Aprendiz.setNombre_persona(rs.getString(3));
                   Aprendiz.setApellido_persona(rs.getString(4));
                   Aprendiz.setDireccion_persona(rs.getNString(5));
                   Aprendiz.setTelefono_persona(rs.getLong(6));
                   Aprendiz.setEmail(rs.getNString(7));
                   Aprendiz.setNumero_ficha(rs.getLong(8));
                   Aprendiz.setNombre_programa(rs.getString(9));
                   Aprendiz.setId_aula(rs.getLong(10));
                      
                   ListarAprendiz.add (Aprendiz);
               }
               conexion.desconectar();
               return ListarAprendiz;
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