<%-- 
    Document   : registro
    Created on : 3/06/2015, 04:31:36 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoProfesion"%>
<%@page import="Clases.Profesion"%>
<%@page import="Daos.DaoTipoUsuario"%>
<%@page import="Clases.TipoUsuario"%>
<%@page import="Daos.DaoTipoPersona"%>
<%@page import="Clases.TipoPersona"%>
<%@page import="Daos.DaoTipoDocumento"%>
<%@page import="Clases.TipoDocumento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
         <title>REGISTRO</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
    </head>
    <body>
    <center> <img src="../imagenes/encabezado.png" alt=""/></center>
    <h2>Registro de Usuarios Nuevos</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarRegistro.jsp" method="post">
        <input id="datos" type="text"  placeholder="Nombres" name="Nombres" required=""/>
        <input id="datos" type="text" placeholder="Apellidos" name="Apellidos" required=""/>
<center>
    <table id="sel"  border="1">
    <tr>
        <td>Tipo Documento</td>     
       <td><label>
        <select name="TipoDoc" required>
            <%
       TipoDocumento tipodocumento =new TipoDocumento();
       DaoTipoDocumento  TipoDocumento = new DaoTipoDocumento();
       ArrayList Listar =new ArrayList();
      
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
        <input type="number" placeholder="Numero de Documento " min="1" name="NumeroDoc" required=""/>
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
        
        <input id="datos" type="text" placeholder="Direccion" name="Direccion" required=""/>
        <input type="number" placeholder="Telefono" min="1" name="Telefono" required=""/>
        <input type="email" placeholder="E-mail" min="1" name="Email" required=""/>
    <center>
<table id="sel" border="1">
    <tr>
        <td>Rol</td>     
       <td><label>
        <select name="TipoPersona" required>
            <%
       TipoPersona tipoPersona =new  TipoPersona();
       DaoTipoPersona   TipoPersona = new DaoTipoPersona();
      
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
        <input type="text" maxlength="20" placeholder="Nombre Usuario" name="User" required />
<center>
<table id="sel" border="1">
    <tr>
        <td>Tipo Usuario</td>     
       <td><label>
        <select name="TipoUser" required>
            <%
       TipoUsuario tipoUsuario =new  TipoUsuario();
       DaoTipoUsuario  TipoUsuario= new DaoTipoUsuario();
      
      Listar= TipoUsuario.ListarTipoUsuario();
      
        for (int i=0;i<Listar.size();i++)
        {
        tipoUsuario=(TipoUsuario)Listar.get(i);
        long id_Tipo_usuario= tipoUsuario.getId_Tipo_usuario();
        String Nombre_Tipo_usuario= tipoUsuario.getNombre_Tipo_usuario();  
                
         out.print("<option value="+id_Tipo_usuario+">"+Nombre_Tipo_usuario+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>
       </table>
    </center>
        <input type="password" maxlength="20" placeholder="Contraseña" name="password" required/>

<button type="submit" h>Registrarse</button>
<a href="index.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>

