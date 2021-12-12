<%-- 
    Document   : EliminarTipoInventario
    Created on : 15/07/2015, 05:06:15 PM
    Author     : ADSI  Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoInventario"%>
<%@page import="Daos.DaoTipoInventario"%>
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
    <h1>Eliminar Tipo Inventario</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarTipoInventario.jsp">
    <center>
        <table id="sel" border="1">
     <tr>
       <td width="133">Eliminar Tipo Inventario </td>
      <td width="121"><label>
        <select name="Id_Tipo_Inventario">
            <%
                DaoTipoInventario TipoInventario = new DaoTipoInventario();
                
                TipoInventario tipoinventario = new TipoInventario();
                ArrayList Listar = new ArrayList();
                
                Listar = TipoInventario.ListarTipoInventario();
                
                for (int i=0;i<Listar.size();i++)
                {
                   tipoinventario =(TipoInventario) Listar.get(i);
                    long Id_Tipo_Inventario = tipoinventario.getId_Tipo_Inventario();
                    String Nombre_Tipo_Inventario=tipoinventario.getNombre_Tipo_Inventario();
                    out.print("<option value = "+ Id_Tipo_Inventario+">"+Nombre_Tipo_Inventario+"</option> ");
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

