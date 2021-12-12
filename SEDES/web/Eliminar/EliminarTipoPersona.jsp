<%-- 
    Document   : EliminarTipoPersona
    Created on : 29/07/2015, 02:41:04 PM
    Author     : ADSI  Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoPersona"%>
<%@page import="Daos.DaoTipoPersona"%>
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
                    location.href = ("../Eliminar/EliminarTipoPersona.jsp");
                }
            }

        </script>
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Tipo Persona</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarTipoPersona.jsp">
        <center>
            <table id="sel" border="1">
                <tr>
                    <td width="133">Eliminar Tipo Persona </td>
                    <td width="121"><label>
                            <select name="id_Tipo_Persona">
                                <%                DaoTipoPersona TipoPersona = new DaoTipoPersona();

                                    TipoPersona tipopersona = new TipoPersona();
                                    ArrayList Listar = new ArrayList();

                                    Listar = TipoPersona.ListarTipoPersona();

                                    for (int i = 0; i < Listar.size(); i++) {
                                        tipopersona = (TipoPersona) Listar.get(i);
                                        long id_Tipo_Persona = tipopersona.getId_Tipo_Persona();
                                        String nombre_tipo_persona=tipopersona.getNombre_Tipo_Persona();

                                        out.print("<option value = " + id_Tipo_Persona + ">"+nombre_tipo_persona+"</option> ");
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
