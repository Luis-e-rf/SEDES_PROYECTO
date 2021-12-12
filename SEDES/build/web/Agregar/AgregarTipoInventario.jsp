<%-- 
    Document   : AgregarTipoInventario
    Created on : 06-jul-2015, 14:33:19
    Author     : JupiterPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>AGREGAR INVENTARIO</title>
    </head>
    <body>
        <center> <img src="../imagenes/mas.png" alt=""/></center>
    <h2>Agregar Inventario</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarTipoInventario.jsp" method="post">
        <input type="text"  placeholder="Nombre Tipo Inventario" name ="NombreInventario" required=""/>
        <input type="text"  placeholder="Descripcion Tipo de Inventario" name="DescripcionInventario" required=""/>

<button type="submit" >Agregar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>
