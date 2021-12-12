<%-- 
    Document   : ProcesarModificarPersonaProfesion
    Created on : 28/07/2015, 05:48:32 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoPersonaProfesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoPersonaProfesion PersonaProfesion = new DaoPersonaProfesion();
    
    long id_instructor_profesion           = Long.parseLong(request.getParameter("idinstructorprofesion"));
    long id_profesion           = Long.parseLong(request.getParameter("idprofesion"));  
    

    
    if (PersonaProfesion.ModificarPersonaProfesion(id_instructor_profesion, id_profesion))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado datos de una persona profesion");
            location.href="../Modificar/ModificarPersonaProfesion.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos de una persona profesion ");
            location.href="../Modificar/ModificarPersonaProfesion.jsp";
        </script>
        <%
           }
          %>
        
