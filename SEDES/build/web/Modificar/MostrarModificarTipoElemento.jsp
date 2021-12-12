<%-- 
    Document   : MostrarModificarTipoElemento
    Created on : 26/08/2015, 05:38:03 PM
    Author     : Diego
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoElemento"%>
<%@page import="Daos.DaoTipoElemento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
      long Id_Tipo_Elemento;
     String Nombre_Tipo_Elemento;
     String Descripcion_Tipo_Elemento;
    
    %> 
    
    <%
    DaoTipoElemento TipoElemento= new DaoTipoElemento();
                
                TipoElemento tipoelemento = new TipoElemento();
                ArrayList Listar = new ArrayList();
                
                Listar = TipoElemento.ListarTipoElementounico(Long.parseLong(request.getParameter("IdTipoElemento")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    tipoelemento  =(TipoElemento ) Listar.get(i);
                    Id_Tipo_Elemento = tipoelemento.getId_Tipo_Elemento();
                    Nombre_Tipo_Elemento = tipoelemento.getNombre_Tipo_Elemento();
                    Descripcion_Tipo_Elemento = tipoelemento.getDescripcion_Tipo_Elemento();
                    
                    
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Tipo Elemento</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Tipo Elemento</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarTipoElemento.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">Id Tipo Elemento</td>
      <td width="162"><label>
        <input type="text" name="IdTipoElemento" required value="<%=Id_Tipo_Elemento%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Nombre Tipo Elemento</td>
      <td><label>
              <input type="text" name="NombreTipoElemento" required value="<%=Nombre_Tipo_Elemento%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td>Descripcion Tipo Elemento </td>
      <td><label>
        <input type="text" name="DescripcionTipoElemento" required value="<%=Descripcion_Tipo_Elemento%>" />
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