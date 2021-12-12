<%-- 
    Document   : ProcesarEliminarSedeInventario
    Created on : 29/07/2015, 02:24:25 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoSedeInventario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  DaoSedeInventario  SedeInventario = new DaoSedeInventario();
  long Id_Sede_inventario= Long.parseLong(request.getParameter("Id_Sede_inventario"));
  
  
    if (SedeInventario.EliminarSedeInventario(Id_Sede_inventario))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado un Tipo Inventario");
                                    location.href="../Eliminar/EliminarSedeInventario.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado el Tipo Inventario");
                                    location.href="../Eliminar/EliminarSedeInventario.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>