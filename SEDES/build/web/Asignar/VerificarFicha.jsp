<%-- 
    Document   : VerificarFicha
    Created on : 25/08/2015, 06:07:08 PM
    Author     : ADSI Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <link href="../css/estiloconsultas.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Asignar Aula Ficha</title>
    </head>
    <body>
    <center><img src="../imagenes/modificar.png" alt=""/></center>
      
       <h2><p>Asignar Aula a una Ficha</h2>
       <form action="../ProcesarValidarUsuario/ValidarFicha.jsp" method="Post">
           <input type="text"  placeholder="Digite el Número de la ficha" name="NumFicha" required=""/>
          <button type="submit">Buscar</button>
          <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
       </form>
    </body>
</html>

