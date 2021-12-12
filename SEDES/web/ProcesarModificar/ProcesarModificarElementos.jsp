<%-- 
    Document   : ProcesarModificarElementos
    Created on : 27/07/2015, 04:59:20 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoElementos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoElementos Elementos = new DaoElementos();
    
    long Id_Elemento   = Long.parseLong(request.getParameter("IdElemento"));  
    long Id_Tipo_Inventario = Long.parseLong(request.getParameter("tipoInven"));
    String Nombre_Elemento    = request.getParameter("NombreElemento");
    String Descripcion_Elemento    = request.getParameter("DescripcionElemento");
    
   
    if (Elementos.ActualizarElemento(Id_Elemento, Id_Tipo_Inventario, Nombre_Elemento, Descripcion_Elemento))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de un Elemento");
            location.href="../Modificar/ModificarElementos.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del Elemento ");
            location.href="../Modificar/ModificarElementos.jsp";
        </script>
        <%
           }
          %>
