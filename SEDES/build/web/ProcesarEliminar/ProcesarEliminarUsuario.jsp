<%-- 
    Document   : ProcesarEliminarUsuario
    Created on : 29/07/2015, 05:53:30 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  DaoUsuario  Usuario = new DaoUsuario();
  String Nombre_Usuario= request.getParameter("Nombre_Usuario");
  
  
    if (Usuario.EliminarUsuario(Nombre_Usuario))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado un Usuario");
                                    location.href="../Eliminar/EliminarUsuario.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado el Usuario");
                                    location.href="../Eliminar/EliminarUsuario.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
