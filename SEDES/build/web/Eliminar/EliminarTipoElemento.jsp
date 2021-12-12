<%-- 
    Document   : EliminarTipoElemento
    Created on : 24/08/2015, 01:52:05 PM
    Author     : ADSI  Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoElemento"%>
<%@page import="Daos.DaoTipoElemento"%>
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
    <h1>Eliminar Tipo Elemento</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarTipoElemento.jsp">
    <center>
        <table id="sel" width="200" border="1">
     <tr>
       <td width="133">Eliminar Tipo Elemento </td>
      <td width="121"><label>
        <select name="IdTipoElemento">
            <%
                DaoTipoElemento TipoElemento = new DaoTipoElemento();
                
                TipoElemento Elemento = new TipoElemento();
                ArrayList Listar = new ArrayList();
                
                Listar = TipoElemento.ListarTipoElemento();
                
                for (int i=0;i<Listar.size();i++)
                {
                   Elemento =(TipoElemento) Listar.get(i);
                    long IdTipo_Elemento = Elemento.getIdTipo_Elemento();
                    String Nombre_Tipo_Elemento= Elemento.getNombre_Tipo_Elemento();
                    out.print("<option value = "+ IdTipo_Elemento+">"+Nombre_Tipo_Elemento+"</option> ");
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
