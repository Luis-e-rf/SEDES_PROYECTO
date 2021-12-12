<%-- 
    Document   : ModificarTipoAula
    Created on : 27/07/2015, 01:52:18 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoAula"%>
<%@page import="Daos.DaoTipoAula"%>
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
        <title>Modificar TipoAula
        </title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Elementos
       </h2>

    <form id="form6" action="../Modificar/MostrarModificarTipoAula.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>TIPOAULA</td>
      <td><label>
        <select name="IdTipoAula" >
            <%   
        DaoTipoAula  TipoAula = new DaoTipoAula();
       TipoAula tipoaula = new TipoAula();
        ArrayList Listar =new ArrayList();
         
        Listar= TipoAula.ListarTipoAula();
        
         for (int i=0;i<Listar.size();i++)
         {
         tipoaula=(TipoAula)Listar.get(i);
         long id_tipo_aula = tipoaula.getId_tipo_aula();
         String nombre_tipo_aula = tipoaula.getNombre_tipo_aula();
         
          out.print("<option value="+id_tipo_aula+">"+nombre_tipo_aula+"</option>");
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
