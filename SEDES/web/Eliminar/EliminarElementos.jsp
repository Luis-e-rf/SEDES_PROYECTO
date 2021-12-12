<%-- 
    Document   : EliminarElementos
    Created on : 15/07/2015, 05:05:37 PM
    Author     : ADSI  Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Elementos"%>
<%@page import="Daos.DaoElementos"%>
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
    <h1>Eliminar Elementos</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarElementos.jsp">
    <center>
        <table id="sel" border="1">
     <tr>
       <td width="133">Eliminar Elementos </td>
      <td width="121"><label>
        <select name="Id_Elemento">
            <%
                DaoElementos Elementos = new DaoElementos();
                
                Elementos elementos = new Elementos();
                ArrayList Listar = new ArrayList();
                
                Listar = Elementos.listarElementos();
                
                for (int i=0;i<Listar.size();i++)
                {
                   elementos =(Elementos) Listar.get(i);
                    long Id_Elemento = elementos.getId_Elemento();
                    String Nombre_Elemento=elementos.getNombre_Elemento();
                    out.print("<option value = "+ Id_Elemento+">"+Nombre_Elemento+"</option> ");
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
