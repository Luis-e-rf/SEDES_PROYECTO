<%-- 
    Document   : ProcesarEliminarAula
    Created on : 8/07/2015, 04:54:48 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoAula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
  DaoAula  Aula = new DaoAula();
  long id_aula= Long.parseLong(request.getParameter("IdAula"));
  
  
    if (Aula.EliminarAula(id_aula))
        
    {
       
 %>
                                    <script languaje="javascript">
                                    alert("Has Eliminado una  Aula");
                                    location.href="../Eliminar/EliminarAula.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado la Aula");
                                    location.href="../Eliminar/EliminarAula.jsp";
                                    </script>
                                    <%   
        
    }
    
    %>
      

