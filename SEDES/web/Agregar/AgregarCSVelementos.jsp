<%-- 
    Document   : AgregarCSVelementos
    Created on : 25/08/2015, 04:50:27 PM
    Author     : ADSI Sena
--%>

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
        <title>Importador de elementos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
    </head>
    <body>
        <center> <img src="../imagenes/mas.png" alt=""/></center>
    <h2>Agregar archivo CSV de elementos</h2>
        
    <form enctype="multipart/form-data" method="POST" action="../ProcesarAgregar/ProcesarAgregarCSVelementos.jsp" >            
        <input type="file" name="file" required=""/>
           <button type="submit" >Enviar</button>
            <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
    </form>
    </body>
</html>
