<%-- 
    Document   : ProcesarEliminarPrograma
    Created on : 8/07/2015, 04:56:08 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoPrograma"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

      DaoPrograma Programa = new DaoPrograma();   
   
   long id_programa =Long.parseLong(request.getParameter("id_programa"));
   
  
   if (Programa.EliminarPrograma(id_programa))
   {
%>

 <script languaje="javascript">
     
                                    alert("Has Eliminado Un Programa");
                                    location.href="../Eliminar/EliminarPrograma.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No Se Ha Eliminado El Programa");
                                    location.href="../Eliminar/EliminarPrograma.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>