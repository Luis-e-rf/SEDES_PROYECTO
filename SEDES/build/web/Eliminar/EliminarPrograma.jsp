<%-- 
    Document   : EliminarPrograma
    Created on : 16/06/2015, 02:18:43 PM
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
            String Usuario = "";
        %>
        <%

            HttpSession SessionActiva = request.getSession();

            if (SessionActiva.getAttribute("Usuario") == null) {
        %>
        <script type="text/javascript">

            alert("Por Favor Iniciar Sesión");
            location.href = "../paginas/ingresar.jsp";

        </script>

        <%
            } else {

                Usuario = (String) SessionActiva.getAttribute("Usuario");
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
            location.href =("../Eliminar/EliminarPrograma.jsp");   
        }
    }

</script>
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Programa</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarPrograma.jsp">
        <center>
            <table id="sel" border="1">
                <tr>
                    <td width="133">Eliminar Programa </td>
                    <td width="121">
                        <select name="id_programa">
                            <%                DaoPrograma Programa = new DaoPrograma();

                                Programa programa = new Programa();
                                ArrayList Listar = new ArrayList();

                                Listar = Programa.ListarPrograma();

                                for (int i = 0; i < Listar.size(); i++) {
                                    programa = (Programa) Listar.get(i);
                                    long id_programa = programa.getId_programa();
                                    String nombre_programa = programa.getNombre_programa();
                                    out.print("<option value=" + id_programa + ">" + nombre_programa + "</option> ");
                                }
                            %>
                        </select>
            </table>
            <input id="enviar" type=button onclick="Confirmar()" value="Enviar">
            <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

        </center>
    </form>
</body>
</html>
