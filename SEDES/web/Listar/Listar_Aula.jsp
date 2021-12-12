<%-- 
    Document   : Listar_Aulas
    Created on : 19/08/2015, 03:38:45 PM
    Author     : ADSI SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Aula"%>
<%@page import="Daos.DaoAula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%!
            String Usuario = "";
            long Documento_Persona;
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../imagenes/escudo.png">
        <link href="../css/estiloconsultas.css" rel="stylesheet" type="text/css"/>
        <title>Consultar Aulas</title>
    </head>
    <body>
    <center><img src="../imagenes/listado.png" alt=""/></center>
    <h2>Aula</h2>
    <table class="devolver" width="916" border="1">
        <tr>
            <td width="344" align="center">Aula N°</td>
            <td width="544" align="center">Nombre Tipo de Aula</td>
            <td width="544" align="center">Nombre Del Aula</td>
            <td width="686" align="center">Observaciones Del Aula</td>
            <td width="344" align="center">Nombre Sede</td>
        </tr>

        <%      DaoAula Aula = new DaoAula();
            Aula aula = new Aula();
            ArrayList Listar = new ArrayList();
            Listar = Aula.listarAula();

            for (int i = 0; i < Listar.size(); i++) {
                aula = (Aula) Listar.get(i);
                long id_aula = aula.getId_aula();
                String nombre_tipo_aula = aula.getNombre_tipo_aula();
                String nombre_aula = aula.getNombre_aula();
                String observaciones_aula = aula.getObservaciones_aula();
                String nombre_sede = aula.getNombre_sede();

                out.print("<tr>");
                out.print("<td>" + id_aula + "</td>");
                out.print("<td>" + nombre_tipo_aula + "</td>");
                out.print("<td>" + nombre_aula + "</td>");
                out.print("<td>" + observaciones_aula + "</td>");
                out.print("<td>" + nombre_sede + "</td>");

                out.print("</tr>");
            }

        %>
    </table>
    <center>
        <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    </center>
</body>
</html>

