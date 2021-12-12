<%-- 
    Document   : ProcesarEliminarElementos
    Created on : 15/07/2015, 05:22:01 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoElementos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  DaoElementos  Elementos = new DaoElementos();
  long Id_Elemento= Long.parseLong(request.getParameter("Id_Elemento"));
  
  
    if (Elementos.EliminarElementos(Id_Elemento))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado un Elemento");
                                    location.href="../Eliminar/EliminarElementos.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado el Elemento");
                                    location.href="../Eliminar/EliminarElementos.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>