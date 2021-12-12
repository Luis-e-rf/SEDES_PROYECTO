<%-- 
    Document   : ProcesarEliminarAulaFicha
    Created on : 27/07/2015, 02:14:44 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoAula_ficha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  DaoAula_ficha  Aula_ficha = new DaoAula_ficha();
  long id_aula_ficha= Long.parseLong(request.getParameter("id_aula_ficha"));
  
  
    if (Aula_ficha.eleminarAula_ficha(id_aula_ficha))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado un  Aula Ficha");
                                    location.href="../Eliminar/Eliminar_Aula_Ficha.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado la Aula Ficha");
                                    location.href="../Eliminar/Eliminar_Aula_Ficha.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>