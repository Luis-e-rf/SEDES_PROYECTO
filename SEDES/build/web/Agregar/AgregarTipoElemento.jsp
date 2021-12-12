<%-- 
    Document   : AgregarTipoElemento
    Created on : 25/08/2015, 01:53:08 PM
    Author     : ADSI  Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%!
    String Usuario ="";
    long Documento_Persona;
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
        <title>AGREGAR TIPO ELEMENTO</title>
    </head>
    <body>
        <center> <img src="../imagenes/mas.png" alt=""/></center>
    <h2>Agregar Tipo Elemento</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarTipoElemento.jsp" method="post">
        <input id="datos" type="text"  placeholder="Nombre Tipo Elemento" name ="NombreTipoElem" required=""/>
<button type="submit" >Agregar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>