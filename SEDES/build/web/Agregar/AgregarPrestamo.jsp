<%-- 
    Document   : AgregarPrestamo
    Created on : 2/02/2016, 07:39:51 AM
    Author     : Admin_Sena
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloconsultas.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>JSP Page</title>
        
        <%
            Calendar fecha = new GregorianCalendar();

            long Año = fecha.get(Calendar.YEAR);
            long Mes = (fecha.get(Calendar.MONTH)) + 1;
            long Dia = fecha.get(Calendar.DAY_OF_MONTH);

            long hora = fecha.get(Calendar.HOUR_OF_DAY);
            long minuto = fecha.get(Calendar.MINUTE);
            long segundo = fecha.get(Calendar.SECOND);

        %>
    </head>
    <body>
    <center> <img src="../imagenes/prestamo.png" alt=""/></center>
    <h1>Realizar Prestamos</h1>

    <form action="../ProcesarAgregar/ProcesarAgregarPrestamos.jsp" method="post">
        <center>
            <table id="sel2"  border="1">
                <tr>
                    <td width="144">Nº Documento</td>     
                    <td ><label>
                            <input type="number" min="1"  placeholder="Ingrese su Identificacion" name="doc" required=""/>
                        </label></td>
                </tr>
            </table>
        </center>
        <center>
            <table id="sel2"  border="1">
                <tr>
                    <td width="144">Elemento</td>     
                    <td><label>
                            <input type="number" min="1" placeholder="Ingrese el codigo del elemeto" onkeyup="eleminventario();" id="Text1" name="elem" required=""/>                            
                        </label></td>
                </tr>
            </table>
            <input name="Fecha_Prestamos" id="fecha1" readonly="" value="<%=(Año + "/" + Mes + "/" + Dia)%>" />
            <input name="Hora_Prestamos" id="fecha2" readonly="" value="<%=(hora + ":" + minuto + ":" + segundo)%>" />
        </center>

        <button  type="submit">Ingresar</button>
        <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>


    </form>
</body>
</html>
