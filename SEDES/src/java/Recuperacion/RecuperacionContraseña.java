/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Recuperacion;

import java.sql.SQLException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



/**
 *
 * @author Diego
 */
public class RecuperacionContraseña {
    public boolean enviarcorreo(String  para) throws SQLException
    
    {
     String clave ="adminsedes";
     String De = "adsedessena1.0@gmail.com";
     String asunto ="Recuperar Contraseña";
     String ContraM = "Olvido123";
     
     String mensaje="Su contraseña a sido modificada, la nueva contraseña es: "+ContraM; 
     
     try{
         
         String host = "smtp.gmail.com";
         
         
         Properties prop = System.getProperties();
         
         
         prop.put("mail.smtp.starttls.enable","true");
         prop.put("mail.smtp.host", host);
         prop.put("mail.smtp.user", De);
         prop.put("mail.smtp.password", clave);
         prop.put("mail.smtp.port", 587);
         prop.put("mail.smtp.auth", "true");
         
         Session sesion = Session.getDefaultInstance(prop,null);
         
         MimeMessage message = new MimeMessage (sesion);
         
         message.setFrom ( new InternetAddress(De));
         
         message.setRecipient(Message.RecipientType.TO,new InternetAddress(para));
         
         message.setSubject(asunto);
         message.setText(mensaje);
         
         Transport transport = sesion.getTransport("smtp");
         
         transport.connect(host,De,clave);
         
         transport.sendMessage(message, message.getAllRecipients());
         transport.close();
         
          return true;
         
         
      }catch(Exception e)
      {
          
          System.out.print(e);
          return false;
         
      }
     
     
    }
    
}
    

