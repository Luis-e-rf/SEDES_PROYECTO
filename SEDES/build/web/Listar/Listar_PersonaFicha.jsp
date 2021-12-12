<%-- 
    Document   : Listar_PersonaFicha
    Created on : 21/08/2015, 02:03:40 PM
    Author     : ADSI SENA
--%>

<%@page import="Clases.PersonaFicha"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoPersonaFicha"%>
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
        <title>Consultar Aulas</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Aula</h2>
        <table class="devolver" width="916" border="1">
        <tr>
    <td  align="center">Persona Ficha N°</td>
    <td width="244"  align="center">Ficha</td>
    <td  align="center">Documento Persona N°</td>
  
   
  </tr>
  <%
     DaoPersonaFicha PersonaFicha = new  DaoPersonaFicha();
     PersonaFicha    personaficha = new PersonaFicha();
     ArrayList       Listar = new ArrayList();
     Listar = PersonaFicha.ListarPersonaFicha();
     
     for (int i=0;i<Listar.size();i++)
     {
         personaficha = (PersonaFicha) Listar.get(i);
          long  id_Persona_ficha  = personaficha.getId_Persona_ficha();
          long  numero_ficha = personaficha.getNumero_ficha();
          long  documento_Persona   = personaficha.getDocumento_Persona();
          
          
          out.print("<tr>");
                    out.print("<td>"+id_Persona_ficha+"</td>");
                    out.print("<td>"+numero_ficha+"</td>");
                    out.print("<td>"+documento_Persona+"</td>");
                    
                   
                   
      out.print("</tr>");
     }
     
  %>
        </table>
  <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
