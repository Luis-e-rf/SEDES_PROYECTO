<%-- 
    Document   : AgregarProfesion
    Created on : 16/06/2015, 02:12:09 PM
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
        <title>AGREGAR PROFESION</title>
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
    </head>
    <body>
        
        <center> <img src="../imagenes/mas.png" alt=""/></center>
    <h2>Agregar Profesion</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarProfesion.jsp" method="post">
        <input id="datos" type="text"  placeholder="Nombre Profesion" name="NombreProfesion" required=""/>
        <input type="text"  placeholder="Descripcion Profesion" name="DescripcionProfesion" required=""/>

<button type="submit" >Agregar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>
