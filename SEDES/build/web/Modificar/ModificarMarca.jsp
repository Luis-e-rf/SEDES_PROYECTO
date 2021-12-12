<%-- 
    Document   : ModificarMarca
    Created on : 25/08/2015, 02:13:38 PM
    Author     : Diego
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Marca"%>
<%@page import="Daos.DaoMarca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloprest.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Marca</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Marca
       </h2>

       <form action="../Modificar/MostrarModificarMarca.jsp">
 <table width="304" border="1">
    
    <tr>
      <td>MARCA</td>
      <td><label>
        <select name="idMarca" >
            <%   
       
          DaoMarca Marca = new DaoMarca();
                
                Marca marca = new Marca();
                ArrayList Listar = new ArrayList();
                
                Listar = Marca.listarMarca();
                
                for (int i=0;i<Listar.size();i++)
                {
                    marca =(Marca) Listar.get(i);
                     long id_Marca = marca.getId_Marca();
                     String Nombre_Marca = marca.getNombre_Marca();
                     String Descripcion_Marca = marca.getDescripcion_Marca();
                   
              out.print("<option value="+id_Marca+">"+Nombre_Marca+","+Descripcion_Marca+"</option>");
                 }
         %>
        </select>
      </label></td>
    </tr>
    </table>
 <center>
<button type="submit" h>Modificar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
 </center>
</form>
    </body>
</html>
