<%-- 
    Document   : MostrarModificarPersonaProfesion
    Created on : 28/07/2015, 03:53:09 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.PersonaProfesion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoPersonaProfesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
      long id_instructor_profesion;
      long documento_Persona;
      long id_profesion;
    
    %> 
    
    <%
    DaoPersonaProfesion PersonaProfesion = new DaoPersonaProfesion();
                
                PersonaProfesion personaprofesion = new PersonaProfesion();
                ArrayList Listar = new ArrayList();
                
                Listar = PersonaProfesion.ListarPersonaProfesion(Long.parseLong(request.getParameter("idinstructorprofesion")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    personaprofesion =(PersonaProfesion) Listar.get(i);
                    id_instructor_profesion = personaprofesion.getId_instructor_profesion();
                    documento_Persona = personaprofesion.getDocumento_Persona();
                    id_profesion = personaprofesion.getId_profesion();
                    
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Persona Profesion</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Persona Profesion</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarPersonaProfesion.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">id instructor profesion </td>
      <td width="162"><label>
        <input type="text" name="id_instructor_profesion"  required value="<%=id_instructor_profesion%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>documento Persona</td>
      <td><label>
              <input type="text" name="documento_Persona" required value="<%=documento_Persona%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td>id profesion </td>
      <td><label>
        <input type="text" name="id_profesion" required value="<%=id_profesion%>" />
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
