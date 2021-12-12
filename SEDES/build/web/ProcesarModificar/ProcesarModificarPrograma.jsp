<%-- 
    Document   : ProcesarModificarPrograma
    Created on : 3/07/2015, 07:28:19 PM
    Author     : Diego
--%>

<%@page import="Daos.DaoPrograma"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <<%
    DaoPrograma Programa = new DaoPrograma();
    
   
    long id_programa=Long.parseLong(request.getParameter("Programa"));  
    String nombre_programa=request.getParameter("nombrePrograma");
    long version_programa=Long.parseLong(request.getParameter("versionPrograma"));
    String descripcion_programa = request.getParameter("descripcionPrograma");
    
    
    
    
    
    if (Programa.ActualizarPrograma(id_programa, nombre_programa, version_programa, descripcion_programa))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de un programa");
            location.href="../Modificar/ModificarPrograma.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del programa ");
            location.href="../Modificar/ModificarPrograma.jsp";
        </script>
       <%
           }
          %>
  
