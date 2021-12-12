<%-- 
    Document   : EliminarPersonaFicha
    Created on : 27/07/2015, 06:49:09 PM
    Author     : ADSI  Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.PersonaFicha"%>
<%@page import="Daos.DaoPersonaFicha"%>
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
    <h1>Eliminar Persona Ficha</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarPersonaFicha.jsp">
    <center>
        <table id="sel" border="1">
     <tr>
       <td width="133">Eliminar Persona Ficha </td>
      <td width="121"><label>
        <select name="id_persona_ficha">
            <%
                DaoPersonaFicha PersonaFicha = new DaoPersonaFicha();
                
                PersonaFicha personaficha = new PersonaFicha();
                ArrayList Listar = new ArrayList();
                
                Listar = PersonaFicha.ListarPersonaFicha();
                
                for (int i=0;i<Listar.size();i++)
                {
                   personaficha =(PersonaFicha) Listar.get(i);
                   long id_persona_ficha=personaficha.getId_Persona_ficha();
                    long numero_ficha = personaficha.getDocumento_Persona();
                    
                    out.print("<option value = "+ id_persona_ficha+">"+numero_ficha+"");
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
