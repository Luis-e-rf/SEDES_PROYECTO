<%-- 
    Document   : Listar_Sedes
    Created on : 19/08/2015, 04:26:16 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Sede"%>
<%@page import="Daos.DaoSede"%>
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
        <title>Consultar Sedes</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Sedes</h2>
        <table class="devolver" width="916" border="1">
    <tr id="tu">
    <td   align="center">Sede N°</td>
    <td  align="center">Nombre Sede</td>
    <td  align="center">Observaciones Sede</td>

  </tr>
  <%
     DaoSede Sedes = new  DaoSede();
     Sede  Sede = new Sede();
     ArrayList       Listar = new ArrayList();
     Listar = Sedes.ListarSede();
     
     for (int i=0;i<Listar.size();i++)
     {
         Sede = (Sede) Listar.get(i);
          long  id_sede      = Sede.getId_sede();
          String  nombre_sede   = Sede.getNombre_sede();
          String  observaciones_sede  = Sede.getObservaciones_sede();
          
          out.print("<tr>");
                    out.print("<td>"+id_sede+"</td>");
                    out.print("<td>"+nombre_sede+"</td>");
                    out.print("<td>"+observaciones_sede+"</td>");
                   
                   
      out.print("</tr>");
     }
     
  %>
  
  </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
 
    </body>
</html>
