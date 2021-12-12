<%-- 
    Document   : ModificarPersonaFicha
    Created on : 27/07/2015, 06:23:51 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.PersonaFicha"%>
<%@page import="Daos.DaoPersonaFicha"%>
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
        <title>Modificar Persona Ficha </title>
    </head>
    <body>
    <center><img src="../imagenes/modificar.png" alt=""/></center>
        <title>Modificar Persona Ficha </title>
    </head>
   
       <h2><p>Modificar Persona Ficha</h2>
       
       <form id="form6"action="../Modificar/MostrarModificarPersonaFicha.jsp" method="post">
  <table width="304" border="1">
    
    <tr>
      <td>PERSONAFICHA</td>
      <td><label>
        <select name="numeroficha" >
            <%   
        DaoPersonaFicha  PersonaFicha = new DaoPersonaFicha();
        PersonaFicha personaficha = new PersonaFicha();
        ArrayList Listar =new ArrayList();
         
        Listar= PersonaFicha.ListarPersonaFicha();
        
         for (int i=0;i<Listar.size();i++)
         {
         personaficha=(PersonaFicha)Listar.get(i);
         long numero_ficha = personaficha.getNumero_ficha();
         
         
          out.print("<option value="+numero_ficha+"></option>");
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
