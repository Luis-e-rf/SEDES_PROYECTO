<%-- 
    Document   : MostrarModificarSedeInventario
    Created on : 28/07/2015, 04:13:34 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.SedeInventario"%>
<%@page import="Daos.DaoSedeInventario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
     long Id_Sede_Inventario;
     long Id_sede;
     long Id_Tipo_Inventario;
    
    %> 
    
    <%
    DaoSedeInventario SedeInventario = new DaoSedeInventario();
                
                SedeInventario sedeinventario = new SedeInventario();
                ArrayList Listar = new ArrayList();
                
                Listar = SedeInventario.ListarSedeInventarioUnico(Long.parseLong(request.getParameter("IdSedeInventario")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    sedeinventario =(SedeInventario) Listar.get(i);
                    Id_Sede_Inventario = sedeinventario.getId_Sede_Inventario();
                    Id_sede = sedeinventario.getId_sede();
                    Id_Tipo_Inventario = sedeinventario.getId_Tipo_Inventario();
                    
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Sede Inventario</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Sede Inventario</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarSedeInventario.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">Id Sede Inventario </td>
      <td width="162"><label>
        <input type="text" name="IdSedeInventario"  required value="<%=Id_Sede_Inventario%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Id sede </td>
      <td><label>
              <input type="text" name="Id_sede" required value="<%=Id_sede%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td>Id Tipo Inventario </td>
      <td><label>
        <input type="text" name="IdTipoInventario" required value="<%=Id_Tipo_Inventario%>" />
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
