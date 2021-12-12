<%-- 
    Document   : ProcesarModificarAula
    Created on : 3/07/2015, 05:31:55 PM
    Author     : Diego
--%>

<%@page import="Daos.DaoAula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    DaoAula Aula = new DaoAula();
    
    long id_aula  = Long.parseLong(request.getParameter("id_aula"));  
    String nombre_aula = request.getParameter("nombre_aula");
    String observaciones_aula = request.getParameter("observaciones_aula");
    
    if (Aula.ActualizarAula(nombre_aula, id_aula, observaciones_aula))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de un aula");
            location.href="../Modificar/ModificarAula.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del aula ");
            location.href="../Modificar/ModificarAula.jsp";
        </script>
        <%
           }
          %>
        
          
       
  
