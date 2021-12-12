<%-- 
    Document   : Listar_Inventario
    Created on : 19/08/2015, 04:47:33 PM
    Author     : ADSI SENA
--%>

<%@page import="Clases.Inventario_Elementos"%>
<%@page import="Daos.DaoInventarioElementos"%>
<%@page import="java.util.ArrayList"%>
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
        <title>JSP Page</title>
    </head>
    <body>
         <tr>
    <td   align="center">Id_inventario_elementos</td>
    <td  align="center">Id_Tipo_Inventario</td>
    <td  align="center">Id_Elemento</td>
 
  </tr>
  <%
     DaoInventarioElementos Inventarios = new  DaoInventarioElementos();
     Inventario_Elementos  inventario = new Inventario_Elementos();
     ArrayList       Listar = new ArrayList();
     Listar = Inventarios.ListarInventarioElementos();
     
     for (int i=0;i<Listar.size();i++)
     {
         inventario = (Inventario_Elementos) Listar.get(i);
          long  Id_inventario_elementos   = inventario.getId_inventario_elementos();
          long  Id_Tipo_Inventario = inventario.getId_Tipo_Inventario();
          long  Id_Elemento   = inventario.getId_Elemento();
          
          out.print("<tr>");
                    out.print("<td>"+Id_inventario_elementos+"</td>");
                    out.print("<td>"+Id_Tipo_Inventario+"</td>");
                    out.print("<td>"+Id_Elemento+"</td>");
                 
      out.print("</tr>");
     }
     
  %>
  
 </body>
</html>
