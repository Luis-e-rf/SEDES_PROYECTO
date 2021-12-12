<%-- 
    Document   : EliminarSedeInventario
    Created on : 28/07/2015, 06:25:14 PM
    Author     : ADSI  Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.SedeInventario"%>
<%@page import="Daos.DaoSedeInventario"%>
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
    <h1>Eliminar Sede Inventario</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarSedeInventario.jsp">
    <center>
        <table id="sel" border="1">
     <tr>
       <td width="133">Eliminar Sede Inventario </td>
      <td width="121"><label>
        <select name="Id_Sede_inventario">
            <%
                DaoSedeInventario SedeInventario = new DaoSedeInventario();
                
                SedeInventario sedeinventario = new SedeInventario();
                ArrayList Listar = new ArrayList();
                
                Listar = SedeInventario.ListarSedeInventario();
                
                for (int i=0;i<Listar.size();i++)
                {
                   sedeinventario =(SedeInventario) Listar.get(i);
                   long Id_Sede_inventario = sedeinventario.getId_Sede_Inventario();
                   
                   out.print("<option value = "+ Id_Sede_inventario+">");
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
