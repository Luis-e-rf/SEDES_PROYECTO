<%-- 
    Document   : ProcesarAgragarAula
    Created on : 06-jul-2015, 10:39:17
    Author     : JupiterPC
--%>

<%@page import="Daos.DaoAula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    DaoAula Aula = new DaoAula();
    long id_aula = Long.parseLong(request.getParameter("Aula"));
    long id_tipo_aula = Long.parseLong(request.getParameter("TipoAula"));
    long id_sede = Long.parseLong(request.getParameter("sede"));
    String nombre_aula = request.getParameter("nombre");
    String observaciones_aula = request.getParameter("Observacion");

    if (Aula.AlmacenarAula(id_aula, id_tipo_aula, id_sede, nombre_aula, observaciones_aula)) {
%>
<script type="text/javascript">
    alert("Has ingresado una Nueva Aula");
    location.href = "../Agregar/AgregarAula.jsp";
</script>
<%
} else
        {
%>
<script type="text/javascript">
    alert("No se ha ingresado el Aula");
    location.href = "../Agregar/AgregarAula.jsp";
</script>
<%
    }

%>
