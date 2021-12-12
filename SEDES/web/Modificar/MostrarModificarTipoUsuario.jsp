<%-- 
    Document   : MostrarModificarTipoUsuario
    Created on : 28/07/2015, 04:56:17 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoUsuario"%>
<%@page import="Daos.DaoTipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
        long Id_Tipo_usuario;
     String Nombre_Tipo_usuario;
     String Descripcion_Tipo_usuario;  
    
    %> 
    
    <%
    DaoTipoUsuario TipoUsuario = new DaoTipoUsuario();
                
                TipoUsuario tipousuario = new TipoUsuario();
                ArrayList Listar = new ArrayList();
                
                Listar = TipoUsuario.ListarTipoUsuariounico(Long.parseLong(request.getParameter("IdTipousuario")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    tipousuario =(TipoUsuario) Listar.get(i);
                    Id_Tipo_usuario = tipousuario.getId_Tipo_usuario();
                    Nombre_Tipo_usuario = tipousuario.getNombre_Tipo_usuario();
                    Descripcion_Tipo_usuario = tipousuario.getDescripcion_Tipo_usuario();
                   
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Tipo Usuario</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Tipo Usuario</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarTipoUsuario.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">Tipo Usuario N°</td>
      <td width="162"><label>
        <input type="text" name="Id_Tipo_usuario"  required value="<%=Id_Tipo_usuario%>"  />
      </label></td>
    </tr>
    <tr>
      <td>Nombre Tipo Usuario</td>
      <td><label>
              <input type="text" name="Nombre_Tipo_usuario" required value="<%=Nombre_Tipo_usuario%>" />
      </label></td>
    </tr>
    <tr>
      <td>Descripcion</td>
      <td><label>
        <input type="text" name="Descripcion_Tipo_usuario" required value="<%=Descripcion_Tipo_usuario%>" />
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

