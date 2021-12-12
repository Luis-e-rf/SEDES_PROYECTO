<%-- 
    Document   : RestaurarContraseña
    Created on : 12/08/2015, 06:12:37 PM
    Author     : ADSI Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloconsultas.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Restaurar Contraseña</title>
    </head>
    <body>
    <center><img src="../imagenes/modificar.png" alt=""/></center>
      
       <h2><p>Recupera tu Contraseña</h2>
       <form action="../ProcesarValidarUsuario/ValidarCorreo.jsp" method="post">
           <input type="email"  placeholder="Digite su Correo Electronico " name="Email" required=""/>
          <button  class="buscar" type="submit">Cambiar Contraseña</button>
          <a href="../paginas/ingresar.jsp"><button type="button">Cancelar</button></a>
       </form>
    </body>
</html>
