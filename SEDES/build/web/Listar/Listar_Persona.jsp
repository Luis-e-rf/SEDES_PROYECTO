<%-- 
    /* global main */

Document   : Listar_Persona
    Created on : 19/08/2015, 04:32:58 PM
    Author     : ADSI SENA
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

        <script type="text/javascript">
            function savePageAsPDF() {
                var pURL = "http://savepageaspdf.pdfonline.com/pdfonline/pdfonline.asp?cURL=" + escape(document.location.href);
                window.open(pURL, "PDFOnline", "scrollbars=yes, resizable=yes,width=640, height=480,menubar,toolbar,location");
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../imagenes/escudo.png">
        <script src="../JQUERY/jquery-1.11.3.js" type="text/javascript"></script>
        <link href="../css/estiloconsultas.css" rel="stylesheet" type="text/css"/>
        <title>Consultar Personas</title>

    </head>

    <body>
    <center><img src="../imagenes/listado.png" alt=""/></center>
    <h2>Personas</h2> 
    <table id="Mostrar" width="916" border="1">
        <tr id="tu">
            <td  width="110" align="center">Documento N°</td>
            <td  width="150" align="center">Tipo Documento N°</td>
            <td  width="50" align="center">Rol</td>
            <td  width="120" align="center">Nombre </td>
            <td  width="120" align="center">Apellido</td>
            <td  align="center">Direccion</td>
            <td  align="center">Telefono</td>
            <td  align="center">Email</td>
            <td  align="center">Modificar</td>
            <td  align="center">Eliminar</td>

        </tr>

        <%      DaoPersona Persona = new DaoPersona();
            Persona persona = new Persona();
            ArrayList Listar = new ArrayList();
            Listar = Persona.ListarPersona();

            for (int i = 0; i < Listar.size(); i++) {
                persona = (Persona) Listar.get(i);
                long Documento_Persona = persona.getDocumento_Persona();
                long id_tipo_documento = persona.getId_tipo_documento();
                long Id_Tipo_Persona = persona.getId_Tipo_Persona();
                String Nombre_Persona = persona.getNombre_Persona();
                String Apellido_Persona = persona.getApellido_Persona();
                String Direccion_Persona = persona.getDireccion_Persona();
                long Telefono_Persona = persona.getTelefono_Persona();
                String Email = persona.getEmail();

                out.print("<tr>");
                out.print("<td>" + Documento_Persona + "</td>");
                out.print("<td>" + id_tipo_documento + "</td>");
                out.print("<td>" + Id_Tipo_Persona + "</td>");
                out.print("<td>" + Nombre_Persona + "</td>");
                out.print("<td>" + Apellido_Persona + "</td>");
                out.print("<td>" + Direccion_Persona + "</td>");
                out.print("<td>" + Telefono_Persona + "</td>");
                out.print("<td>" + Email + "</td>");
                
                out.print("<td> <a href=../ProcesarEliminar/ProcesarEliminarPersona2.jsp?DocumentoPersona=" + Documento_Persona + "> Eliminar </a></td>");

                out.print("<td> <a href=../Modificar/MostrarModificarPersona2.jsp?DocumentoPersona=" + Documento_Persona + "> Modificar </a></td>");
                out.print("</tr>");
            }

        %>
    </table>


    <center>
        <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
        <a href="javascript:window.print(); void 0;"> <button type="button">Imprimir O Guardar</button></a>

    </center>

</body>
</html>
