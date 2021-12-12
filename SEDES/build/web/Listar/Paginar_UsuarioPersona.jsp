<%-- 
    Document   : Listar_UsuarioPersona
    Created on : 26/08/2015, 01:58:19 PM
    Author     : ADSI SENA
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="Clases.UsuarioPersonas"%>
<%@page import="Daos.DaoUsuarioPersonas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <table  width="1216" border="1">
            <tr id="tu">
                <td  align="center">Documento N°</td>
                <td  align="center">Nombre</td>
                <td  align="center">Apellido</td>
                <td  align="center">Direccion</td>
                <td  align="center">Telefono</td>
                <td  align="center">Email</td>
                <td  align="center">Nombre Usuario</td>
                <td  align="center">Tipo Usuario</td>
                


            </tr>
            <%
                int limite = Integer.parseInt(request.getParameter("limite"));

                DaoUsuarioPersonas UsuarioPersonas = new DaoUsuarioPersonas();
                UsuarioPersonas usuariopersonas = new UsuarioPersonas();
                ArrayList Listar = new ArrayList();
                Listar = UsuarioPersonas.ListarUsuarioPersonas(limite);

                for (int i = 0; i < Listar.size(); i++) {

                    usuariopersonas = (UsuarioPersonas) Listar.get(i);
                    long documento_persona = usuariopersonas.getDocumento_persona();
                    String Nombre_persona = usuariopersonas.getNombre_persona();
                    String Apellido_persona = usuariopersonas.getApellido_persona();
                    String Direccion_persona = usuariopersonas.getDireccion_persona();
                    long Telefono_persona = usuariopersonas.getTelefono_persona();
                    String Email = usuariopersonas.getEmail();
                    String Nombre_usuario = usuariopersonas.getNombre_usuario();
                    String Nombre_tipo_usuario = usuariopersonas.getNombre_tipo_usuario();

                    out.print("<tr>");
                    out.print("<td>" + documento_persona + "</td>");
                    out.print("<td>" + Nombre_persona + "</td>");
                    out.print("<td>" + Apellido_persona + "</td>");
                    out.print("<td>" + Direccion_persona + "</td>");
                    out.print("<td>" + Telefono_persona + "</td>");
                    out.print("<td>" + Email + "</td>");
                    out.print("<td>" + Nombre_usuario + "</td>");
                    out.print("<td>" + Nombre_tipo_usuario + "</td>");
                    out.print("</tr>");
                }

            %>

        </table>
