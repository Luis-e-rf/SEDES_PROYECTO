<%-- 
    Document   : EliminarAula
    Created on : 16/06/2015, 02:22:49 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Aula"%>
<%@page import="Daos.DaoAula"%>
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
         
   <script language="JavaScript">

    function Confirmar() {
       confirmar = confirm("Desea Confirmar la Eliminación");
        if (confirmar){
            document.form1.submit();}
        else{
            alert("Accion Cancelada");
            location.href =("../Eliminar/EliminarAula.jsp");   
        }
    }

</script>
    
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Aula</h1>
    <form id="form1"  name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarAula.jsp">
    <center>
        <table id="sel" border="1">
     <tr>
       <td width="133">Eliminar Aula </td>
      <td width="121"><label>
        <select name="IdAula">
            <%
                DaoAula Aula = new DaoAula();
                
                Aula aula = new Aula();
                ArrayList Listar = new ArrayList();
                
                Listar = Aula.listarAula();
                
                for (int i=0;i<Listar.size();i++)
                {
                   aula =(Aula) Listar.get(i);
                    long id_aula = aula.getId_aula();
                    String nombre_aula=aula.getNombre_aula();
                    out.print("<option value = "+ id_aula+">"+nombre_aula+"</option> ");
                }
            %>
        </select>
          </label>
    </table>
        <input id="enviar" type=button onclick="Confirmar()" value="Enviar">
        
        <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
      
    </center>
</form>
    </body>
</html>