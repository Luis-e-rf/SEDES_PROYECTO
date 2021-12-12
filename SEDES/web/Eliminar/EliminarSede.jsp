<%-- 
    Document   : EliminarSede
    Created on : 16/06/2015, 02:16:59 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Sede"%>
<%@page import="Daos.DaoSede"%>
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
                if (confirmar) {
                    document.form1.submit();
                }
                else {
                    alert("Accion Cancelada");
                    location.href = ("../Eliminar/EliminarSede.jsp");
                }
            }

        </script>
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Sede</h1>
    <form id="form1" name="form1" method="post"  action="../ProcesarEliminar/ProcesarEliminarSede.jsp">
        <center>
            <table id="sel" border="1">
                <tr>
                    <td width="133">Eliminar Sede </td>
                    <td width="121"><label>
                            <select name="IdSede">
                                <%                DaoSede Sede = new DaoSede();

                                    Sede sede = new Sede();
                                    ArrayList Listar = new ArrayList();

                                    Listar = Sede.ListarSede();

                                    for (int i = 0; i < Listar.size(); i++) {
                                        sede = (Sede) Listar.get(i);
                                        long id_sede = sede.getId_sede();
                                        String nombre_sede = sede.getNombre_sede();
                                        out.print("<option value = " + id_sede + ">" + nombre_sede + "</option> ");
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