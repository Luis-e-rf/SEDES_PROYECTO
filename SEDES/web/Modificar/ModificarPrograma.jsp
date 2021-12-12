<%-- 
    Document   : ModificarPrograma
    Created on : 16/06/2015, 03:07:16 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Programa"%>
<%@page import="Daos.DaoPrograma"%>
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
        <title>Modificar Programa</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Programa</h2>

       <form id="form6" action="../Modificar/MostrarModificarPrograma.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>PROGRAMA</td>
      <td><label>
        <select name="idprograma" >
            <%   
        DaoPrograma  Programa= new DaoPrograma();
        Programa programa = new Programa();
        ArrayList Listar =new ArrayList();
         
        Listar= Programa.ListarPrograma();
        
         for (int i=0;i<Listar.size();i++)
         {
         programa=(Programa)Listar.get(i);
         long id_programa = programa.getId_programa();
         String nombre_programa = programa.getNombre_programa();
         
          out.print("<option value="+id_programa+">"+nombre_programa+"</option>");
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