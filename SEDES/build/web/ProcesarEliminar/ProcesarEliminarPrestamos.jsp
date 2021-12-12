<%-- 
    Document   : ProcesarEliminarPrestamos
    Created on : 29/07/2015, 03:14:29 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoPrestamos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  DaoPrestamos  Prestamos = new DaoPrestamos();
  long Id_Prestamos= Long.parseLong(request.getParameter("Id_Prestamos"));
  
  
    if (Prestamos.EliminarPrestamos(Id_Prestamos))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado un Prestamo");
                                    location.href="../Eliminar/EliminarPrestamos.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado el Prestamo");
                                    location.href="../Eliminar/EliminarPrestamos.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
