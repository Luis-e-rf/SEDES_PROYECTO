<%-- 
    Document   : ModificarTipoDocumento
    Created on : 16/06/2015, 03:04:33 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Ficha"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoFicha"%>
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
        <title>Modificar Ficha</title>
    </head>
    <body>
    <center><img src="../imagenes/modificar.png" alt=""/></center>
        <title>Modificar Ficha</title>
    </head>
   
       <h2>Modificar Ficha</h2>
       
       <form id="form6" action="../Modificar/MostrarModificarFicha.jsp" method="post">
  <table width="304" border="1">
    
    <tr>
      <td>FICHA</td>
      <td><label>
        <select name="numeroficha" >
            <%   
        DaoFicha  Ficha = new DaoFicha();
        Ficha ficha = new Ficha();
        ArrayList Listar =new ArrayList();
         
        Listar= Ficha.listarFicha();
        
         for (int i=0;i<Listar.size();i++)
         {
         ficha=(Ficha)Listar.get(i);
         long numero_ficha=ficha.getNumero_ficha();
         
         
          out.print("<option value="+numero_ficha+">"+numero_ficha+"</option>");
         }
         %>
        </select>
      </label></td>
    </tr>
    </table>
 <center>
<button type="submit">Modificar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
 </center>
</form>

    </body>
</html>







