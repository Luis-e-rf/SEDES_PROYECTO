<%-- 
    Document   : Listar_TipoAula
    Created on : 21/08/2015, 03:34:52 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoAula"%>
<%@page import="Daos.DaoTipoAula"%>
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
        <title>Consultar Tipo Aula</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Tipo Aula</h2>
        <table class="devolver" width="916" border="1">
          <tr>
    <td   align="center">Tipo Aula N°</td>
    <td  align="center">Nombre Tipo Aula</td>
    <td  align="center">Descripcion Tipo Aula</td>
   
   
  </tr>
  <%
     DaoTipoAula TipoAula= new  DaoTipoAula();
     TipoAula    tipoaula = new TipoAula();
     ArrayList       Listar = new ArrayList();
     Listar = TipoAula.ListarTipoAula();
     
     for (int i=0;i<Listar.size();i++)
     {
         tipoaula = (TipoAula) Listar.get(i);
          long  id_tipo_aula  = tipoaula.getId_tipo_aula();
          String  nombre_tipo_aula = tipoaula.getNombre_tipo_aula();
          String  descripcion_tipo_aula   = tipoaula.getDescripcion_tipo_aula();
         
          
          out.print("<tr>");
                    out.print("<td>"+id_tipo_aula+"</td>");
                    out.print("<td>"+nombre_tipo_aula+"</td>");
                    out.print("<td>"+descripcion_tipo_aula+"</td>");
                    
                   
                   
      out.print("</tr>");
     }
     
  %>
  </table>
    <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
    </body>
</html>
