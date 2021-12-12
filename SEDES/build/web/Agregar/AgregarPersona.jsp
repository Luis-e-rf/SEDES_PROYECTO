<%-- 
    Document   : AgregrarPersona
    Created on : 8/07/2015, 06:27:20 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoFicha"%>
<%@page import="Clases.Ficha"%>
<%@page import="Daos.DaoProfesion"%>
<%@page import="Clases.Profesion"%>
<%@page import="Daos.DaoTipoPersona"%>
<%@page import="Clases.TipoPersona"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoTipoDocumento"%>
<%@page import="Clases.TipoDocumento"%>
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
         <title>PERSONAS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
    </head>
    <body>
    <center> <img src="../imagenes/encabezado.png" alt=""/></center>
    <h2>Agregar Persona</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarPersona.jsp" method="post">
        <input id="datos" type="text"  placeholder="Nombres" name="Nombres" required=""/>
        <input id="datos" type="text"  placeholder="Apellidos" name="Apellidos" required=""/>
     <center>
    <table id="sel"  border="1">
    <tr>
        <td>Rol</td>     
       <td><label>
        <select name="TipoPersona" required>
            <%
       TipoPersona tipoPersona =new  TipoPersona();
       DaoTipoPersona   TipoPersona = new DaoTipoPersona();
      ArrayList Listar =new ArrayList();
      
      Listar= TipoPersona.ListarTipoPersona();
      
        for (int i=0;i<Listar.size();i++)
        {
        tipoPersona=(TipoPersona)Listar.get(i);
        long id_Tipo_Persona= tipoPersona.getId_Tipo_Persona();
        String Nombre_Tipo_Persona= tipoPersona.getNombre_Tipo_Persona();  
                
         out.print("<option value="+id_Tipo_Persona+">"+Nombre_Tipo_Persona+"</option>");      
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
        <td>Profesion</td>     
       <td><label>
        <select name="Profesion" required>
            <%
       Profesion profesion =new Profesion();
       DaoProfesion  Profesion = new DaoProfesion();
       
      
       Listar=Profesion.ListarProfesion();
      
        for (int i=0;i<Listar.size();i++)
        {
        profesion =(Profesion)Listar.get(i);
        long id_profesion =profesion.getId_profesion();
        String nombre_profesion=profesion.getNombre_profesion();  
                
         out.print("<option value="+id_profesion+">"+nombre_profesion+"</option>");      
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
        <td>Ficha</td>     
       <td><label>
        <select name="Ficha" required>
            <%
       Ficha ficha =new Ficha();
       DaoFicha  Ficha = new DaoFicha();
       
      
       Listar=Ficha.listarFicha();
      
        for (int i=0;i<Listar.size();i++)
        {
        ficha =(Ficha)Listar.get(i);
        long numero_ficha =ficha.getNumero_ficha();  
                
         out.print("<option value="+numero_ficha+">"+numero_ficha+"</option>");      
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
        <td>Tipo Documento</td>     
       <td><label>
        <select name="TipoDoc" required>
            <%
       TipoDocumento tipodocumento =new TipoDocumento();
       DaoTipoDocumento  TipoDocumento = new DaoTipoDocumento();
       
      
      Listar=TipoDocumento.ListarTipoDocumento();
      
        for (int i=0;i<Listar.size();i++)
        {
        tipodocumento=(TipoDocumento)Listar.get(i);
        long id_tipo_documento= tipodocumento.getId_tipo_documento();
        String nombre_tipo_documento=tipodocumento.getNombre_tipo_documento();  
                
         out.print("<option value="+id_tipo_documento+">"+nombre_tipo_documento+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>
       </table>
    </center>
        <input type="number"  placeholder="Numero de Documento " min="1" name="NumeroDoc" required=""/>
        <input id="datos" type="text"  placeholder="Direccion" name="Direccion" required=""/>
        <input type="number"  placeholder="Telefono" min="1" name="Telefono" required=""/>
        <input type="email" placeholder="E-mail"  name="Email" required=""/>
   
        
<button type="submit" >Agregar</button>
<a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>
