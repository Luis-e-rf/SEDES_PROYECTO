<%-- 
    Document   : ModificarAula_ficha
    Created on : 27/07/2015, 05:40:43 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Aula_ficha"%>
<%@page import="Daos.DaoAula_ficha"%>
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
        <title>Modificar Aulaficha</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Aula de una Ficha</h2>

       <form id="form6" action="../Modificar/MostrarModificarAula_ficha.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>FICHA N°</td>
      <td><label>
        <select name="idaulaficha" >
            <%   
        DaoAula_ficha  Aula_ficha = new DaoAula_ficha();
        Aula_ficha aula_ficha = new Aula_ficha();
        ArrayList Listar =new ArrayList();
         
        Listar= Aula_ficha.listarAula_ficha();
        
         for (int i=0;i<Listar.size();i++)
         {
         aula_ficha=(Aula_ficha)Listar.get(i);
         long id_aula_ficha =aula_ficha.getId_aula_ficha();
         long numero_ficha = aula_ficha.getNumero_ficha();
         
          out.print("<option value="+id_aula_ficha+">"+numero_ficha+"</option>");
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
