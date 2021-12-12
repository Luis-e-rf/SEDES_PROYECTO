<%-- 
    Document   : MostrarModificarTipoInventario
    Created on : 27/07/2015, 04:38:43 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoInventario"%>
<%@page import="Daos.DaoTipoInventario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
      long Id_Tipo_Inventario;
     String Nombre_Tipo_Inventario;
     String Descripcion_Tipo_Inventario;
    
    %> 
    
    <%
    DaoTipoInventario TipoInventario= new DaoTipoInventario();
                
                TipoInventario tipoinventario = new TipoInventario();
                ArrayList Listar = new ArrayList();
                
                Listar = TipoInventario.ListarTipoInventariounico(Long.parseLong(request.getParameter("IdTipoInventario")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    tipoinventario  =(TipoInventario ) Listar.get(i);
                    Id_Tipo_Inventario = tipoinventario.getId_Tipo_Inventario();
                    Nombre_Tipo_Inventario = tipoinventario.getNombre_Tipo_Inventario();
                    Descripcion_Tipo_Inventario = tipoinventario.getDescripcion_Tipo_Inventario();
                    
                    
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Tipo Inventario</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Tipo Inventario</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarTipoInventario.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">Id Tipo Inventario</td>
      <td width="162"><label>
        <input type="text" name="Id_Tipo_Inventario"  required value="<%=Id_Tipo_Inventario%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Nombre Tipo Inventario</td>
      <td><label>
              <input type="text" name="Nombre_Tipo_Inventario" required value="<%=Nombre_Tipo_Inventario%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td>Descripcion Tipo Inventario </td>
      <td><label>
        <input type="text" name="Descripcion_Tipo_Inventario" required value="<%=Descripcion_Tipo_Inventario%>" />
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