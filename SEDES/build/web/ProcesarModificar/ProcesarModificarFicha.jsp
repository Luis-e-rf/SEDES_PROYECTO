<%-- 
    Document   : ProcesarModificarFicha
    Created on : 3/07/2015, 07:05:02 PM
    Author     : Diego
--%>

<%@page import="Daos.DaoFicha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoFicha Ficha = new DaoFicha();
    
   
    long numero_ficha  = Long.parseLong(request.getParameter("numeroficha"));  
    String fecha_inicio    = request.getParameter("fechaFin");
    
    
    
    
    if (Ficha.ActualizarFicha(fecha_inicio, numero_ficha))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de una ficha");
            location.href="../Modificar/ModificarFicha.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos de la ficha ");
            location.href="../Modificar/ModificarFicha.jsp";
        </script>
       <%
           }
          %>