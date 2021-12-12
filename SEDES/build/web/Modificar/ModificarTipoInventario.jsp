<%-- 
    Document   : ModificarTipoInventario
    Created on : 27/07/2015, 01:56:11 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoInventario"%>
<%@page import="Daos.DaoTipoInventario"%>
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
        <title>Modificar TipoInventario</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Tipo Inventario
       </h2>

    <form id="form6" action="../Modificar/MostrarModificarTipoInventario.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>TIPOINVENTARIO</td>
      <td><label>
        <select name="IdTipoInventario" >
            <%   
        DaoTipoInventario  TipoInventario = new DaoTipoInventario();
       TipoInventario tipoinventario = new TipoInventario();
        ArrayList Listar =new ArrayList();
         
        Listar= TipoInventario.ListarTipoInventario();
        
         for (int i=0;i<Listar.size();i++)
         {
         tipoinventario=(TipoInventario)Listar.get(i);
         long Id_Tipo_Inventario = tipoinventario.getId_Tipo_Inventario();
         String Nombre_Tipo_Inventario = tipoinventario.getNombre_Tipo_Inventario();
         
          out.print("<option value="+Id_Tipo_Inventario+">"+Nombre_Tipo_Inventario+"</option>");
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
