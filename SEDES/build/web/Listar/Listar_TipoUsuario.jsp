<%-- 
    Document   : Listar_TipoUsuario
    Created on : 21/08/2015, 03:56:09 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoUsuario"%>
<%@page import="Daos.DaoTipoUsuario"%>
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
        <title>Consultar Tipo Usuario</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Tipo Usuario</h2>
        <table class="devolver" width="916" border="1">
        <tr>
    <td   align="center">Tipo Usuario</td>
    <td  align="center">Nombre Tipo Usuario</td>
    <td  align="center">Descripcion Tipo Usuario</td>
   
   
  </tr>
  <%
     DaoTipoUsuario  TipoUsuario= new  DaoTipoUsuario();
     TipoUsuario    tipousuario = new TipoUsuario();
     ArrayList       Listar = new ArrayList();
     Listar = TipoUsuario.ListarTipoUsuario();
     for (int i=0;i<Listar.size();i++)
     {
         tipousuario = (TipoUsuario) Listar.get(i);
          long  Id_Tipo_usuario  = tipousuario.getId_Tipo_usuario();
          String  Nombre_Tipo_usuario = tipousuario.getNombre_Tipo_usuario();
          String  Descripcion_Tipo_usuario   = tipousuario.getDescripcion_Tipo_usuario();
         
          
          out.print("<tr>");
                    out.print("<td>"+Id_Tipo_usuario+"</td>");
                    out.print("<td>"+Nombre_Tipo_usuario+"</td>");
                    out.print("<td>"+Descripcion_Tipo_usuario+"</td>");
                    
                   
                   
      out.print("</tr>");
     }
     
  %>
   </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
