<%-- 
    Document   : EliminarTipoDocumento
    Created on : 16/06/2015, 02:16:06 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoDocumento"%>
<%@page import="Daos.DaoTipoDocumento"%>
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
                    location.href = ("../Eliminar/EliminarTipoDocumento.jsp");
                }
            }

        </script>
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Tipo de Documento</h1>
    <form  id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarTipoDocumento.jsp">
        <center>
            <table id="sel"border="1">
                <tr>
                    <td width="133">Tipo de Documento </td>
                    <td width="121"><label>
                            <select name="id_tipo_documento">
                                <%                DaoTipoDocumento TipoDocumento = new DaoTipoDocumento();

                                    TipoDocumento tipodocumento = new TipoDocumento();
                                    ArrayList Listar = new ArrayList();

                                    Listar = TipoDocumento.ListarTipoDocumento();

                                    for (int i = 0; i < Listar.size(); i++) {
                                        tipodocumento = (TipoDocumento) Listar.get(i);
                                        long id_tipo_documento = tipodocumento.getId_tipo_documento();
                                        String nombre_tipo_documento = tipodocumento.getNombre_tipo_documento();
                                        out.print("<option value = " + id_tipo_documento + ">" + nombre_tipo_documento + "</option> ");
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
