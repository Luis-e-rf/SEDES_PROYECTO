<%-- 
    Document   : validar
    Created on : 03-jul-2015, 17:45:50
    Author     : JupiterPC
--%>

<%@page import="Encripcion.MD5"%>
<%@page import="Daos.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    DaoUsuario Usuario=new DaoUsuario();
    MD5 ecs =new MD5();
String Nombre_Usuario=request.getParameter("User");
String Contraseña_Usuario = ecs.hash(request.getParameter("Pass"));

if(Usuario.VerificarUsuario(Nombre_Usuario, Contraseña_Usuario))
{
    HttpSession SesionActiva = request.getSession();
    SesionActiva.setAttribute("Usuario",Nombre_Usuario);
    SesionActiva.setMaxInactiveInterval(300 );
%>
                                            <script languaje="javascript">
                                    alert("Bienvenido Sr(a) Administrador");
                                    location.href="../paginas/menu.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("Los datos ingresados son incorrectos");
                                    location.href="../paginas/ingresar.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>