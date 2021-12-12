/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Clases.Instructor;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin_Sena
 */
public class DaoInstructor {
    private conexion conexion;
    private ResultSet rs;
    private Instructor Inst;
    private int numero;
    public DaoInstructor(){
        
        conexion = new conexion ();
    }

    public ArrayList ListarInstructor(int limite) {
        ArrayList ListarInstructor = new ArrayList();
        
        String consulta = "Select td.nombre_tipo_documento, p.documento_Persona, p.Nombre_Persona, p.Apellido_Persona, p.Direccion_Persona, p.Telefono_Persona,p.Email,f.numero_ficha,pr.nombre_programa,af.id_aula\n"
                + "from persona p, tipo_persona tp,tipo_documento td,ficha f, programa pr, persona_ficha pf ,aula_ficha af \n"
                + "where p.id_tipo_documento=td.id_tipo_documento and p.Id_Tipo_Persona=tp.id_Tipo_Persona and p.documento_Persona=pf.documento_Persona and f.numero_ficha=pf.numero_ficha and  pr.id_programa=f.id_programa and tp.Nombre_Tipo_Persona='Instructor' and af.numero_ficha=f.numero_ficha order by  f.numero_ficha ASC limit 5 offset "+limite+";";
          
        System.out.println(consulta);
        
           try {
               rs =conexion.seleccionarDatos(consulta);
               
               while (rs.next()){
                   Inst = new Instructor();
                   Inst.setNombre_tipo_documento(rs.getString(1));
                   Inst.setDocumento_persona(rs.getLong(2));
                   Inst.setNombre_persona(rs.getString(3));
                   Inst.setApellido_persona(rs.getString(4));
                   Inst.setDireccion_persona(rs.getNString(5));
                   Inst.setTelefono_persona(rs.getLong(6));
                   Inst.setEmail(rs.getNString(7));
                   Inst.setNumero_ficha(rs.getLong(8));
                   Inst.setNombre_programa(rs.getString(9));
                   Inst.setId_aula(rs.getLong(10));
                   
                      
                   ListarInstructor.add (Inst);
               }
               conexion.desconectar();
               return ListarInstructor;
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
