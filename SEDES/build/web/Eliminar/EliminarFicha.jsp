<%-- 
    Document   : EliminarFicha
    Created on : 16/06/2015, 02:07:42 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Ficha"%>
<%@page import="Daos.DaoFicha"%>
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
            location.href =("../Eliminar/EliminarFicha.jsp");   
        }
    }

</script>
    </head>
    <body>
   <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Ficha</h1>
    <form  id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarFicha.jsp">
    <center>
  <table id="sel" border="1">
    <tr>
       <td width="133">Eliminar Ficha </td>
      <td width="121"><label>
        <select name="numero_ficha">
            <%
                DaoFicha Ficha = new DaoFicha();
                
                Ficha ficha = new Ficha();
                ArrayList Listar = new ArrayList();
                
                Listar = Ficha.listarFicha();
                
                for (int i=0;i<Listar.size();i++)
                {
                   ficha =(Ficha) Listar.get(i);
                    long numero_ficha = ficha.getNumero_ficha();
                    out.print("<option value = "+numero_ficha+">"+numero_ficha+"</option> ");
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