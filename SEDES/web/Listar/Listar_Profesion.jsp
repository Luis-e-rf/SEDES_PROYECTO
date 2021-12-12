<%-- 
    Document   : Listar_Profesion
    Created on : 21/08/2015, 02:19:20 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Profesion"%>
<%@page import="Daos.DaoProfesion"%>
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
        <title>Consultar Profesiones</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Aula</h2>
        <table class="devolver" width="916" border="1">
         <tr>
    <td width="100"align="center">Profesion N°</td>
    <td width="116" align="center">Nombre Profesion</td>
    <td  align="center">Descripcion Profesion</td>
  
   
  </tr>
  <%
     DaoProfesion Profesion = new  DaoProfesion();
     Profesion    profesion = new Profesion();
     ArrayList       Listar = new ArrayList();
     Listar = Profesion.ListarProfesion();
     
     for (int i=0;i<Listar.size();i++)
     {
         profesion = (Profesion) Listar.get(i);
          long  id_profesion  = profesion.getId_profesion();
          String  nombre_profesion = profesion.getNombre_profesion();
          String  descripcion_profesion = profesion.getDescripcion_profesion();
          
          
          out.print("<tr>");
                    out.print("<td>"+id_profesion+"</td>");
                    out.print("<td>"+nombre_profesion+"</td>");
                    out.print("<td>"+descripcion_profesion+"</td>");
                    
                   
                   
      out.print("</tr>");
     }
     
  %>
  </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
