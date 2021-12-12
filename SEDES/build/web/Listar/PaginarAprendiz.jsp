<%-- 
    Document   : PaginarPersonas
    Created on : 8/10/2015, 02:22:31 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Aprendiz"%>
<%@page import="Daos.DaoAprendiz"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>

    function Confirmar(Documento,limite) {
        confirmar = confirm("Desea Confirmar la Eliminación");
        var Docu = Documento;
        var lim = limite;
        if (confirmar){
            location.href = ("../ProcesarEliminar/ProcesarEliminarPersona2.jsp?DocumentoPersona="+Docu+"");}
        else{
            alert("Accion Cancelada");
            location.href = ("../Listar/ListarAprendiz.jsp?limite="+lim+"");
        }
    }

</script>

<h2>APRENDICES</h2> 
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
        <td  align="center">Eliminar</td>

    </tr>


    <%
        int limite = Integer.parseInt(request.getParameter("limite"));

        DaoAprendiz Aprendiz = new DaoAprendiz();
        Aprendiz aprendiz = new Aprendiz();
        ArrayList Listar = new ArrayList();
        Listar = Aprendiz.ListarAprendiz(limite);

        for (int i = 0; i < Listar.size(); i++) {

            aprendiz = (Aprendiz) Listar.get(i);
            String nombre_tipo_documento = aprendiz.getNombre_tipo_documento();
            long Documento_Persona = aprendiz.getDocumento_persona();
            String Nombre_persona = aprendiz.getNombre_persona();
            String Apellido_persona = aprendiz.getApellido_persona();
            String Direccion_persona = aprendiz.getDireccion_persona();
            long Telefono_persona = aprendiz.getTelefono_persona();
            String Email = aprendiz.getEmail();
            long numero_ficha = aprendiz.getNumero_ficha();
            String nombre_programa = aprendiz.getNombre_programa();
            long id_aula = aprendiz.getId_aula();

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
            out.print("<td> <a href=../Modificar/MostrarModificarPersona1.jsp?DocumentoPersona=" + Documento_Persona + "> Modificar </a></td>");
            out.print("<td> <a onclick='return Confirmar("+Documento_Persona+","+limite+");'> Eliminar </a></td>");
            out.print("</tr>");
        }

    %>

</table>
