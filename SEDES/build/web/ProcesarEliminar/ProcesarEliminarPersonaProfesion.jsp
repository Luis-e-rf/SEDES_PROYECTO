<%-- 
    Document   : ProcesarEliminarPersonaProfesion
    Created on : 28/07/2015, 05:44:29 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoPersonaProfesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  DaoPersonaProfesion  PersonaProfesion = new DaoPersonaProfesion();
  long id_instructor_profesion= Long.parseLong(request.getParameter("id_instructor_profesion"));
  
  
    if (PersonaProfesion.EliminarPersonaProfesion(id_instructor_profesion))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado una Persona Profesion");
                                    location.href="../Eliminar/EliminarPersonaProfesion.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado la Persona Profesion");
                                    location.href="../Eliminar/EliminarPersonaProfesion.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
