<%-- 
    Document   : EliminarUsuario
    Created on : 29/07/2015, 05:09:08 PM
    Author     : ADSI  Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<%@page import="Daos.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
         <title>ELIMINAR</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Usuario</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarUsuario.jsp">
    <center>
        <table id="sel" border="1">
     <tr>
       <td width="133">Eliminar Usuario </td>
      <td width="121"><label>
        <select name="Nombre_Usuario">
            <%
                DaoUsuario Usuario = new DaoUsuario();
                
                Usuario usuario = new Usuario();
                ArrayList Listar = new ArrayList();
                
                Listar = Usuario.ListarUsuario();
                
                for (int i=0;i<Listar.size();i++)
                {
                   usuario =(Usuario) Listar.get(i);
                    String Nombre_Usuario = usuario.getNombre_Usuario();
                    
                    out.print("<option value = "+ Nombre_Usuario+">");
                }
            %>
        </select>
          </label>
    </table>
        <button type="submit" >Enviar</button>
        <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
      
    </center>
</form>
    </body>
</html>