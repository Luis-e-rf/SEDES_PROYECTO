<%-- 
    Document   : ModificarPrestamos
    Created on : 27/07/2015, 06:39:55 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Prestamos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoPrestamos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloconsultas.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Prestamos</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
    <h1>Modificar Prestamos</h1>

    <form  action="../ProcesarValidarUsuario/ValidarPrestamos.jsp" method="post">
        <center>
        <table id="sel2" border="1">
    
    <tr>
      <td width="144">Documento Persona</td>
      <td><label>
            <input type="number"  placeholder="Digite el Número de Documento" name="DocumentoPersona" required=""/>
      </label></td>
    </tr>
    </table>
        </center>
 <center>
<button type="submit" >Modificar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
 </center>
</form>
    </body>
</html>
