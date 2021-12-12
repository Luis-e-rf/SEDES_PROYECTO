<%-- 
    Document   : ProcesarModificarSedeInventario
    Created on : 28/07/2015, 05:53:59 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoSedeInventario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoSedeInventario SedeInventario = new DaoSedeInventario();
    
    long Id_Sede_inventario           = Long.parseLong(request.getParameter("IdSedeInventario"));  
    long Id_Tipo_Inventario           = Long.parseLong(request.getParameter("IdTipoInventario"));

    
    if (SedeInventario.ModificarSedeInventario(Id_Sede_inventario, Id_Tipo_Inventario))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de una Sede inventario");
            location.href="../Modificar/ModificarSedeInventario.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos de la  Sede Inventario ");
            location.href="../Modificar/ModificarSedeInventario.jsp";
        </script>
        <%
           }
          %>
        
