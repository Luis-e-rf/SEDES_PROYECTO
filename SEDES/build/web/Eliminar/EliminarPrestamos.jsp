<%-- 
    Document   : EliminarPrestamos
    Created on : 28/07/2015, 05:52:12 PM
    Author     : ADSI  Sena
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Prestamos"%>
<%@page import="Daos.DaoPrestamos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
 
         <title>ELIMINAR</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Prestamos</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarPrestamos.jsp">
    <center>
        <table id="sel" border="1">
     <tr>
       <td width="133">Eliminar Prestamos </td>
      <td width="121"><label>
        <select name="Id_Prestamos">
            <%
                DaoPrestamos Prestamos = new DaoPrestamos();
                
                Prestamos prestamos = new Prestamos();
                ArrayList Listar = new ArrayList();
                
                Listar = Prestamos.ListarPrestamo();
                
                for (int i=0;i<Listar.size();i++)
                {
                   prestamos =(Prestamos) Listar.get(i);
                   long Id_Prestamos = prestamos.getId_Prestamos();
                   Time  Hora_Prestamos    = prestamos.getHora_Prestamos();
                   out.print("<option value = "+ Id_Prestamos+">"+Hora_Prestamos+"</option> ");
                }
            %>
        </select>
          </label>
    </table>
        <button type="submit" >Enviar</button>
        <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
      
    </center>
</form>
    </body>
</html>

