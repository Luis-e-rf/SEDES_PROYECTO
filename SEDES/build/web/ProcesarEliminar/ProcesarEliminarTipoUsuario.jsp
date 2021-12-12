<%--    
    Document   : ProcesarEliminarTipoUsuario
    Created on : 29/07/2015, 04:59:31 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoTipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script language="Javascript" type="text/javascript">

<%
  DaoTipoUsuario  TipoUsuario = new DaoTipoUsuario();
  long Id_Tipo_usuario= Long.parseLong(request.getParameter("Id_Tipo_usuario"));
  
  
    if (TipoUsuario.EliminarTipoUsuario(Id_Tipo_usuario))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado un Tipo Usuario");
                                    location.href="../Eliminar/EliminarTipoUsuario.jsp";
                                    </script>
                                       <%
    }
    else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado el Tipo Usuario");
                                    location.href="../Eliminar/EliminarTipoUsuario.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
