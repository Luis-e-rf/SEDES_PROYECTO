<%-- 
    Document   : AgregarAula
    Created on : 16/06/2015, 02:37:30 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoSede"%>
<%@page import="Clases.Sede"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoTipoAula"%>
<%@page import="Clases.TipoAula"%>
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
        <title>Aula</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
    </head>
    <body>
    <center> <img src="../imagenes/encabezado.png" alt=""/></center>
    <h2>Agregar Aula</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarAula.jsp" method="post">
        <input type="number" min="1"  placeholder="Aula N°" name="Aula" required=""/>
     <center>
    <table id="sel"  border="1">
    <tr>
        <td>Tipo  de Aula</td>     
       <td><label>
        <select name="TipoAula" required>
            <%
       TipoAula tipoAula =new  TipoAula();
       DaoTipoAula  TipoAula = new DaoTipoAula();
       ArrayList Listar =new ArrayList();
      
      Listar= TipoAula.ListarTipoAula() ;
      
        for (int i=0;i<Listar.size();i++)
        {
        tipoAula=(TipoAula)Listar.get(i);
        long id_tipo_aula= tipoAula.getId_tipo_aula();
        String nombre_tipo_aula= tipoAula.getNombre_tipo_aula();  
                
         out.print("<option value="+id_tipo_aula+">"+nombre_tipo_aula+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>
       </table>
    </center>
         <center>
    <table id="sel"  border="1">
    <tr>
        <td>Sede</td>     
       <td><label>
        <select name="sede" required>
            <%
       Sede sede =new Sede();
       DaoSede  Sede = new DaoSede();
       
      
       Listar=Sede.ListarSede();
      
        for (int i=0;i<Listar.size();i++)
        {
        sede =(Sede)Listar.get(i);
        long id_sede=sede.getId_sede();
        String nombre_sede=sede.getNombre_sede();  
                
         out.print("<option value="+id_sede+">"+nombre_sede+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>
       </table>
    </center>
        <input id="datos" type="text"  placeholder="Nombre Aula" name="nombre" required=""/>
        <input  type="text"  placeholder="Observaciones Aula"  name="Observacion" required=""/>
          
<button type="submit" >Agregar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>
