<%-- 
    Document   : ProcesarEliminarPersonaFicha
    Created on : 28/07/2015, 03:37:02 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoPersonaFicha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  DaoPersonaFicha  PersonaFicha = new DaoPersonaFicha();
  long id_persona_ficha= Long.parseLong(request.getParameter("id_persona_ficha"));
  
  
    if (PersonaFicha.EliminarPersonaFicha(id_persona_ficha))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado una Persona Ficha");
                                    location.href="../Eliminar/EliminarPersonaFicha.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado la Persona Ficha");
                                    location.href="../Eliminar/EliminarPersonaFicha.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
