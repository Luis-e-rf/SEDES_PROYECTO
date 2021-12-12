<%-- 
    Document   : ProcesarModificarTipoAula
    Created on : 27/07/2015, 05:03:55 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoTipoAula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoTipoAula TipoAula = new DaoTipoAula();
    
    long id_tipo_aula          = Long.parseLong(request.getParameter("IdTipoAula"));  
    String  descripcion_tipo_aula    = request.getParameter("descripciontipoaula");

    
    if (TipoAula.ModificarTipoAula(id_tipo_aula, descripcion_tipo_aula))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos del Tipo Aula");
            location.href="../Modificar/ModificarTipoAula.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del Tipo Aula ");
            location.href="../Modificar/ModificarTipoAula.jsp";
        </script>
        <%
           }
          %>