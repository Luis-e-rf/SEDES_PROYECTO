
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoAula"%>
<%@page import="Daos.DaoTipoAula"%>
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
            location.href =("../Eliminar/EliminarTipoAula.jsp");   
        }
    }

</script>
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Tipo Aula</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarTipoAula.jsp">
    <center>
        <table id="sel" border="1">
     <tr>
       <td width="133">Eliminar Tipo Aula </td>
      <td width="121"><label>
        <select name="id_tipo_aula">
            <%
                DaoTipoAula TipoAula = new DaoTipoAula();
                
                TipoAula tipoaula = new TipoAula();
                ArrayList Listar = new ArrayList();
                
                Listar = TipoAula.ListarTipoAula();
                
                for (int i=0;i<Listar.size();i++)
                {
                   tipoaula =(TipoAula) Listar.get(i);
                    long id_tipo_aula = tipoaula.getId_tipo_aula();
                    String Nombre_tipo_aula=tipoaula.getNombre_tipo_aula();
                    out.print("<option value = "+ id_tipo_aula+">"+Nombre_tipo_aula+"</option> ");
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