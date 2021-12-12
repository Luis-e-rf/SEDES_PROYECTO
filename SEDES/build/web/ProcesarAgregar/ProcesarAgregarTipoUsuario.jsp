<%-- 
    Document   : ProcesarAgregarTipoUsuario
    Created on : 19/08/2015, 01:22:07 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoTipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoTipoUsuario tipUser =new DaoTipoUsuario();
    
    String Nombre_Tipo_usuario = request.getParameter("NombreTUser");
    String Descripcion_Tipo_usuario = request.getParameter("DescTuser");
    
    if(tipUser.AgregarTipoUsuario(Nombre_Tipo_usuario, Descripcion_Tipo_usuario))
    {   
 %>
 
                                   <script languaje="javascript">
                                    alert("Has ingresado un Nuevo Tipo de Usuario");
                                    location.href="../Agregar/AgregarTipoUsuario.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha ingresado el Tipo Usuario");
                                    location.href="../Agregar/AgregarTipoUsuario.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>