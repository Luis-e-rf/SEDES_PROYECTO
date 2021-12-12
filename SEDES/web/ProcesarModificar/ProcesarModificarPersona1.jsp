<%-- 
    Document   : ProcesarModificarPersona
    Created on : 3/07/2015, 07:18:22 PM
    Author     : Diego
--%>

<%@page import="Daos.DaoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoPersona Persona = new DaoPersona();
    
   
    long documento_Persona  = Long.parseLong(request.getParameter("DocumentoPersona"));  
    String Direccion_Persona   = request.getParameter("DireccionPersona");
    long Telefono_Persona  = Long.parseLong(request.getParameter("TelefonoPersona"));  
    String Email=request.getParameter("Email");
    
    
    
    if (Persona.ModificarPersona(documento_Persona, Direccion_Persona, Telefono_Persona, Email))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de una Persona");
            location.href="../Listar/ListarAprendiz.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos de la Persona ");
            location.href="../Listar/ListarAprendiz.jsp";
        </script>
       <%
           }
          %>