<%-- 
    Document   : ModificarTipoUsuario
    Created on : 28/07/2015, 01:53:07 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.TipoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoTipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <%!
    String Usuario ="";
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
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Tipo Usuario </title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Tipo Usuario</h2>

       <form id="form6" action="../Modificar/MostrarModificarTipoUsuario.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>TIPO USUARIO</td>
      <td><label>
        <select name="IdTipousuario">
            <%   
        DaoTipoUsuario  TipoUsuario = new DaoTipoUsuario();
        TipoUsuario tipousuario = new TipoUsuario();
        ArrayList Listar =new ArrayList();
         
        Listar= TipoUsuario.ListarTipoUsuario();
        
         for (int i=0;i<Listar.size();i++)
         {
         tipousuario=(TipoUsuario)Listar.get(i);
         long Id_Tipo_usuario = tipousuario.getId_Tipo_usuario();
         String Nombre_Tipo_usuario = tipousuario.getNombre_Tipo_usuario();
         
          out.print("<option value="+Id_Tipo_usuario+">"+Nombre_Tipo_usuario+"</option>");
         }
         %>
        </select>
      </label></td>
    </tr>
    </table>
 <center>
<button type="submit" h>Modificar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
 </center>
</form>
    </body>
</html>
