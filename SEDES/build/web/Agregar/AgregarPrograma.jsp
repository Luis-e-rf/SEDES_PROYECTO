<%-- 
    Document   : AgregarPrograma
    Created on : 16/06/2015, 02:32:06 PM
    Author     : ADSI Sena
--%>

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
        <title>AGREGAR PROGRAMA</title>
    </head>
    <body>
       <center> <img src="../imagenes/mas.png" alt=""/></center>
    <h2>Agregar Programa</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarPrograma.jsp" method="post">
        <input type="number" placeholder="Id Programa" name="IdPrograma" min="1" required=""/>
        <input id="datos" type="text" placeholder="Nombre Programa" name="NombrePrograma" required=""/>
        <input type="number" placeholder="Version Programa" name="VersionPrograma" min="1" required=""/>
        <input type="text" placeholder="Descripcion Programa" name="DescripcionPrograma" required=""/>

<button type="submit" >Agregar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>
