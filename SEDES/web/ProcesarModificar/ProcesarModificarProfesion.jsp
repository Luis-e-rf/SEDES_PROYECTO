<%-- 
    Document   : ProcesarModificarProfesion
    Created on : 3/07/2015, 07:22:25 PM
    Author     : Diego
--%>

<%@page import="Daos.DaoProfesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
    DaoProfesion Profesion = new DaoProfesion();
    
   
    long id_profesion  = Long.parseLong(request.getParameter("IdProfesion"));  
    String nombre_profesion   = request.getParameter("NombreProfesion");
    String descripcion_profesion   = request.getParameter("DescripcionProfesion");
    
    
    
    
    if (Profesion.ActualizarProfesion(id_profesion, nombre_profesion, descripcion_profesion))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de una Profesion");
            location.href="../Modificar/ModificarProfesion.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos de la Profesion ");
            location.href="../Modificar/ModificarProfesion.jsp";
        </script>
       <%
           }
          %>
  
