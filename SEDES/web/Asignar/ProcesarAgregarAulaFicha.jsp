<%-- 
    Document   : ProcesarAgregarAulaFicha
    Created on : 26/08/2015, 02:34:59 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoAula_ficha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   DaoAula_ficha AulaFicha= new DaoAula_ficha();
   
   long numero_ficha = Long.parseLong(request.getParameter("NumFicha"));
   long id_aula = Long.parseLong(request.getParameter("IdAula"));
   
   if(AulaFicha.almacenarAula_ficha(numero_ficha, id_aula))
     {
%>
<script type="text/javascript">
    alert("Has Asignado una Aula a la Ficha");
    location.href = "../Asignar/VerificarFicha.jsp";
</script>
<%
} else
        {
%>
<script type="text/javascript">
    alert("No se ha Asignado la Aula");
    location.href = "../Asignar/VerificarFicha.jsp";
</script>
<%
    }

%>