<%-- 
    Document   : ListarAprendiz
    Created on : 9/10/2015, 02:46:18 PM
    Author     : ADSI Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
               <%!
    String Usuario ="";
    long Documento_Persona;
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../JQUERY/jquery-1.11.3.js"></script>
        <link rel="shortcut icon" href="../imagenes/escudo.png">
        <link href="../css/estiloconsultas.css" rel="stylesheet" type="text/css"/>
        <title>Consultar Personas</title>
        <script>
            
            var Registros;
            
                $(document).on('ready',function (){
                    
                    $.ajax({
                        
                        
                        url:"ContarRegistros.jsp",
                        type:"post",
                        
                        success: function (resp) {
                            
                            Registros=resp;
                        
                    },
                        error: function (jqXHR, Estado, error) {
                        
                        alert("Algo sale mal"+ error);
                        
                    },
                    
                    complete: function (jqXHR, estado) {
                        
                        console.log(estado);
                        
                },
                
                timeout: 10000
                        
                    });
                        
                        function Cargar (Limite)
                        {
                            
                            $.ajax({
                        
                        
                        url:"PaginarAprendiz.jsp?limite="+Limite+"",
                        type:"post",
                        
                        success: function (resp) {
                            
                            $("#Mostrar").html(resp);
                        
                    },
                        error: function (jqXHR, Estado, error) {
                        
                        alert("Algo sale mal"+ error);
                        
                    },
                    
                    complete: function (jqXHR, estado) {
                        
                        console.log(estado);
                        
                     },
                
                 timeout: 10000
                            
                            });  
                            
                        }
        
        
    
                        Cargar(Limite=0);
                        
                        
                        $("#Anterior").click(function (){
                            
                            
                            Limite=Limite-10;
                            
                            if(Limite<0)
                            {
                                
                                Limite=0;
                                
                            }
                            
                            Cargar(Limite);
                            
                        });
                        $("#Siguiente").click(function (){
                            
                            
                            Limite=Limite+10;
                            
                            if(Limite>Registros)
                            {
                                
                                Limite=Limite-10;
                                
                            }
                            
                            Cargar(Limite);
                            
                        });
                    
                    
                    
                });
    
        </script>
        
    </head>
    <body>
        <center><img src="../imagenes/listado.png" alt=""/></center>
        <div id="Mostrar">
            
        </div>
        <center>
        <div>
            <input id="Anterior" type="submit" value="Anterior">
            <input id="Siguiente" type="submit" value="Siguiente">
        </div>
          </center>
         <center>
   <a href="../paginas/menu.jsp"><button type="button">Atras</button></a>
    <a href="javascript:window.print(); void 0;"> <button type="button">Imprimir O Guardar</button></a>
    </center>
         
    </body>
</html>
