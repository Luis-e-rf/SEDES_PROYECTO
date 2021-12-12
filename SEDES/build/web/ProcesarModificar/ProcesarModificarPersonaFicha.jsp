<%-- 
    Document   : ProcesarModificarPersonaFicha
    Created on : 28/07/2015, 05:42:55 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoPersonaFicha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoPersonaFicha PersonaFicha = new DaoPersonaFicha();
    
    long numero_ficha           = Long.parseLong(request.getParameter("numeroficha"));  
    long id_persona_ficha           = Long.parseLong(request.getParameter("idpersonaficha")); 

    
    if (PersonaFicha.ModificarPersonaFicha(id_persona_ficha, numero_ficha))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de una Persona Ficha");
            location.href="../Modificar/ModificarPersonaFicha.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos deuna Persona Ficha ");
            location.href="../Modificar/ModificarPersonaFicha.jsp";
        </script>
        <%
           }
          %>
