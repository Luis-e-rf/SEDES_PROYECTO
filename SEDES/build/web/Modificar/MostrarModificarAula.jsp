<%-- 
    Document   : Mostrar_Modificar_Aula
    Created on : 3/07/2015, 01:10:00 PM
    Author     : Diego
--%>

<%@page import="Daos.DaoSede"%>
<%@page import="Clases.Sede"%>
<%@page import="Daos.DaoTipoAula"%>
<%@page import="Clases.TipoAula"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Aula"%>
<%@page import="Daos.DaoAula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
    long id_aula;
    long id_tipo_aula;
    long id_sede;
    String nombre_aula;
    String observaciones_aula;
    
    %> 
    
    <%
    DaoAula Aula = new DaoAula();
                
                Aula aula = new Aula();
                ArrayList Listar = new ArrayList();
                
                Listar = Aula.ListarAulaUnica(Long.parseLong(request.getParameter("id_aula")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    aula =(Aula) Listar.get(i);
                    id_aula = aula.getId_aula();
                    id_tipo_aula = aula.getId_tipo_aula();
                    id_sede = aula.getId_sede();
                    nombre_aula = aula.getNombre_aula();
                    observaciones_aula = aula.getObservaciones_aula();
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Aula</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Aula</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarAula.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168"> Aula </td>
      <td width="162"><label>
        <input type="text" name="id_aula"  required value="<%=id_aula%>" readonly="" />
      </label></td>
    </tr>
   
    <tr>
        <td>Tipo Aula </td>     
       <td><label>
        <select name="idtipoaula" required>
            <%
       TipoAula tipoAula =new TipoAula();
       DaoTipoAula  TipoAula = new DaoTipoAula();
       
      
      Listar=TipoAula.ListarTipoAula();
      
        for (int i=0;i<Listar.size();i++)
        {
        tipoAula=(TipoAula)Listar.get(i);
        long id_tipo_aula= tipoAula.getId_tipo_aula();
        String nombre_tipo_aula=tipoAula.getNombre_tipo_aula();  
                
         out.print("<option value="+id_tipo_aula+">"+nombre_tipo_aula+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>
        
       <tr>
        <td>Sede</td>     
       <td><label>
        <select name="id_sede" required>
            <%
       Sede sede =new Sede();
       DaoSede  Sede = new DaoSede();
       
      
      Listar=Sede.ListarSede();
      
        for (int i=0;i<Listar.size();i++)
        {
        sede=(Sede)Listar.get(i);
        long id_sede= sede.getId_sede();
        String nombre_sede=sede.getNombre_sede();  
                
         out.print("<option value="+id_sede+">"+nombre_sede+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>
    <tr>
      <td>Nombre Aula </td>
      <td><label>
              <input id="datos" type="text" name="nombre_aula" required value="<%=nombre_aula%>" />
      </label></td>
    </tr>
    <tr>
      <td>Observaciones Aula</td>
      <td><label>
        <input type="text" name="observaciones_aula" required value="<%=observaciones_aula%>"/>
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
