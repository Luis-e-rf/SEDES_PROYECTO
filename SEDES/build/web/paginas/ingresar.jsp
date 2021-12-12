<%-- 
    Document   : principal
    Created on : 3/06/2015, 02:15:33 PM
    Author     : ADSI Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>INGRESAR</title>
    </head>
    <body>
    <center> <img src="../imagenes/ingresar.jpg" alt=""/></center>
    <h1>Ingreso de Usuarios Registrados</h1>
    <form action="../ProcesarValidarUsuario/validar.jsp" method="post">
        <input type="text"  placeholder="Ingrese su usuario" name="User" required=""/>
        <input type="password" placeholder="Ingrese su contraseña" name="Pass" required=""/>
<button  type="submit">Ingresar</button>
<a href="index.jsp"><button type="button">Cancelar</button></a>
<div>
    <a href="../Modificar/RestaurarContraseña.jsp">¿Olvidaste tu contraseña?</a>
</div>

  </form>
    </body>
</html>
