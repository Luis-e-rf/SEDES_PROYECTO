<%-- 
    Document   : Listar_Ficha
    Created on : 19/08/2015, 06:45:22 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Ficha"%>
<%@page import="Daos.DaoFicha"%>
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
        <title>Consultar Fichas</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Fichas</h2>
        <table class="devolver" width="916" border="1">
    <tr id="tu">
    <td   align="center">Numero De Ficha</td>
    <td  align="center">Programa </td>
    <td  align="center">Fecha Inicio</td>
    <td   align="center">Fecha Fin</td>
    
    
  </tr>
  <%
     DaoFicha ficha = new  DaoFicha();
     Ficha    fichas = new Ficha();
     ArrayList       Listar = new ArrayList();
     Listar = ficha.listarFicha();
     
     for (int i=0;i<Listar.size();i++)
     {
         fichas = (Ficha) Listar.get(i);
          long  numero_ficha      = fichas.getNumero_ficha();
          String nombre_programa = fichas.getNombre_programa();
          Date  fecha_inicio      = fichas.getFecha_inicio();
          Date  fecha_fin   = fichas.getFecha_fin();
          
          out.print("<tr>");
                    out.print("<td>"+numero_ficha+"</td>");
                    out.print("<td>"+nombre_programa+"</td>");
                    out.print("<td>"+fecha_inicio+"</td>");
                    out.print("<td>"+fecha_fin+"</td>");
                   
                   
      out.print("</tr>");
     }
     
  %>
  </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
 </body>
</html>
