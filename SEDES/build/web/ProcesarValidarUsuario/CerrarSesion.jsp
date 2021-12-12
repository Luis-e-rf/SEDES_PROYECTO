<%-- 
    Document   : CerrarSeccion
    Created on : 7/07/2015, 05:12:32 PM
    Author     : ADSI Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    HttpSession SessionActiva = request.getSession();
    
    SessionActiva.invalidate();

%>

<script type="text/javascript">
    
    alert("Gracias Por Su Visita");
    location.href="../paginas/ingresar.jsp";
    
</script>
