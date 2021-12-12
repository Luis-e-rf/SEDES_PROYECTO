<%-- 
    Document   : MostrarModificarElementos
    Created on : 27/07/2015, 02:01:35 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoTipoInventario"%>
<%@page import="Clases.TipoInventario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Elementos"%>
<%@page import="Daos.DaoElementos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
     long Id_Elemento;
     String Nombre_Elemento;
     String Descripcion_Elemento;
    
    %> 
    
    <%
    DaoElementos Elementos = new DaoElementos();
                
                Elementos elementos = new Elementos();
                ArrayList Listar = new ArrayList();
                
                Listar = Elementos.ListarElementosUnico(Long.parseLong(request.getParameter("IdElemento")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    elementos  =(Elementos ) Listar.get(i);
                    Id_Elemento = elementos.getId_Elemento();
                    Nombre_Elemento = elementos.getNombre_Elemento();
                    Descripcion_Elemento = elementos.getDescripcion_Elemento();
                    
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Elementos</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Elemento</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarElementos.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">Elemento</td>
      <td width="162"><label>
        <input type="text" name="IdElemento"  required value="<%=Id_Elemento%>" readonly="" />
      </label></td>
    </tr>  
    <tr>
        <td>Tipo Inventario </td>     
       <td><label>
        <select name="tipoInven" required>
            <%
       TipoInventario tipoInventario =new TipoInventario();
       DaoTipoInventario  TipoInventario = new DaoTipoInventario();
       
      
      Listar=TipoInventario.ListarTipoInventario();
      
        for (int i=0;i<Listar.size();i++)
        {
        tipoInventario=(TipoInventario)Listar.get(i);
        long id_Tipo_Inventario= tipoInventario.getId_Tipo_Inventario();
        String Nombre_Tipo_Inventario=tipoInventario.getNombre_Tipo_Inventario();  
                
         out.print("<option value="+id_Tipo_Inventario+">"+Nombre_Tipo_Inventario+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>     
    <tr>
      <td>Nombre Elemento</td>
      <td><label>
              <input type="text" name="NombreElemento" required value="<%=Nombre_Elemento%>"/>
      </label></td>
    </tr>
    <tr>
      <td>Descripcion Elemento</td>
      <td><label>
        <input type="text" name="DescripcionElemento" required value="<%=Descripcion_Elemento%>" />
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
