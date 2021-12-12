<%-- 
    Document   : ModificarProfesion
    Created on : 16/06/2015, 02:57:22 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Profesion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoProfesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
     <head>
          <%!
    String Usuario ="";
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
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Profesion</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Profesion</h2>

       <form id="form6" action="../Modificar/MostrarModificarProfesion.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>PROFESION</td>
      <td><label>
        <select name="IdProfesion" >
            <%   
        DaoProfesion  Profesion= new DaoProfesion();
        Profesion profesion = new Profesion();
        ArrayList Listar =new ArrayList();
         
        Listar= Profesion.ListarProfesion();
        
         for (int i=0;i<Listar.size();i++)
         {
         profesion=(Profesion)Listar.get(i);
         long id_profesion= profesion.getId_profesion();
         String nombre_profesion=profesion.getNombre_profesion();
         
          out.print("<option value="+id_profesion+">"+nombre_profesion+"</option>");
         }
         %>
        </select>
      </label></td>
    </tr>
    </table>
 <center>
<button type="submit" h>Modificar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
 </center>
</form>
    </body>
</html>

