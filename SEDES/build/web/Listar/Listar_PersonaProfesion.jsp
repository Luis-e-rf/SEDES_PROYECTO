<%-- 
    Document   : Listar_PersonaProfesion
    Created on : 21/08/2015, 02:14:22 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.PersonaProfesion"%>
<%@page import="Daos.DaoPersonaProfesion"%>
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
        <title>Consultar Persona Profesion</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Aula</h2>
        <table class="devolver" width="916" border="1">
         <tr>
    <td  width="216"align="center">Instructor Profesion</td>
    <td  align="center">Documento </td>
    <td  align="center">Profesion</td>
  
   
  </tr>
  <%
     DaoPersonaProfesion PersonaProfesion = new  DaoPersonaProfesion();
     PersonaProfesion    personaprofesion = new PersonaProfesion();
     ArrayList       Listar = new ArrayList();
     Listar = PersonaProfesion.ListarPersonaProfesion();
     
     for (int i=0;i<Listar.size();i++)
     {
         personaprofesion = (PersonaProfesion) Listar.get(i);
          long  id_Persona_profesion  = personaprofesion.getId_Persona_profesion();
          long  documento_Persona = personaprofesion.getDocumento_Persona();
          long  id_profesion   = personaprofesion.getId_profesion();
          
          
          out.print("<tr>");
                    out.print("<td>"+id_Persona_profesion+"</td>");
                    out.print("<td>"+documento_Persona+"</td>");
                    out.print("<td>"+id_profesion+"</td>");
                    
                   
                   
      out.print("</tr>");
     }
     
  %>
  </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
