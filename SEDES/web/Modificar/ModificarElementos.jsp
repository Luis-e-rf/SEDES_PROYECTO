<%-- 
    Document   : ModificarElementos
    Created on : 27/07/2015, 01:47:18 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Elementos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoElementos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Elementos</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Elementos
       </h2>

    <form id="form6" action="../Modificar/MostrarModificarElementos.jsp">
 <table width="304" border="1">
    
    <tr>
      <td>ELEMENTOS</td>
      <td><label>
        <select name="IdElemento" >
            <%   
        DaoElementos  Elementos = new DaoElementos();
       Elementos elementos = new Elementos();
        ArrayList Listar =new ArrayList();
         
        Listar= Elementos.listarElementos();
        
         for (int i=0;i<Listar.size();i++)
         {
         elementos=(Elementos)Listar.get(i);
         long Id_Elemento = elementos.getId_Elemento();
         String Nombre_Elemento = elementos.getNombre_Elemento();
         
          out.print("<option value="+Id_Elemento+">"+Nombre_Elemento+"</option>");
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