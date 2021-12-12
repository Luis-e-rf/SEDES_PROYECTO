<%-- 
    Document   : Listar_Elementos
    Created on : 19/08/2015, 05:15:49 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Elementos"%>
<%@page import="Daos.DaoElementos"%>
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
        <title>Consultar Elementos</title>
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <h2>Elementos</h2>
        <table class="devolver" width="916" border="1">
        <tr>
    <td   align="center">Elemento N°</td>
    <td  align="center">Nombre Elemento</td>
    <td  align="center">Tipo Elemento</td>
    <td  align="center">Marca</td>
    <td  align="center">Estado</td>
     <td  align="center">Descripcion</td>
    </td>
 
  </tr>
  <%
     DaoElementos Elementos = new  DaoElementos();
     Elementos  elemento = new Elementos();
     ArrayList       Listar = new ArrayList();
     Listar = Elementos.listarElementos();
     
     for (int i=0;i<Listar.size();i++)
     {
         elemento = (Elementos) Listar.get(i);
          long  Id_Elemento   = elemento.getId_Elemento();
          String  Nombre_Elemento = elemento.getNombre_Elemento();
          String  Descripcion_Elemento   = elemento.getDescripcion_Elemento(); 
          long idTipo_Elemento = elemento.getId_Tipo_Elemento();
          long idMarca = elemento.getId_Marca();
          long Id_Estado = elemento.getId_Estado();
          out.print("<tr>");
                    out.print("<td>"+Id_Elemento+"</td>");
                    out.print("<td>"+Nombre_Elemento+"</td>");
                    out.print("<td>"+idTipo_Elemento+"</td>");
                    out.print("<td>"+idMarca+"</td>");
                    out.print("<td>"+Id_Estado+"</td>");
                    out.print("<td>"+Descripcion_Elemento+"</td>");
      out.print("</tr>");
     }
     
  %>
        
         </table>
    <center>
       <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center> 
      
        
    </body>
</html>
