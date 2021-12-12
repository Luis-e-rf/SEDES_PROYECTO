<%-- 
    Document   : Listar_TipoDocumento
    Created on : 21/08/2015, 03:40:16 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoDocumento"%>
<%@page import="Daos.DaoTipoDocumento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%!
    String Usuario ="";
    long Documento_Persona;
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
        <link rel="shortcut icon" href="../imagenes/escudo.png">
        <link href="../css/estiloconsultas.css" rel="stylesheet" type="text/css"/>
        <title>Consultar Tipo Documento</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Tipo Documento</h2>
        <table class="devolver" width="916" border="1">
          <tr>
    <td  align="center">Tipo Documento N°</td>
    <td  align="center">Nombre Tipo Documento</td>
    <td  align="center">Descripcion Tipo Documento</td>
   
   
  </tr>
  <%
     DaoTipoDocumento TipoDocumento= new  DaoTipoDocumento();
     TipoDocumento    tipodocumento = new TipoDocumento();
     ArrayList       Listar = new ArrayList();
     Listar = TipoDocumento.ListarTipoDocumento();
     
     for (int i=0;i<Listar.size();i++)
     {
         tipodocumento = (TipoDocumento) Listar.get(i);
          long  id_tipo_documento  = tipodocumento.getId_tipo_documento();
          String  nombre_tipo_documento = tipodocumento.getNombre_tipo_documento();
          String  descripcion_tipo_documento   = tipodocumento.getDescripcion_tipo_documento();
         
          
          out.print("<tr>");
                    out.print("<td>"+id_tipo_documento+"</td>");
                    out.print("<td>"+nombre_tipo_documento+"</td>");
                    out.print("<td>"+descripcion_tipo_documento+"</td>");
                    
                   
                   
      out.print("</tr>");
     }
     
  %>
  </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
