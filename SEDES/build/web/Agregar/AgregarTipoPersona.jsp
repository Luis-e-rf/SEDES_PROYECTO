<%-- 
    Document   : AgregarTipoPersona
    Created on : 20/08/2015, 01:45:49 PM
    Author     : Diego
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
        <title>AGREGAR TIPO PERSONA</title>
    </head>
    <body>
       <center> <img src="../imagenes/mas.png" alt=""/></center>
    <h2>Agregar Tipo Persona</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarTipoPersona.jsp" method="post">
        
        <input type="text"  placeholder="Nombre Tipo Persona" name="NombreTipoPersona"/>
        <input type="text"  placeholder="Descripcion Tipo Persona" name="DescripcionTipoPersona"/>

<button type="submit" >Agregar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>
