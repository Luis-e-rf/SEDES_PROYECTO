<%-- 
    Document   : CambioContraseña
    Created on : 11/06/2015, 02:21:30 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String Nombre_Usuario;
    String Contraseña_Usuario;
    long documento_Persona;
    long Id_Tipo_usuario;

%> 

<%
    DaoUsuario Usuario = new DaoUsuario();

    Usuario usuario = new Usuario();
    ArrayList Listar = new ArrayList();

    Listar = Usuario.ListarUsuarioUnico(request.getParameter("Documento_Persona"));

    for (int i = 0; i < Listar.size(); i++) {
        usuario = (Usuario) Listar.get(i);
        Nombre_Usuario = usuario.getNombre_Usuario();
        Contraseña_Usuario = usuario.getContraseña_Usuario();
        documento_Persona = usuario.getDocumento_persona();
        Id_Tipo_usuario = usuario.getId_Tipo_usuario();

    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="../imagenes/escudo.png">
        <script src="../JQUERY/jquery-1.11.3.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                
                $("#prueba form").on('submit',function (e) {
                    var name = $("#nombre").val();
                    var clave = $("#pass2").val();
                    var clave2 = $("#pass3").val();
                    if (name ===  clave) {
                        $("#mensaje1").fadeIn();
                        return false;
                    }
                    else
                    {
                        $("#mensaje1").fadeOut();
                    }
                    if (clave !== clave2)
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
                             if (resp==="Correcto"){
                                
                                 alert("Cambio de contraseña Exitosa");
                               console.log(resp);
                               location.href=("../Modificar/MostrarModificarPerfil.jsp");
                             }
                             else if(resp==="Incorrecto"){
                                 
                               alert("La Contraseña no fue modificada");
                               console.log(resp);
                                location.href=("../Modificar/MostrarModificarPerfil.jsp");
                             }
                             else{
                                 alert("algo salio mal");
                                  location.href=("../Modificar/MostrarModificarPerfil.jsp");
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
        <title>Cambiar Datos Usuario</title>
    </head>
    <body>
    <center><img src="../imagenes/recuperarClave.png" alt=""/></center>
    <h2>Cambiar contraseña</h2>
    <div id="prueba">
        <form action="../ProcesarValidarUsuario/ValidarCambioContraseña.jsp" name="formulario1" method="post">
        <input type="text"  name="User" required value="<%=Nombre_Usuario%>" readonly=""/>
        <input type="password" id="nombre"  placeholder="Ingrese su contraseña actual" name="conActual" required=""/>
        <div id="mensaje1" class="mensaje">La contraseña Nueva no puede ser igual a la Actual</div>
        <div id="mensaje" class="mensaje">Las contraseñas no coinciden</div>
        <input type="password" placeholder="Ingrese su Nueva contraseña " id="pass2" name="conNueva" required=""/>
        <input type="password" placeholder="Ingrese su Nueva contraseña " id="pass3" name="conNueva1" required=""/>

        <input id="enviar" type="submit" value="Enviar"/>
        <a href="../Modificar/MostrarModificarPerfil.jsp"><input id="enviar" type="button" value="Cancelar"></a>
    </form>
    </div>

</body>
</html>
