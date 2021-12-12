<%-- 
    Document   : ProcesarEliminarTipoInventario
    Created on : 16/07/2015, 02:08:16 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoTipoInventario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  DaoTipoInventario  TipoInventario = new DaoTipoInventario();
  long Id_Tipo_Inventario= Long.parseLong(request.getParameter("Id_Tipo_Inventario"));
  
  
    if (TipoInventario.EliminarTipoInventario(Id_Tipo_Inventario))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado el Tipo Inventario");
                                    location.href="../Eliminar/EliminarTipoInventario.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado el Tipo Inventario");
                                    location.href="../Eliminar/EliminarTipoInventario.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
