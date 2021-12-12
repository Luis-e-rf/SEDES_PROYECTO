<%-- 
    Document   : ModificarPersonaProfesion
    Created on : 27/07/2015, 06:33:51 PM
    Author     : ADSI Sena
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
        <title>Modificar Persona Profesion </title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Persona Profesion
       </h2>

    <form id="form6" action="../Modificar/MostrarModificarPersonaProfesion.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>PERSONAPROFESION</td>
      <td><label>
        <select name="idinstructorprofesion" >
            <%   
        DaoPersonaProfesion  PersonaProfesion = new DaoPersonaProfesion();
       PersonaProfesion personaprofesion = new PersonaProfesion();
        ArrayList Listar =new ArrayList();
         
        Listar= PersonaProfesion.ListarPersonaProfesion();
        
         for (int i=0;i<Listar.size();i++)
         {
         personaprofesion=(PersonaProfesion)Listar.get(i);
         long id_instructor_profesion = personaprofesion.getId_Persona_profesion();
         
         
          out.print("<option value="+id_instructor_profesion+"></option>");
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
