<%-- 
    Document   : Mostrar_Modificar_Profesion
    Created on : 3/07/2015, 06:38:14 PM
    Author     : Diego
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Profesion"%>
<%@page import="Daos.DaoProfesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
     long id_profesion;
     String nombre_profesion;
     String descripcion_profesion;
    %> 
    
    <%
    DaoProfesion Profesion = new DaoProfesion();
                
                Profesion profesion = new Profesion();
                ArrayList Listar = new ArrayList();
                
                Listar = Profesion.ListarProfesionUnica(Long.parseLong(request.getParameter("IdProfesion")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    profesion =(Profesion) Listar.get(i);
                    id_profesion =  profesion.getId_profesion();
                    nombre_profesion =  profesion.getNombre_profesion();
                    descripcion_profesion =  profesion.getDescripcion_profesion();
                          
                  
                }
   %>
   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../imagenes/escudo.png">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
        <title>Modificar Datos Profesion</title>
    </head>
    <body>
         <center><img src="../imagenes/modificar.png" alt=""/></center>
         <h1>Modificar Datos Profesion</h1>
        
         <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarProfesion.jsp">
  <table width="304" border="1">
    <tr>
      <td width="135">Profesion N° </td>
      <td width="153"><label>
        <input type="text" name="IdProfesion"  required value="<%=id_profesion%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Nombre</td>
      <td><label>
              <input id="datos" type="text" name="NombreProfesion" required value="<%=nombre_profesion%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td>Descripcion </td>
      <td><label>
        <input type="text" name="DescripcionProfesion" required value="<%=descripcion_profesion%>" />
      </label></td>
    </tr>
  </table>
       <center>
<button type="submit" h>Modificar</button>
<a href="../Modificar/ModificarProfesion.jsp" ><button type="button">Cancelar</button></a>
 </center>
</form>
        
    </body>
   
</html>
