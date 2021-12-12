<%-- 
    Document   : AgragarFicha
    Created on : 16/06/2015, 02:33:34 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoAula"%>
<%@page import="Clases.Aula"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Programa"%>
<%@page import="Daos.DaoPrograma"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AGREGAR FICHA</title>
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="../imagenes/escudo.png">
        <script src="../JQUERY/jquery-1.11.3.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {

                $("#prueba form").on('submit', function (e) {
                    var date1 = $("#inicio").val();
                    var date2 = $("#fin").val();
                    if (date1 === date2) {
                        $("#mensaje1").fadeIn();
                        return false;
                    }
                    else
                    {
                        $("#mensaje1").fadeOut();
                    }
                    if (date1 > date2)
                    {
                        $("#mensaje").fadeIn();
                        return false;
                    }
                    else
                    {
                        $("#mensaje").fadeOut();

                        var url = $('#prueba form').attr('action');
                        var met = $('#prueba form').attr('method');

                        e.preventDefault();

                        $.ajax({
                            beforeSend: function () {

                            },
                            url: url,
                            type: met,
                            data: $("#prueba form").serialize(),
                            success: function (resp)
                            {
                                if (resp === "Correcto") {

                                    alert("Has Ingresado una Nueva Ficha");
                                    console.log(resp);
                                    location.href = ("../Agregar/AgregarFicha.jsp");
                                }
                                else if (resp === "Incorrecto") {

                                    alert("No has Ingresado una Nueva Ficha");
                                    console.log(resp);
                                    location.href = ("../Agregar/AgregarFicha.jsp");
                                }
                                else {
                                    alert("Algo salio mal");
                                    location.href = ("../Agregar/AgregarFicha.jsp");
                                }
                            },
                            error: function (jqXHR, estado, error)
                            {
                                alert("Datos no Almacenados");
                                console.log(estado);
                                console.log(error);
                                console.log(jqXHR);

                            },
                            complete: function (jqXHR, estado)
                            {

                                console.log(estado);


                            },
                            timeout: 10000
                        });


                    }

                });
            });
        </script>
        <%!
            String Usuario = "";
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
    </head>
    <body>

    <center> <img src="../imagenes/mas.png" alt=""/></center>
    <h2>Agregar Ficha</h2>
    <div id="prueba">
        <form  action="../ProcesarAgregar/ProcesarAgregarFicha.jsp" method="post">
            <input type="number" placeholder="Numero Ficha" name="Ficha" required=""/>
            <center>
                <table id="sel" border="1">
                    <tr>
                        <td>Programa</td>
                        <td><label>
                                <select name="Programa" required="">
                                    <%                Programa programa = new Programa();
                                        DaoPrograma Programa = new DaoPrograma();
                                        ArrayList Listar = new ArrayList();

                                        Listar = Programa.ListarPrograma();

                                        for (int i = 0; i < Listar.size(); i++) {
                                            programa = (Programa) Listar.get(i);
                                            long id_programa = programa.getId_programa();
                                            String nombre_programa = programa.getNombre_programa();

                                            out.print("<option value=" + id_programa + ">" + nombre_programa + "</option>");
                                        }
                                    %>
                                </select>
                            </label></td>
                    </tr>
                </table>
            </center>
            <div id="mensaje1" class="mensaje">La Fecha Inicio no puede ser igual a la Fecha final</div>
            <div id="mensaje" class="mensaje">La Fecha final no puede ser menor a la Fecha de Inicio</div>
            <input type="date" placeholder="Fecha Inicio" id="inicio" name="Inicio" required=""/>
            <input type="date" placeholder="Fecha Fin" id="fin" name="Fin" required=""/>
            <button type="submit" >Agregar</button>
            <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

        </form>
    </div>
</body>
</html>
