<%-- 
    Document   : ProcesarModificarAula_ficha
    Created on : 28/07/2015, 05:28:02 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoAula_ficha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoAula_ficha Aula_ficha = new DaoAula_ficha();
    
   
    long id_aula_ficha = Long.parseLong(request.getParameter("id_aula_ficha"));  
    long  id_aula = Long.parseLong(request.getParameter("id_aula"));
    
    
    
    
    if (Aula_ficha.ActualizarAula_ficha(id_aula_ficha, id_aula))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos del aula ficha");
            location.href="../Modificar/ModificarAula_ficha.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del aula ficha");
            location.href="../Modificar/ModificarAula_ficha.jsp";
        </script>
       <%
           }
          %>
