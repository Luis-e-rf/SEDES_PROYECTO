<%-- 
    Document   : Mostrar_Modificar_Programa
    Created on : 3/07/2015, 06:44:42 PM
    Author     : Diego
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Programa"%>
<%@page import="Daos.DaoPrograma"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
  long id_programa;
  String nombre_programa;
  long version_programa;
  String descripcion_programa;
    
    %> 
    
    <%
    DaoPrograma Programa = new DaoPrograma();
                
                Programa programa = new Programa();
                ArrayList Listar = new ArrayList();
                
                Listar = Programa.ListarProgramaUnico(Long.parseLong(request.getParameter("idprograma")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    programa =(Programa) Listar.get(i);
                    id_programa = programa.getId_programa();
                    nombre_programa = programa.getNombre_programa();
                    version_programa = programa.getVersion_programa();
                    descripcion_programa = programa.getDescripcion_programa();
                    
                  
                }
   %>
   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Datos de un Progama</title>
    </head>
    <body>
         <center><img src="../imagenes/modificar.png" alt=""/></center>
         <h1>Modificar Datos de un Progama</h1>
        
         <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarPrograma.jsp">
  <table width="346" border="1">
    <tr>
      <td width="168">Programa N° </td>
      <td width="162"><label>
        <input type="number" name="Programa"  required value="<%=id_programa%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Nombre Programa</td>
      <td><label>
              <input id="datos" type="text" name="nombrePrograma" required value="<%=nombre_programa%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td> Version Programa </td>
      <td><label>
        <input type="number" name=" versionPrograma" required value="<%= version_programa%>" />
      </label></td>
    </tr>
    <tr>
      <td>Descripcion Programa </td>
      <td><label>
        <input type="text" name="descripcionPrograma" required value="<%=descripcion_programa%>" />
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

