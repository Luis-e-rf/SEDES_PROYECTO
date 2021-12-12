<%-- 
    Document   : ProcesarModificarMarca
    Created on : 25/08/2015, 02:38:15 PM
    Author     : Diego
--%>

<%@page import="Daos.DaoMarca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoMarca Marca = new DaoMarca();
    
    long id_Marca  = Long.parseLong(request.getParameter("idMarca"));  
    String Nombre_Marca = request.getParameter("NombreMarca");
    String Descripcion_Marca = request.getParameter("DescripcionMarca");
    
    if (Marca.ActualizarMarca(id_Marca, Nombre_Marca, Descripcion_Marca))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de Una Marca");
            location.href="../Modificar/ModificarMarca.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos de la Marca ");
            location.href="../Modificar/ModificarMarca.jsp";
        </script>
        <%
           }
          %>
