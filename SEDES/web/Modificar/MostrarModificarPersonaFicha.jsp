<%-- 
    Document   : MostrarModificarPersonaFicha
    Created on : 28/07/2015, 03:35:08 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.PersonaFicha"%>
<%@page import="Daos.DaoPersonaFicha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
      long id_instructor_ficha;
      long numero_ficha;
      long documento_Persona;
    
    %> 
    
    <%
    DaoPersonaFicha PersonaFicha = new DaoPersonaFicha();
                
                PersonaFicha personaficha = new PersonaFicha();
                ArrayList Listar = new ArrayList();
                
                Listar = PersonaFicha.ListarPersonaFicha(Long.parseLong(request.getParameter("numeroficha")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    personaficha =(PersonaFicha) Listar.get(i);
                    id_instructor_ficha = personaficha.getId_instructor_ficha();
                    numero_ficha = personaficha.getNumero_ficha();
                    documento_Persona = personaficha.getDocumento_Persona();
                    
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar persona ficha</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar persona ficha</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarPersonaFicha.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">id instructor ficha </td>
      <td width="162"><label>
        <input type="text" name="id_instructor_ficha"  required value="<%=id_instructor_ficha%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>numero ficha</td>
      <td><label>
              <input type="text" name="numero_ficha" required value="<%=numero_ficha%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td>documento_Persona </td>
      <td><label>
        <input type="text" name="documento_Persona" required value="<%=documento_Persona%>" />
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
