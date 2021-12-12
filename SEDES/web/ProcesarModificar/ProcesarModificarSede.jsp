<%-- 
    Document   : ProcesarModificarSede
    Created on : 3/07/2015, 07:33:36 PM
    Author     : Diego
--%>

<%@page import="Daos.DaoSede"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoSede Sede = new DaoSede();
    
   
    long id_sede = Long.parseLong(request.getParameter("idsede"));  
    String nombre_sede   = request.getParameter("nombresede");
    String Horario_sede   = request.getParameter("horariosede");
    String observaciones_sede   = request.getParameter("observacionessede");
    
    
    
    
    
    if (Sede.ActualizarSede(id_sede, nombre_sede, Horario_sede, observaciones_sede))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de una sede");
            location.href="../Modificar/ModificarSedes.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos de la sede  ");
            location.href="../Modificar/ModificarSedes.jsp";
        </script>
       <%
           }
          %>
  
