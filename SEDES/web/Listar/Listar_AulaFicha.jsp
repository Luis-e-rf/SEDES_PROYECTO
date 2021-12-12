<%-- 
    Document   : Listar_AulaFicha
    Created on : 19/08/2015, 06:36:00 PM
    Author     : ADSI SENA
--%>

<%@page import="Clases.Aula"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Aula_ficha"%>
<%@page import="Daos.DaoAula_ficha"%>
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
        <title>Consultar Aulas Fichas</title>
    </head>
    <body>
    <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Aula de las Fichas</h2>
        <table class="devolver" width="916" border="1">
    <tr>
    <td width="130" align="center">Aula Ficha N°</td>
    <td width="150" align="center">Numero Ficha</td>
    <td width="130" align="center">Aula N°</td>
   
    
  </tr>
  <%
     DaoAula_ficha aula = new  DaoAula_ficha();
     Aula_ficha   Aulaficha = new Aula_ficha();
     ArrayList       Listar = new ArrayList();
     Listar = aula.listarAula_ficha();
     
     for (int i=0;i<Listar.size();i++)
     {
         Aulaficha = (Aula_ficha) Listar.get(i);
          long  id_aula_ficha      = Aulaficha.getId_aula();
          long  numero_ficha = Aulaficha.getNumero_ficha();
          long  id_aula      = Aulaficha.getId_aula();
          
          
          out.print("<tr>");
                    out.print("<td>"+id_aula_ficha+"</td>");
                    out.print("<td>"+numero_ficha+"</td>");
                    out.print("<td>"+id_aula+"</td>");
                   
      out.print("</tr>");
     }
     
  %>
</table>
  <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
