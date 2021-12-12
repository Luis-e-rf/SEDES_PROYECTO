<%-- 
    Document   : ModificarSedeInventario
    Created on : 27/07/2015, 06:45:24 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.SedeInventario"%>
<%@page import="Daos.DaoSedeInventario"%>
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
        <title>Modificar Sede Inventario</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Sede Inventario
       </h2>

    <form id="form6" action="../Modificar/MostrarModificarSedeInventario.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>SEDEINVENTARIO</td>
      <td><label>
        <select name="IdSedeInventario" >
            <%   
        DaoSedeInventario  SedeInventario = new DaoSedeInventario();
        SedeInventario sedeinventario = new SedeInventario ();
        ArrayList Listar =new ArrayList();
         
        Listar= SedeInventario.ListarSedeInventario();
        
         for (int i=0;i<Listar.size();i++)
         {
         sedeinventario=(SedeInventario)Listar.get(i);
         long Id_Sede_Inventario = sedeinventario.getId_Sede_Inventario();
         
         
          out.print("<option value="+Id_Sede_Inventario+"></option>");
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
