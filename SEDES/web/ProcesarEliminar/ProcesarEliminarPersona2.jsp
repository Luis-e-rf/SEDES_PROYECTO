<%-- 
    Document   : ProcesarEliminarPersona
    Created on : 09-jul-2015, 13:54:13
    Author     : JupiterPC
--%>

<%@page import="Daos.DaoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    DaoPersona Persona = new DaoPersona();
    
    long documento_Persona=Long.parseLong(request.getParameter("DocumentoPersona"));
    
    if (Persona.EliminarPersona(documento_Persona))
    {
%> 
                                    <script languaje="javascript">
                                    alert("Has Eliminado una Persona");
                                    location.href="../Listar/ListarAprendiz.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                    <script languaje="javascript">
                                    alert("No Se Ha Eliminado La Persona");
                                    location.href="../Listar/ListarAprendiz.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>