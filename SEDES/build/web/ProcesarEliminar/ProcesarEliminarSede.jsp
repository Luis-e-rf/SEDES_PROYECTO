<%-- 
    Document   : ProcesarEliminarSede
    Created on : 8/07/2015, 04:56:57 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoSede"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    DaoSede Sede = new DaoSede();
    
    long id_sede  = Long.parseLong(request.getParameter("IdSede"));
    
    if (Sede.EliminarSede(id_sede))
    {
%> 
                                    <script languaje="javascript">
                                    alert("Has Eliminado la Sede");
                                    location.href="../Eliminar/EliminarSede.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                    <script languaje="javascript">
                                    alert("No Se Ha Eliminado la Sede");
                                    location.href="../Eliminar/EliminarSede.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
