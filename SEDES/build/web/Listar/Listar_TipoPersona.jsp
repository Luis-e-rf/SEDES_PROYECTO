<%-- 
    Document   : Listar_TipoPersona
    Created on : 21/08/2015, 03:49:45 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoPersona"%>
<%@page import="Daos.DaoTipoPersona"%>
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
        <title>Consultar Roll</title>
    </head>
    <body>
         <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Rol De una Persona</h2>
        <table class="devolver" width="916" border="1">
        <tr>
    <td   align="center">Tipo Persona N°</td>
    <td  align="center">Nombre Del Rol</td>
    <td  align="center">Descripcion Rol</td>
   
  </tr>
  <%
     DaoTipoPersona  TipoPersona= new  DaoTipoPersona();
     TipoPersona    tipopersona = new TipoPersona();
     ArrayList       Listar = new ArrayList();
     Listar = TipoPersona.ListarTipoPersona();
     
     for (int i=0;i<Listar.size();i++)
     {
         tipopersona = (TipoPersona) Listar.get(i);
          long  id_Tipo_Persona  = tipopersona.getId_Tipo_Persona();
          String  Nombre_Tipo_Persona = tipopersona.getNombre_Tipo_Persona();
          String  Descripcion_Tipo_Persona   = tipopersona.getDescripcion_Tipo_Persona();
         
          
          out.print("<tr>");
                    out.print("<td>"+id_Tipo_Persona+"</td>");
                    out.print("<td>"+Nombre_Tipo_Persona+"</td>");
                    out.print("<td>"+Descripcion_Tipo_Persona+"</td>");
                    
                   
                   
      out.print("</tr>");
     }
     
  %>
   </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
