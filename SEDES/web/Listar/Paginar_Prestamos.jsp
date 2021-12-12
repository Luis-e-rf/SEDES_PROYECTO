<%-- 
    Document   : Paginar_Prestamos
    Created on : 2/02/2016, 11:51:36 AM
    Author     : Admin_sena
--%>


 

<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page import="Clases.ListaPrestamos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoListaPrestamos"%>
<!DOCTYPE html>

<table  width="1216" border="1">
            <tr>
                <td  align="center">Prestamos N°</td>
                <td  align="center">Documento N°</td>
                <td  align="center">Nombre</td>
                <td  align="center">Apellido</td>
                <td  align="center">Telefono</td>
                <td  align="center">Fecha Prestamos</td>
                <td  align="center">Hora Prestamos</td>
                <td  align="center">Fecha Entrega</td>
                <td  align="center">Hora Entrega</td>
                <td  align="center">Observaciones</td>
            </tr>
            <%
                int limite = Integer.parseInt(request.getParameter("limite"));

                DaoListaPrestamos ListaPrestamos = new DaoListaPrestamos();
                ListaPrestamos listaprestamos = new ListaPrestamos();
                ArrayList Listar = new ArrayList();
                Listar = ListaPrestamos.ListarListaPrestamos(limite);

                for (int i = 0; i < Listar.size(); i++) {

                    listaprestamos = (ListaPrestamos) Listar.get(i);
                    long Id_Prestamos = listaprestamos.getId_Prestamos();
                    long documento_persona = listaprestamos.getDocumento_Persona();
                    String Nombre_persona = listaprestamos.getNombre_Persona();
                    String Apellido_persona = listaprestamos.getApellido_Persona();
                    long Telefono_persona = listaprestamos.getTelefono_Persona();
                    Date Fecha_Prestamos = listaprestamos.getFecha_Prestamos();
                    Time Hora_Prestamos = listaprestamos.getHora_Prestamos();
                    Date Fecha_Entrega = listaprestamos.getFecha_Entrega();
                    Time Hora_entrega = listaprestamos.getHora_entrega();
                    String Observaciones = listaprestamos.getObservaciones();

                    out.print("<tr>");
                    out.print("<td>" + Id_Prestamos + "</td>");
                    out.print("<td>" + documento_persona + "</td>");
                    out.print("<td>" + Nombre_persona + "</td>");
                    out.print("<td>" + Apellido_persona + "</td>");
                    out.print("<td>" + Telefono_persona + "</td>");
                    out.print("<td>" + Fecha_Prestamos + "</td>");
                    out.print("<td>" + Hora_Prestamos + "</td>");
                    out.print("<td>" + Fecha_Entrega + "</td>");
                    out.print("<td>" + Hora_entrega + "</td>");
                    out.print("<td>" + Observaciones + "</td>");
                    out.print("</tr>");
                }

            %>

        </table>
