<%-- 
    Document   : ProcesarModificarTipoElemento
    Created on : 25/08/2015, 02:41:20 PM
    Author     : Diego
--%>

<%@page import="Daos.DaoTipoElemento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoTipoElemento TipoElemento = new DaoTipoElemento();
    
    long Id_Tipo_Elemento  = Long.parseLong(request.getParameter("IdTipoElemento"));  
    String Nombre_Tipo_Elemento = request.getParameter("NombreTipoElemento");
    String Descripcion_Tipo_Elemento = request.getParameter("DescripcionTipoElemento");
    
    if (TipoElemento.ModificarTipoElemento(Id_Tipo_Elemento, Nombre_Tipo_Elemento, Descripcion_Tipo_Elemento))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de un Tipo Elemento");
            location.href="../Modificar/ModificarTipoElemento.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del Tipo Elemento ");
            location.href="../Modificar/ModificarTipoElemento.jsp";
        </script>
        <%
           }
          %>