<%-- 
    Document   : Listar_Usuario
    Created on : 21/08/2015, 03:59:35 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<%@page import="Daos.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%!
    String Usuario ="";
    long Documento_Persona;
%>
<%
    
    HttpSession SessionActiva = request.getSession();
    
    if(SessionActiva.getAttribute("Usuario")==null)
    {
%>
    <script type="text/javascript">
    
    alert("Por Favor Iniciar Sesión");
    location.href="../paginas/ingresar.jsp";
    
    </script>

<%    
    }
    
    else 
    {
    
    Usuario =(String)SessionActiva.getAttribute("Usuario");
    }

%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <link href="../css/estiloconsultas.css" rel="stylesheet" type="text/css"/>
        <title>Consultar Usuario</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Usuario</h2>
        <table class="devolver" width="916" border="1">
        <tr id="tu">
    <td   align="center">Nombre Usuario</td>
    <td  align="center">Contraseña Usuario</td>
    <td  align="center">Documento Persona</td>
    <td  align="center">Tipo Usuario N°</td>
   
  </tr>
  <%
     DaoUsuario  Usuario= new  DaoUsuario();
     Usuario    usuario = new Usuario();
     ArrayList       Listar = new ArrayList();
     Listar = Usuario.ListarUsuario();
     for (int i=0;i<Listar.size();i++)
     {
         usuario = (Usuario) Listar.get(i);
          String  Nombre_Usuario  = usuario.getNombre_Usuario();
          String  Contraseña_Usuario = usuario.getContraseña_Usuario();
          long  documento_persona   = usuario.getDocumento_persona();
          long  Id_Tipo_usuario   = usuario.getId_Tipo_usuario();
          
          out.print("<tr>");
                    out.print("<td>"+Nombre_Usuario+"</td>");
                    out.print("<td>"+Contraseña_Usuario+"</td>");
                    out.print("<td>"+documento_persona+"</td>");
                    out.print("<td>"+Id_Tipo_usuario+"</td>");
                   
                   
      out.print("</tr>");
     }
     
  %>
  </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
