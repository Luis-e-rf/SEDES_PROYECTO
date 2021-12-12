<%-- 
    Document   : EliminarFicha
    Created on : 3/06/2015, 04:31:36 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Persona"%>
<%@page import="Daos.DaoPersona"%>
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
                    location.href = ("../Eliminar/EliminarPersona.jsp");
                }
            }

        </script>
    </head>
    <body>
    <center> <img src="../imagenes/Delete.png" alt=""/></center>
    <h1>Eliminar Persona</h1>
    <form id="form1" name="form1" method="post" action="../ProcesarEliminar/ProcesarEliminarPersona.jsp">
        <center>
            <table id="sel" border="1">
                <tr>
                    <td width="133">Eliminar Persona </td>
                    <td width="121"><label>
                            <select name="DocumentoPersona">
                                <%                DaoPersona Persona = new DaoPersona();

                                    Persona persona = new Persona();
                                    ArrayList Listar = new ArrayList();

                                    Listar = Persona.ListarPersona();

                                    for (int i = 0; i < Listar.size(); i++) {
                                        persona = (Persona) Listar.get(i);
                                        long Documento_Persona = persona.getDocumento_Persona();
                                        String Nombre_Persona = persona.getNombre_Persona();
                                        out.print("<option value = " + Documento_Persona + ">" + Nombre_Persona + "</option>");
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
