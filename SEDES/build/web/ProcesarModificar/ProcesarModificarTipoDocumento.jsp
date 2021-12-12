<%-- 
    Document   : ProcesarModificarTipoDocumento
    Created on : 3/07/2015, 07:36:29 PM
    Author     : Diego
--%>

<%@page import="Daos.DaoTipoDocumento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoTipoDocumento TipoDocumento = new DaoTipoDocumento();
    
   
    long id_tipo_documento  = Long.parseLong(request.getParameter("idtipodocumento"));  
    String descripcion_tipo_documento   = request.getParameter("descripciontipodocumento");
    
    
    
    
    if (TipoDocumento.ModificarTipoDocumento(id_tipo_documento, descripcion_tipo_documento))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos del Tipo documento");
            location.href="../Modificar/ModificarTipoDocumento.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del tipo documento ");
            location.href="../Modificar/ModificarTipoDocumento.jsp";
        </script>
       <%
           }
          %>
  
