<%-- 
    Document   : ProcesarModificarTipoUsuario
    Created on : 28/07/2015, 05:58:27 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoTipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoTipoUsuario TipoUsuario = new DaoTipoUsuario();
    
    long Id_Tipo_usuario           = Long.parseLong(request.getParameter("IdTipousuario"));  
    String Nombre_Tipo_usuario    = request.getParameter("NombreTipousuario");
    String Descripcion_Tipo_usuario    = request.getParameter("DescripcionTipousuario");
    
    if (TipoUsuario.ModificarTipoUsuario(Id_Tipo_usuario, Nombre_Tipo_usuario, Descripcion_Tipo_usuario))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de un Tipo Usuario");
            location.href="../Modificar/ModificarTipoUsuario.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del tipo usuario ");
            location.href="../Modificar/ModificarTipoUsuario.jsp";
        </script>
        <%
           }
          %>
        
