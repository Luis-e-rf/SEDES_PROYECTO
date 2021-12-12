<%-- 
    Document   : ProcesarEliminarFicha
    Created on : 8/07/2015, 04:55:08 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoFicha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  DaoFicha  Ficha = new DaoFicha();
  long numero_ficha = Long.parseLong(request.getParameter("numero_ficha"));
  
  


    if (Ficha.EliminarFicha(numero_ficha))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado una  Ficha");
                                    location.href="../Eliminar/EliminarFicha.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado la Ficha");
                                    location.href="../Eliminar/EliminarFicha.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>