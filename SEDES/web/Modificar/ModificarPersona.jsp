<%-- 
    Document   : ModificarPersona
    Created on : 16/06/2015, 02:03:20 PM
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
        <title>Modificar Datos</title>
    </head>
    <body>
    <center><img src="../imagenes/modificar.png" alt=""/></center>
      
       <h2><p>Modificar Persona</h2>
       <form action="../ProcesarValidarUsuario/ValidarPersona.jsp" method="post">
           <input type="text"  placeholder="Digite el Número de Documento" name="DocumentoPersona" required=""/>
          <button type="submit">Buscar</button>
          <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
       </form>
    </body>
</html>
