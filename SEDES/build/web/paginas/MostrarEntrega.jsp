<%-- 
    Document   : MostrarEntrega
    Created on : 8/02/2016, 07:49:45 AM
    Author     : Admin_sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Entrega de Prestamos</title>
    </head>
    <body>
        
    <center> <img src="../imagenes/prestamo.png" alt=""/></center>
   
    <h2>Entrega de Prestamos</h2>

    <form id="form6" action="ValidarEntrega.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>Documento Persona</td>
      <td><label>
            <input type="number"  placeholder="Digite el Numero de Documento" name="DocumentoPersona" required=""/>
      </label></td>
    </tr>

    </table>
 <center>
<button type="submit" >Enviar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
 </center>
</form>
    </body>
</html>
