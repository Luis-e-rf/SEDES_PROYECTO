<%-- 
    Document   : ModificarTipoElemento
    Created on : 25/08/2015, 02:30:04 PM
    Author     : Diego
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoElemento"%>
<%@page import="Daos.DaoTipoElemento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloprest.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Tipo Elemento</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Tipo Elemento
       </h2>

       <form action="../Modificar/MostrarModificarTipoElemento.jsp">
 <table width="304" border="1">
    
    <tr>
      <td>TIPOELEMENTO</td>
      <td><label>
        <select name="IdTipoElemento" >
            <%   
        DaoTipoElemento  TipoElemento = new DaoTipoElemento();
        TipoElemento tipoelemento = new TipoElemento();
        ArrayList Listar =new ArrayList();
         
        Listar= TipoElemento.ListarTipoElemento();
        
         for (int i=0;i<Listar.size();i++)
         {
         tipoelemento = (TipoElemento)Listar.get(i);
         long Id_Tipo_Elemento = tipoelemento.getId_Tipo_Elemento();
         String Nombre_Tipo_Elemento = tipoelemento.getNombre_Tipo_Elemento();
         String Descripcion_Tipo_Elemento = tipoelemento.getDescripcion_Tipo_Elemento();
         
          out.print("<option value="+Id_Tipo_Elemento+">"+Nombre_Tipo_Elemento+","+Descripcion_Tipo_Elemento+"</option>");
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
