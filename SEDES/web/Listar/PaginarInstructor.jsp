<%-- 
    Document   : PaginarInstructor
    Created on : 3/02/2016, 02:31:56 PM
    Author     : Admin_Sena
--%>

<%@page import="Clases.Instructor"%>
<%@page import="Daos.DaoInstructor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>

    function Confirmar(Documento,limite) {
        confirmar = confirm("Desea Confirmar la Eliminación");
        var Docu = Documento;
        var lim = limite;
        if (confirmar){
            location.href = ("../ProcesarEliminar/ProcesarEliminarPersona3.jsp?DocumentoPersona="+Docu+"");}
        else{
            alert("Accion Cancelada");
            location.href = ("../Listar/ListarInstructor.jsp?limite="+lim+"");
        }
    }

</script>
<h2>INSTRUCTORES</h2> 
<table  width="1216" border="1">
    <tr id="tu">
        <td  align="center">Tipo Documento</td>
        <td  align="center">Documento N°</td>
        <td  align="center">Nombre</td>
        <td  align="center">Apellido</td>
        <td  align="center">Direccion</td>
        <td  align="center">Telefono</td>
        <td  align="center">Email</td>
        <td  align="center">Numero Ficha</td>
        <td  align="center">Nombre Programa</td>
        <td  align="center">Aula</td>
        <td  align="center">Modificar</td>
        <td  align="center">Eliminar</td




    </tr>
    <%
        int limite = Integer.parseInt(request.getParameter("limite"));

        DaoInstructor Instruc = new DaoInstructor();
        Instructor instruc = new Instructor();
        ArrayList Listar = new ArrayList();
        Listar = Instruc.ListarInstructor(limite);

        for (int i = 0; i < Listar.size(); i++) {

            instruc = (Instructor) Listar.get(i);
            String nombre_tipo_documento = instruc.getNombre_tipo_documento();
            long Documento_Persona = instruc.getDocumento_persona();
            String Nombre_persona = instruc.getNombre_persona();
            String Apellido_persona = instruc.getApellido_persona();
            String Direccion_persona = instruc.getDireccion_persona();
            long Telefono_persona = instruc.getTelefono_persona();
            String Email = instruc.getEmail();
            long numero_ficha = instruc.getNumero_ficha();
            String nombre_programa = instruc.getNombre_programa();
            long id_aula = instruc.getId_aula();

            out.print("<tr>");
            out.print("<td>" + nombre_tipo_documento + "</td>");
            out.print("<td>" + Documento_Persona + "</td>");
            out.print("<td>" + Nombre_persona + "</td>");
            out.print("<td>" + Apellido_persona + "</td>");
            out.print("<td>" + Direccion_persona + "</td>");
            out.print("<td>" + Telefono_persona + "</td>");
            out.print("<td>" + Email + "</td>");
            out.print("<td>" + numero_ficha + "</td>");
            out.print("<td>" + nombre_programa + "</td>");
            out.print("<td>" + id_aula + "</td>");
            out.print("<td> <a href=../Modificar/MostrarModificarPersona2.jsp?DocumentoPersona=" + Documento_Persona + "> Modificar </a></td>");
            out.print("<td> <a onclick='return Confirmar("+Documento_Persona+","+limite+");'> Eliminar </a></td>");
            out.print("</tr>");
        }

    %>

</table>
