<%-- 
    Document   : ValidarCorreo
    Created on : 12/08/2015, 06:18:22 PM
    Author     : ADSI Sena
--%>

<%@page import="Encripcion.MD5"%>
<%@page import="Recuperacion.RecuperacionContraseña"%>
<%@page import="Daos.DaoUsuario"%>
<%@page import="Daos.DaoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    DaoUsuario User = new DaoUsuario();
    MD5 mdf = new MD5();
    RecuperacionContraseña rec = new RecuperacionContraseña();
    
    
    String Email = request.getParameter("Email");
    
    String Usuario=User.VerificarCorreo(Email);
    
    if(Usuario!=null)
    {
        User.ModificarUsuario(Usuario, mdf.hash("Olvido123"));
        if(rec.enviarcorreo(Email))
        {
        %>
        <script>
               alert("Por favor verifique la nueva contraseña en su Correo");
               location.href=("../paginas/ingresar.jsp");
        </script>
        
        <%
        }
        else
        {
        %>
        <script>
               alert("Parece que Hay Problemas con El Correo Intente Mas Tarde");
               location.href=("../paginas/ingresar.jsp");
        </script>
        
        <% 
        }
        
    }
    else
        {
        %>
        <script>
               alert("Su Correo Electrónico no está Registrado");
               location.href=("../paginas/ingresar.jsp");
        </script>
        
        <% 
        }
    
    
    
%>
