<%-- 
    Document   : Mostrar_Modificar_Tipo_Documento
    Created on : 3/07/2015, 06:56:34 PM
    Author     : Diego
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoDocumento"%>
<%@page import="Daos.DaoTipoDocumento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
   long id_tipo_documento;
   String nombre_tipo_documento;
   String descripcion_tipo_documento;
    
    %> 
    
    <%
    DaoTipoDocumento  TipoDocumento = new DaoTipoDocumento();
                
                TipoDocumento tipodocumento = new TipoDocumento();
                ArrayList Listar = new ArrayList();
                
                Listar = TipoDocumento.ListarTipoDocumentoUnico(Long.parseLong(request.getParameter("idtipodocumento")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    tipodocumento =(TipoDocumento) Listar.get(i);
                    id_tipo_documento = tipodocumento.getId_tipo_documento();
                    nombre_tipo_documento = tipodocumento.getNombre_tipo_documento();
                   descripcion_tipo_documento = tipodocumento.getDescripcion_tipo_documento();
                    
                  
                }
   %>
   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
        <title>Modificar Datos Tipo Documento</title>
    </head>
    <body>
        <center><img src="../imagenes/modificar.png" alt=""/></center>
         <h1>Modificar Datos Tipo Documento</h1>
         <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarTipoDocumento.jsp">
  <table width="304" border="1">
    <tr>
      <td width="135">Tipo de Documento N° </td>
      <td width="153"><label>
       <input type="text" name="idtipodocumento"  required value="<%=id_tipo_documento%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Nombre</td>
      <td><label>
              <input id="datos" type="text" name="nombre_tipo_documento" required value="<%=nombre_tipo_documento%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td>Descripcion </td>
      <td><label>
        <input type="text" name="descripciontipodocumento" required value="<%=descripcion_tipo_documento%>" />
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
