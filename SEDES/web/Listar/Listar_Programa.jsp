<%-- 
    Document   : Listar_Programa
    Created on : 21/08/2015, 02:33:55 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Programa"%>
<%@page import="Daos.DaoPrograma"%>
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
        <title>Consultar Programas</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Programa</h2>
        <table class="devolver" width="916" border="1">
         <tr id="tu">
    
    <td  align="center">Nombre Programa</td>
    <td  align="center">Version Programa</td>
    <td  align="center">Descripcion Programa</td>
   
  </tr>
  <%
     DaoPrograma Programa= new  DaoPrograma();
     Programa    programa = new Programa();
     ArrayList       Listar = new ArrayList();
     Listar = Programa.ListarPrograma();
     
     for (int i=0;i<Listar.size();i++)
     {
         programa = (Programa) Listar.get(i);
          String  nombre_programa = programa.getNombre_programa();
          long  version_programa   = programa.getVersion_programa();
          String  descripcion_programa   = programa.getDescripcion_programa();
          
          out.print("<tr>");
                    
                    out.print("<td>"+nombre_programa+"</td>");
                    out.print("<td>"+version_programa+"</td>");
                    out.print("<td>"+descripcion_programa+"</td>");
                   
                   
      out.print("</tr>");
     }
     
  %>
  </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
