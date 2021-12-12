<%-- 
    Document   : AgregarTipoDocumento
    Created on : 16/06/2015, 02:20:01 PM
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
        <title>AGREGAR TIPO DOCUMENTO</title>
    </head>
    <body>
        <center> <img src="../imagenes/mas.png" alt=""/></center>
    <h2>Agregar Tipo Documento</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarTipoDocumento.jsp" method="post">
        <input type="text"  placeholder="Nombre Tipo Documento" name ="NombreDoc" required=""/>
        <input type="text"  placeholder="Descripcion Tipo Documento" name="DescripcionDoc" required=""/>

<button type="submit" >Agregar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>