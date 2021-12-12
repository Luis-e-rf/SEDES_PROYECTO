package prueba;


import Daos.DaoAula;
import Daos.DaoSede;
import Daos.DaoUsuario;
import Encripcion.MD5;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ADSI Sena
 */
public class prueba {
     public static void main(String[] args) throws ParseException, NoSuchAlgorithmException{
       /*  DaoUsuario Usuario = new DaoUsuario();
        MD5 enc = new MD5();
        
        String Contra = "1234";
        
        String Encriptada = enc.hash(Contra);
        Usuario.AgregarUsuario("Felipe",Encriptada,1052387932,1);
         */
         
       //DaoAula au = new DaoAula();
       //au.AlmacenarAula(402,1,1,"jodase","esta mierda no sirve");
         DaoSede sed = new DaoSede ();
         sed.AlmacenarSede("Anglo","tarde de 1 pm a 7 pm", "no se");
     }
}
