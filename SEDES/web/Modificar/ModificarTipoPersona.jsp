<%-- 
    Document   : ModificarTipoPersona
    Created on : 28/07/2015, 01:48:53 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoTipoPersona"%>
<%@page import="Clases.TipoPersona"%>
<%@page import="java.util.ArrayList"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Rol Persona </title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Rol de una Persona</h2>

       <form id="form6" action="../Modificar/MostrarModificarTipoPersona.jsp" method="post">
 <table width="304" border="1">
    
    <tr>
      <td>ROL</td>
      <td><label>
        <select name="idTipoPersona" >
            <%   
        DaoTipoPersona  TipoPersona = new DaoTipoPersona();
        TipoPersona tipopersona = new TipoPersona();
        ArrayList Listar =new ArrayList();
         
        Listar= TipoPersona.ListarTipoPersona();
        
         for (int i=0;i<Listar.size();i++)
         {
         tipopersona=(TipoPersona)Listar.get(i);
         long id_Tipo_Persona = tipopersona.getId_Tipo_Persona();
         String Nombre_Tipo_Persona = tipopersona.getNombre_Tipo_Persona();
         
          out.print("<option value="+id_Tipo_Persona+">"+Nombre_Tipo_Persona+"</option>");
         }
         %>
        </select>
      </label></td>
    </tr>
    </table>
 <center>
<button type="submit" h>Modificar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
 </center>
</form>
    </body>
</html>
