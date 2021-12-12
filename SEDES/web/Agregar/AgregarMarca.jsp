<%-- 
    Document   : AgregarMarca
    Created on : 25/08/2015, 01:52:41 PM
    Author     : ADSI  Sena
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
        <title>AGREGAR MARCA</title>
    </head>
    <body>
       <center> <img src="../imagenes/mas.png" alt=""/></center>
    <h2>Agregar Marca</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarMarca.jsp">
        <input id="datos" type="text"  placeholder="Nombre Marca" name="NombreMarca" required=""/>
        <input type="text"  placeholder="Descripcion Marca" name="Descripcion_Marca" required=""/>

<button type="submit" >Agregar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>