<%-- 
    Document   : ProcesarModificarAula_horario
    Created on : 28/07/2015, 05:31:17 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoAula_horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoAula_horario Aula_horario = new DaoAula_horario();
    
   
    long id_aula_horario  = Long.parseLong(request.getParameter("idaulahorario"));  
    long  id_horario = Long.parseLong(request.getParameter("IdHorario"));
    
    
    
    
    if (Aula_horario.ActualizarAula_horario(id_horario, id_aula_horario))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos del aula horario");
            location.href="../Modificar/ModificarAula_horario.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del aula horario");
            location.href="../Modificar/ModificarAula_horario.jsp";
        </script>
       <%
           }
          %>
