<%-- 
    Document   : ModificarFoto
    Created on : 14/08/2015, 02:02:37 PM
    Author     : ADSI Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%!
    String Usuario ="";
%>
<%
    
    HttpSession SessionActiva = request.getSession();
    
    if(SessionActiva.getAttribute("Usuario")==null)
    {
%>
    <script type="text/javascript">
    
    alert("Por Favor Iniciar Sesión");
    location.href="../paginas/ingresar.jsp";
    
    </script>

<%    
    }
    
    else 
    {
    
    Usuario =(String)SessionActiva.getAttribute("Usuario");
    }

%>
         <script>
        window.addEventListener('load', inicio, false);

        function inicio() {
            document.getElementById('archivo').addEventListener('change', cargar, false);               
        }

        function cargar(ev) {
            var arch=new FileReader();
            arch.addEventListener('load',leer,false);
            arch.readAsDataURL(ev.target.files[0]);
        }

        function leer(ev) {
            document.getElementById('foto').style.backgroundImage="url('" + ev.target.result + "')";
        }
    </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <form  action="../ProcesarModificar/ProcesarModificarFoto.jsp" enctype="multipart/form-data" method="post">
             <div id="foto"></div>
         <input type="file" title="Elige un archivo para subir" autofocus="1" id="archivo" name="fichero" />
         <button type="submit" >Guardar</button>
         <a href="../Modificar/MostrarModificarPerfil.jsp"><button type="button">Cancelar</button></a>
        </form>
        
    </body>
</html>
