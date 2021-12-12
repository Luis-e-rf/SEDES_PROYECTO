<%-- 
    Document   : MostraModificarMarca
    Created on : 26/08/2015, 05:17:18 PM
    Author     : Diego
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Marca"%>
<%@page import="Daos.DaoMarca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
      long id_Marca;
     String Nombre_Marca;
     String Descripcion_Marca;

    
    %> 
    
    <%
    DaoMarca Marca = new DaoMarca();
                
                Marca marca  = new Marca();
                ArrayList Listar = new ArrayList();
                
                Listar = Marca.ListarMarcaUnico(Long.parseLong(request.getParameter("idMarca")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    marca  =(Marca) Listar.get(i);
                    id_Marca = marca.getId_Marca();
                    Nombre_Marca = marca.getNombre_Marca();
                    Descripcion_Marca = marca.getDescripcion_Marca();
                    
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Marca</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Marca</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarMarca.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">Id Marca</td>
      <td width="162"><label>
        <input type="text" name="idMarca"  required value="<%=id_Marca%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Nombre Marca</td>
      <td><label>
              <input type="text" name="NombreMarca" required value="<%=Nombre_Marca%>"/>
      </label></td>
    </tr>
    <tr>
      <td>Descripcion Marca </td>
      <td><label>
        <input type="text" name="DescripcionMarca" required value="<%=Descripcion_Marca%>" />
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
