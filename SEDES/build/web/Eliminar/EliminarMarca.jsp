<%-- 
    Document   : EliminarMarca
    Created on : 24/08/2015, 01:51:49 PM
    Author     : ADSI  Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Marca"%>
<%@page import="Daos.DaoMarca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
         <title>ELIMINAR</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Marca de un Elemento</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarMarca.jsp">
    <center>
        <table id="sel" width="200" border="1">
     <tr>
       <td width="133">Eliminar Marca </td>
      <td width="121"><label>
        <select name="id_Marca">
            <%
                DaoMarca Marca = new DaoMarca();
                
                Marca marca = new Marca();
                ArrayList Listar = new ArrayList();
                
                Listar = Marca.listarMarca();
                
                for (int i=0;i<Listar.size();i++)
                {
                   marca =(Marca) Listar.get(i);
                    long idMarca = marca.getIdMarca();
                    String Nombre_Marca = marca.getNombre_Marca();
                    out.print("<option value = "+ idMarca+">"+Nombre_Marca+"</option> ");
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