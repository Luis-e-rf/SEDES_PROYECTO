<%-- 
    Document   : EliminarTipoUsuario
    Created on : 29/07/2015, 04:40:40 PM
    Author     : ADSI  Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoUsuario"%>
<%@page import="Daos.DaoTipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                    location.href = ("../Eliminar/EliminarTipoUsuario.jsp");
                }
            }

        </script>
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Tipo Usuario</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarTipoUsuario.jsp">
        <center>
            <table id="sel" border="1">
                <tr>
                    <td width="133">Eliminar Tipo Usuario </td>
                    <td width="121"><label>
                            <select name="Id_Tipo_usuario">
                                <%                DaoTipoUsuario TipoUsuario = new DaoTipoUsuario();

                                    TipoUsuario tipousuario = new TipoUsuario();
                                    ArrayList Listar = new ArrayList();

                                    Listar = TipoUsuario.ListarTipoUsuario();

                                    for (int i = 0; i < Listar.size(); i++) {
                                        tipousuario = (TipoUsuario) Listar.get(i);
                                        long Id_Tipo_usuario = tipousuario.getId_Tipo_usuario();
                                        String Nombre_Tipo_usuario = tipousuario.getNombre_Tipo_usuario();
                                        out.print("<option value = " + Id_Tipo_usuario + ">" + Nombre_Tipo_usuario + "</option> ");
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
