<%-- 
    Document   : ProcesarModificarTipoPersona
    Created on : 28/07/2015, 05:56:15 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoTipoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoTipoPersona TipoPersona = new DaoTipoPersona();
    
    long id_Tipo_Persona           = Long.parseLong(request.getParameter("idTipoPersona"));  
    String Nombre_Tipo_Persona    = request.getParameter("NombreTipoPersona");
    String Descripcion_Tipo_Persona    = request.getParameter("DescripcionTipoPersona");

    
    if (TipoPersona.ModificarTipoPersona(id_Tipo_Persona, Nombre_Tipo_Persona, Descripcion_Tipo_Persona))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de un Tipo Persona");
            location.href="../Modificar/ModificarTipoPersona.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del Tipo persona ");
            location.href="../Modificar/ModificarTipoPersona.jsp";
        </script>
        <%
           }
          %>
        