<%-- 
    Document   : MostrarModificarTipoAula
    Created on : 27/07/2015, 02:17:25 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoAula"%>
<%@page import="Daos.DaoTipoAula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<%!
      long id_tipo_aula;
     String nombre_tipo_aula;
     String descripcion_tipo_aula;
    
    %> 
    
    <%
    DaoTipoAula TipoAula= new DaoTipoAula();
                
                TipoAula tipoaula = new TipoAula();
                ArrayList Listar = new ArrayList();
                
                Listar = TipoAula.ListarTipoAulaUnica(Long.parseLong(request.getParameter("IdTipoAula")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    tipoaula  =(TipoAula ) Listar.get(i);
                    id_tipo_aula = tipoaula.getId_tipo_aula();
                    nombre_tipo_aula = tipoaula.getNombre_tipo_aula();
                    descripcion_tipo_aula = tipoaula.getDescripcion_tipo_aula();
                    
                    
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Tipo Aula</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Tipo Aula</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarTipoAula.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">id_tipo_aula</td>
      <td width="162"><label>
        <input type="text" name="IdTipoAula"  required value="<%=id_tipo_aula%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>nombre_tipo_aula</td>
      <td><label>
              <input type="text" name="nombre_tipo_aula" required value="<%=nombre_tipo_aula%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td>descripcion_tipo_aula </td>
      <td><label>
        <input type="text" name="descripciontipoaula" required value="<%=descripcion_tipo_aula%>" />
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
