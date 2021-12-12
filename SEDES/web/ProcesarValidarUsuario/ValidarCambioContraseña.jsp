<%-- 
    Document   : newjsp
    Created on : 10/08/2015, 05:56:02 PM
    Author     : ADSI Sena

--%>

<%@page import="Daos.DaoUsuario"%>
<%@page import="Encripcion.MD5"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
long Documento_Persona; 
%> 

<%
    MD5 ecs = new MD5();
    DaoUsuario user = new DaoUsuario();
    String Usuario = request.getParameter("User");
    String contra1 = ecs.hash(request.getParameter("conActual"));
    String contra2 = ecs.hash(request.getParameter("conNueva"));

    if (user.VerificarContraseña(contra1))
    {
        if (user.ModificarUsuario(Usuario, contra2)) 
        {
          response.getWriter().write("Correcto");
          response.getWriter().flush();
          response.getWriter().close();
     
        }
        else
        {
         response.getWriter().write("Incorrecto");
          response.getWriter().flush();
          response.getWriter().close(); 
        }
    }    
    else{
         response.getWriter().write("Incorrecto");
          response.getWriter().flush();
          response.getWriter().close(); 
         
    }
    
    
    %>
        