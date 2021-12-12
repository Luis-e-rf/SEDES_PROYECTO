<%-- 
    Document   : ProcesarAgregarTipoDocumento
    Created on : 6/07/2015, 03:05:13 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoTipoDocumento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoTipoDocumento TipoDocumento = new DaoTipoDocumento();     
     String nombre_tipo_documento = request.getParameter("NombreDoc");     
     String descripcion_tipo_documento = request.getParameter("DescripcionDoc");
    
    if (TipoDocumento.AgregarTipoDocumento(nombre_tipo_documento, descripcion_tipo_documento))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has Ingresado Un Nuevo Documento");
            location.href="../Agregar/AgregarTipoDocumento.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No Se Ha Ingresado El Programa");
            location.href="../Agregar/AgregarTipoDocumento.jsp";
        </script>
        <%
           }
          %>