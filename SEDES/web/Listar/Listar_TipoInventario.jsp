<%-- 
    Document   : Listar_TipoInventario
    Created on : 21/08/2015, 03:44:18 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoInventario"%>
<%@page import="Daos.DaoTipoInventario"%>
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
        <title>Consultar Tipo Inventario</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Tipo Inventario</h2>
        <table class="devolver" width="916" border="1">
    <tr>
    <td   align="center">Tipo Inventario N°</td>
    <td  align="center">Nombre Tipo Inventario</td>
    <td  align="center">Descripcion Tipo Inventario</td>
  </tr>
  <%
     DaoTipoInventario  TipoInventario= new  DaoTipoInventario();
     TipoInventario    tipoinventario = new TipoInventario();
     ArrayList       Listar = new ArrayList();
     Listar = TipoInventario.ListarTipoInventario();
     
     for (int i=0;i<Listar.size();i++)
     {
         tipoinventario = (TipoInventario) Listar.get(i);
          long  Id_Tipo_Inventario  = tipoinventario.getId_Tipo_Inventario();
          String  Nombre_Tipo_Inventario = tipoinventario.getNombre_Tipo_Inventario();
          String  Descripcion_Tipo_Inventario   = tipoinventario.getDescripcion_Tipo_Inventario();
         
          
          out.print("<tr>");
                    out.print("<td>"+Id_Tipo_Inventario+"</td>");
                    out.print("<td>"+Nombre_Tipo_Inventario+"</td>");
                    out.print("<td>"+Descripcion_Tipo_Inventario+"</td>");
                    
                   
                   
      out.print("</tr>");
     }
     
  %>
   </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
