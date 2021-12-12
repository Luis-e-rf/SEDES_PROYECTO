<%-- 
    Document   : ModificarTipoDocumento
    Created on : 16/06/2015, 03:04:33 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Aula"%>
<%@page import="Daos.DaoAula"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Aula</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2>Modificar Aula</h2>

       <form id="form6" action="../Modificar/MostrarModificarAula.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>AULA</td>
      <td><label>
        <select name="id_aula" >
            <%   
        DaoAula  Aula = new DaoAula();
        Aula aula = new Aula();
        ArrayList Listar =new ArrayList();
         
        Listar= Aula.listarAula();
        
         for (int i=0;i<Listar.size();i++)
         {
         aula=(Aula)Listar.get(i);
         long id_aula=aula.getId_aula();
         String nombre_aula=aula.getNombre_aula();
         
          out.print("<option value="+id_aula+">"+nombre_aula+"</option>");
         }
         %>
        </select>
      </label></td>
    </tr>
    </table>
 <center>
<button type="submit">Modificar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
 </center>
</form>
    </body>
</html>








