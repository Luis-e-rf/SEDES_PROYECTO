<%-- 
    Document   : Eliminar_Aula_Ficha
    Created on : 27/07/2015, 01:44:47 PM
    Author     : ADSI  Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Aula_ficha"%>
<%@page import="Daos.DaoAula_ficha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
    <h1>Eliminar Aula Ficha</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarAulaFicha.jsp">
    <center>
        <table id="sel" border="1">
     <tr>
       <td width="133">Eliminar Aula Ficha </td>
      <td width="121"><label>
        <select name="id_aula_ficha">
            <%
                DaoAula_ficha Aula_ficha = new DaoAula_ficha();
                
                Aula_ficha aula_ficha = new Aula_ficha();
                ArrayList Listar = new ArrayList();
                
                Listar = Aula_ficha.listarAula_ficha();
                
                for (int i=0;i<Listar.size();i++)
                {
                   aula_ficha =(Aula_ficha) Listar.get(i);
                    long Id_aula_ficha = aula_ficha.getId_aula_ficha();
                    long numero_ficha=aula_ficha.getNumero_ficha();
                    out.print("<option value = "+ Id_aula_ficha+">"+numero_ficha+"</option> ");
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