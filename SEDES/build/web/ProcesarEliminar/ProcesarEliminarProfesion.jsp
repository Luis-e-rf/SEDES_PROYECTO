<%-- 
    Document   : ProcesarEliminarProfesion
    Created on : 8/07/2015, 04:55:46 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoProfesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    DaoProfesion Profesion = new DaoProfesion();
    
    long id_profesion  = Long.parseLong(request.getParameter("id_profesion"));
    
    if (Profesion.EliminarProfesion(id_profesion))
    {
%> 
                                    <script languaje="javascript">
                                    alert("Has Eliminado la Profesion");
                                    location.href="../Eliminar/EliminarProfesion.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                    <script languaje="javascript">
                                    alert("No Se Ha Eliminado La Profesion");
                                    location.href="../Eliminar/EliminarProfesion.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
