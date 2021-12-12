<%-- 
    Document   : EliminarPersonaProfesion
    Created on : 28/07/2015, 05:23:15 PM
    Author     : ADSI  Sena
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
         <title>ELIMINAR</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Instructor Profesion</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarPersonaProfesion.jsp">
    <center>
        <table id="sel" border="1">
     <tr>
       <td width="133">Eliminar Instructor Profesion </td>
      <td width="121"><label>
        <select name="Pers_profesion">
            <%
                DaoPersonaProfesion PersonaProfesion = new DaoPersonaProfesion();
                
                PersonaProfesion personaprofesion = new PersonaProfesion();
                ArrayList Listar = new ArrayList();
                
                Listar = PersonaProfesion.ListarPersonaProfesion();
                
                for (int i=0;i<Listar.size();i++)
                {
                   personaprofesion =(PersonaProfesion) Listar.get(i);
                    long id_Persona_profesion = personaprofesion.getDocumento_Persona();
                    
                    out.print("<option value = "+ id_Persona_profesion+">");
                }
            %>
        </select>
          </label>
    </table>
        <button type="submit" >Enviar</button>
        <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
      
    </center>
</form>
    </body>
</html>
