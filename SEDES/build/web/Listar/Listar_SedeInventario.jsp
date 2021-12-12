<%-- 
    Document   : Listar_SedeInventario
    Created on : 21/08/2015, 02:43:53 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.SedeInventario"%>
<%@page import="Daos.DaoSedeInventario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <link href="../css/estiloconsultas.css" rel="stylesheet" type="text/css"/>
        <title>Consultar Inventario sedes </title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Inventario de Sedes</h2>
        <table class="devolver" width="916" border="1">
     <tr>
    <td   align="center">Sede Inventario</td>
    <td  align="center">Sede N°</td>
    <td  align="center">Id_Tipo_Inventario</td>
   
   
  </tr>
  <%
     DaoSedeInventario SedeInventario= new  DaoSedeInventario();
     SedeInventario    sedeinventario = new SedeInventario();
     ArrayList       Listar = new ArrayList();
     Listar = SedeInventario.ListarSedeInventario();
     
     for (int i=0;i<Listar.size();i++)
     {
         sedeinventario = (SedeInventario) Listar.get(i);
          long  Id_Sede_Inventario  = sedeinventario.getId_Sede_Inventario();
          long  Id_sede = sedeinventario.getId_sede();
          long  Id_Tipo_Inventario   = sedeinventario.getId_Tipo_Inventario();
         
          
          out.print("<tr>");
                    out.print("<td>"+Id_Sede_Inventario+"</td>");
                    out.print("<td>"+Id_sede+"</td>");
                    out.print("<td>"+Id_Tipo_Inventario+"</td>");
                    
                   
                   
      out.print("</tr>");
     }
     
  %>
  </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
