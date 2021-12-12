<%-- 
    Document   : ProcesarModificarTipoInventario
    Created on : 27/07/2015, 05:07:25 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoTipoInventario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoTipoInventario TipoInventario = new DaoTipoInventario();
    
    long Id_Tipo_Inventario          = Long.parseLong(request.getParameter("IdTipoInventario"));  
    String Nombre_Tipo_Inventario    = request.getParameter("NombreTipoInventario");
    String Descripcion_Tipo_Inventario = request.getParameter("DescripcionTipoInventario");
    
    if (TipoInventario.ModificarTipoInventario(Id_Tipo_Inventario, Nombre_Tipo_Inventario, Descripcion_Tipo_Inventario))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de un Tipo Inventario");
            location.href="../Modificar/ModificarTipoInventario.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del TipoInventario ");
            location.href="../Modificar/ModificarTipoInventario.jsp";
        </script>
        <%
           }
          %>
