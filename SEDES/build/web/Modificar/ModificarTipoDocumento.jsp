<%-- 
    Document   : ModificarTipoDocumento
    Created on : 16/06/2015, 03:04:33 PM
    Author     : ADSI Sena
--%>


<%@page import="Clases.TipoDocumento"%>
<%@page import="Daos.DaoTipoDocumento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <%!
    String Usuario ="";
%>
<%
    
    HttpSession SessionActiva = request.getSession();
    
    if(SessionActiva.getAttribute("Usuario")==null)
    {
%>
    <script type="text/javascript">
    
    alert("Por Favor Iniciar Sesión");
    location.href="../paginas/ingresar.jsp";
    
    </script>

<%    
    }
    
    else 
    {
    
    Usuario =(String)SessionActiva.getAttribute("Usuario");
    }

%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Tipo Documento
        </title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Tipo Documento
       </h2>

    <form id="form6" action="../Modificar/MostrarModificarTipoDocumento.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>TIPO DOCUMENTO</td>
      <td><label>
        <select name="idtipodocumento">
            <%   
        DaoTipoDocumento  TipoDocumento = new DaoTipoDocumento();
       TipoDocumento tipodocumento = new TipoDocumento();
        ArrayList Listar =new ArrayList();
         
        Listar= TipoDocumento.ListarTipoDocumento();
        
         for (int i=0;i<Listar.size();i++)
         {
         tipodocumento=(TipoDocumento)Listar.get(i);
        long id_tipo_documento = tipodocumento.getId_tipo_documento();
        String nombre_tipo_documento = tipodocumento.getNombre_tipo_documento();
         
          out.print("<option value="+id_tipo_documento+">"+nombre_tipo_documento+"</option>");
         }
         %>
        </select>
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
