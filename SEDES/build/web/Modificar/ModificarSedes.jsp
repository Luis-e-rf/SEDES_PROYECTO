<%-- 
    Document   : ModificarTipoDocumento
    Created on : 16/06/2015, 03:04:33 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Sede"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoSede"%>
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
        <title>Modificar Sedes</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Sede</h2>

       <form id="form6" action="../Modificar/MostrarModificarSedes.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>SEDE</td>
      <td><label>
        <select name="IdSede" >
            <%   
        DaoSede  Sede = new DaoSede();
        Sede sede = new Sede();
        ArrayList Listar =new ArrayList();
         
        Listar= Sede.ListarSede();
        
         for (int i=0;i<Listar.size();i++)
         {
         sede=(Sede)Listar.get(i);
         long id_sede= sede.getId_sede();
         String nombre_sede=sede.getNombre_sede();
         
          out.print("<option value="+id_sede+">"+nombre_sede+"</option>");
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