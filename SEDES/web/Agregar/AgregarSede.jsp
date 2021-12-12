<%-- 
    Document   : AgragarSede
    Created on : 16/06/2015, 02:38:00 PM
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
        <title>AGREGAR SEDE</title>
    </head>
    <body>
        <center> <img src="../imagenes/mas.png" alt=""/></center>
    <h2>Agregar Sede</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarSede.jsp" method="post">
        <input id="datos" type="text"  placeholder="Nombre de la Sede" name ="NombreSede" required=""/>
        <input id="datos" type="text"  placeholder="Horario de la Sede" name ="HorarioSede" required=""/>
         <input type="text"  placeholder="Observaciones Sede" name="ObservacionesSede" required=""/>

<button type="submit" >Agregar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>
