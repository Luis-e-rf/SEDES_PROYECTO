<%-- 
    Document   : menu
    Created on : 05-jun-2015, 9:40:53
    Author     : JupiterPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <%!
            String Usuario = "";
            long Documento_Persona;
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN SEDES</title>
        <link href="../css/estilomenu.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="../imagenes/escudo.png">
    </head>

    <body>
        <header>


            <a href="../ProcesarValidarUsuario/CerrarSesion.jsp"> <img class="sesion" src="../imagenes/cerrarSesion.gif" align="right" alt=""/></a>
            <a class="editar"  href="../Modificar/MostrarModificarPerfil.jsp?Documento_Persona=<%=Documento_Persona%>" >Editar Perfil </a>



            <h1>BIENVENIDO SR(A) ADMINISTRADOR</h1>

            <img id="fotoperfil"src="../imgPerfil/<%=Usuario%>.jpg">

        </header>

        <div id="menu" >
            <img src="../imagenes/minero.png" alt=""/>
            <nav>
                <ul class="nav">

                    <li><a href=""><img src="../imagenes/INVENTARIO.png" width="42" height="42" /><br>INVENTARIO</a>
                        <ul>
                            <li><a href="../Agregar/AgregarElementos.jsp">AGREGAR ELEMENTOS</a></li>
                            <li><a href="../Agregar/AgregarCSVelementos.jsp">AGREGAR VARIOS ELEMENTOS MEDIANTE EXCEL</a></li>
                            <li><a href="../Agregar/AgregarMarca.jsp">AGREGAR MARCA DE UN ELEMENTOS</a></li>
                            <li><a href="../Eliminar/EliminarElementos.jsp">ELIMINAR ELEMENTOS</a></li>
                            <li><a href="../Modificar/ModificarElementos.jsp">MODIFICAR ELEMENTOS</a></li>
                            <li><a href="../Agregar/AgregarPrestamo.jsp">PRESTAMOS</a></li>
                            <li><a href="../paginas/MostrarEntrega.jsp">DEVOLVER PRESTAMO</a></li>

                        </ul>
                    </li>   
                    <li><a href=""><img src="../imagenes/Agregar.png" width="42" height="42"/><br>AGREGAR</a>
                        <ul>
                            <li><a href="../Agregar/AgregarAula.jsp">AULA</a></li> 
                            <li><a href="../Agregar/AgregarFicha.jsp">FICHA</a></li>
                            <li><a href="../Agregar/AgregarPersona.jsp">PERSONA</a></li>
                            <li><a href="../Agregar/AgregarCSVpersonas.jsp">AGREGAR VARIAS PERSONAS MEDIANTE EXCEL</a></li>
                            <li><a href="../Agregar/AgregarPrestamos.jsp">PRESTAMO</a></li>
                            <li><a href="../Agregar/AgregarProfesion.jsp">PROFESION</a></li>
                            <li><a href="../Agregar/AgregarPrograma.jsp">PROGRAMA</a></li>
                            <li><a href="../Agregar/AgregarTipoPersona.jsp">ROL DE UNA PERSONA</a></li>
                            <li><a href="../Agregar/AgregarSede.jsp">SEDE</a></li>
                            <li><a href="../Agregar/AgregarTipoAula.jsp">TIPO AULA</a></li>
                            <li><a href="../Agregar/AgregarTipoDocumento.jsp">TIPO DOCUMENTO</a></li>
                            <li><a href="../Agregar/AgregarTipoUsuario.jsp">TIPO USUARIO</a></li> 
                        </ul>
                    </li>
                    <li><a href=""><img src="../imagenes/asignar.png" width="42" height="42"/><br>ASIGNAR</a>
                        <ul>
                            <li><a href="../Asignar/VerificarFicha.jsp">ASIGNAR AULA A UNA FICHA</a></li>

                        </ul>
                    </li>

                    <li><a href=""><img src="../imagenes/eliminar.png" width="42" height="42"/><br>ELIMINAR</a>
                        <ul>
                            <li><a href="../Eliminar/EliminarAula.jsp">AULA</a></li>
                            <li><a href="../Eliminar/EliminarFicha.jsp">FICHA</a></li>
                            <li><a href="../Eliminar/EliminarPersona.jsp">PERSONA</a></li>
                            <li><a href="../Eliminar/EliminarProfesion.jsp">PROFESION</a></li>
                            <li><a href="../Eliminar/EliminarPrograma.jsp">PROGRAMA</a></li>
                            <li><a href="../Eliminar/EliminarTipoPersona.jsp">ROL DE UNA PERSONA</a></li>
                            <li><a href="../Eliminar/EliminarSede.jsp">SEDE</a></li>
                            <li><a href="../Eliminar/EliminarTipoAula.jsp">TIPO AULA</a></li>
                            <li><a href="../Eliminar/EliminarTipoDocumento.jsp">TIPO DOCUMENTO</a></li>
                            <li><a href="../Eliminar/EliminarTipoUsuario.jsp">TIPO USUARIO</a></li> 
                        </ul>
                    </li> 

                    <li><a href=""><img src="../imagenes/icofx.png" width="42" height="42"/><br>MODIFICAR</a>
                        <ul>
                            <li><a href="../Modificar/ModificarAula.jsp">AULA</a></li>  
                            <li><a href="../Modificar/ModificarFicha.jsp">FICHA</a></li>
                            <li><a href="../Modificar/ModificarPersona.jsp">PERSONA</a></li>
                            <li><a href="../Modificar/ModificarProfesion.jsp">PROFESION</a></li>
                            <li><a href="../Modificar/ModificarPrograma.jsp">PROGRAMA</a></li>
                            <li><a href="../Modificar/ModificarTipoPersona.jsp">ROL DE UNA PERSONA</a></li>
                            <li><a href="../Modificar/ModificarSedes.jsp">SEDE</a></li>
                            <li><a href="../Modificar/ModificarTipoAula.jsp">TIPO AULA</a></li>
                            <li><a href="../Modificar/ModificarTipoDocumento.jsp">TIPO DOCUMENTO</a></li>
                            <li><a href="../Modificar/ModificarTipoUsuario.jsp">TIPO USUARIO</a></li>

                        </ul>
                    </li>
                    <li><a href=""><img src="../imagenes/listar.png" width="62" height="42"/><br>CONSULTAR</a>
                        <ul>
                            <li><a href="../Listar/ListarAprendiz.jsp">VER APRENDICES</a></li> 
                            <li><a href="../Listar/ListarInstructor.jsp">VER INSTRUCTORES</a></li>
                            <li><a href="../Listar/Listar_UsuarioPersona.jsp">VER USUARIOS</a></li> 
                            <li><a href="../Listar/Listar_Aula.jsp">VER AULAS</a></li>
                            <li><a href="../Listar/Listar_Ficha.jsp">VER FICHA</a></li>
                            <li><a href="../Listar/Listar_Programa.jsp">VER PROGRAMAS</a></li>  
                            <li><a href="../Listar/Listar_Sede.jsp">SEDE</a></li> 
                        </ul>
                    </li>

                </ul>
            </nav>           


        </div>  
        <div id="footer">
            <center>
                <p class="foot-p"><img  width="20" height="20"src="../imagenes/escudo.png" alt=""/>AdminSedes 2016 © Derechos Reservados Sena Centro Minero</p> 
            </center>

        </div>

    </body>

</html>
