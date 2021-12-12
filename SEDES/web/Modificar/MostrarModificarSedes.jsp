<%-- 
    Document   : Mostrar_Modificar_Sedes
    Created on : 3/07/2015, 06:50:33 PM
    Author     : Diego
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Sede"%>
<%@page import="Daos.DaoSede"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
   long id_sede;
   String nombre_sede;
   String Horario_sede;
   String observaciones_sede;
    
    %> 
    
    <%
    DaoSede Sede = new DaoSede();
    Sede sede = new Sede();
    ArrayList Listar = new ArrayList();
                
    Listar = Sede.ListarSedeUnica(Long.parseLong(request.getParameter("IdSede")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    sede =(Sede) Listar.get(i);
                    id_sede = sede.getId_sede();
                    nombre_sede = sede.getNombre_sede();
                    Horario_sede = sede.getHorario_sede();
                    observaciones_sede = sede.getObservaciones_sede();
                    
                  
                }
   %>
   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="../imagenes/escudo.png">
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
        <title>Modificar datos Sedes</title>
    </head>
    <body>
         <center><img src="../imagenes/modificar.png" alt=""/></center>
         <h1>Modificar Datos Sede</h1>
        
         <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarSede.jsp">
  <table width="304" border="1">
    <tr>
      <td width="135">Sede </td>
      <td width="153"><label>
        <input type="text" name="idsede"  required value="<%=id_sede%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Nombre</td>
      <td><label>
              <input type="text" name="nombresede" required value="<%=nombre_sede%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td>Horario</td>
      <td><label>
              <input id="datos" type="text" name="horariosede" required value="<%=Horario_sede%>"/>
      </label></td>
    </tr>
    <tr>
      <td> Observaciones </td>
      <td><label>
        <input type="text" name="observacionessede" required value="<%= observaciones_sede%>" />
      </label></td>
    </tr>
  </table>
 <center>
<button type="submit" h>Modificar</button>
<a href="../Modificar/ModificarSedes.jsp" ><button type="button">Cancelar</button></a>
 </center>
</form>
        
    </body>
   
</html>
