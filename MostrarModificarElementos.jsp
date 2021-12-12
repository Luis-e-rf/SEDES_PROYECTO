<%-- 
    Document   : MostrarModificarElementos
    Created on : 27/07/2015, 02:01:35 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoEstado"%>
<%@page import="Clases.Estado"%>
<%@page import="Daos.DaoMarca"%>
<%@page import="Clases.Marca"%>
<%@page import="Daos.DaoTipoElemento"%>
<%@page import="Clases.TipoElemento"%>
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
        <input type="text" name="Id_Elemento"  required value="<%=Id_Elemento%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Nombre Elemento</td>
      <td><label>
              <input type="text" name="Nombre_Elemento" required value="<%=Nombre_Elemento%>"/>
      </label></td>
    </tr>
    
    <tr>
        <td>Tipo Elemento </td>     
       <td><label>
        <select name="TipoElemento" required>
            <%
       TipoElemento tipoElemento =new TipoElemento();
       DaoTipoElemento  TipoElemento = new DaoTipoElemento();
       
      
      Listar=TipoElemento.ListarTipoElemento();
      
        for (int i=0;i<Listar.size();i++)
        {
        tipoElemento=(TipoElemento)Listar.get(i);
        long idTipo_Elemento= tipoElemento.getIdTipo_Elemento();
        String Nombre_Tipo_Elemento=tipoElemento.getNombre_Tipo_Elemento();  
                
         out.print("<option value="+idTipo_Elemento+">"+Nombre_Tipo_Elemento+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>
      <tr>
        <td>Marca Del Elemento</td>     
       <td><label>
        <select name="Marca" required>
            <%
       Marca marca =new Marca();
       DaoMarca Marca = new DaoMarca();
       
      
      Listar=Marca.listarMarca();
      
        for (int i=0;i<Listar.size();i++)
        {
        marca=(Marca)Listar.get(i);
        long idMarca= marca.getIdMarca();
        String Nombre_Marca=marca.getNombre_Marca();  
                
         out.print("<option value="+idMarca+">"+Nombre_Marca+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>
    <tr>
        <td>Estado</td>     
       <td><label>
        <select name="Estado" required>
            <%
       Estado estado =new  Estado();
       DaoEstado  Estado = new DaoEstado();
     
      Listar= Estado.listarEstado() ;
      
        for (int i=0;i<Listar.size();i++)
        {
        estado=(Estado)Listar.get(i);
        long Id_Estado= estado.getId_Estado();
        String Nombre_Estado= estado.getNombre_Estado();  
                
         out.print("<option value="+Id_Estado+">"+Nombre_Estado+"</option>");      
        }            
        %>
        </select>
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
