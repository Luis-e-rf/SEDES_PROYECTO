<%-- 
    Document   : MostrarModificarContraseña
    Created on : 29/07/2015, 02:21:45 PM
    Author     : ADSI Sena
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoUsuario"%>
<%@page import="Clases.Usuario"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Cambiar Datos de Usuario</title>
    </head>
    <body>
    <center><img src="../imagenes/recuperarClave.png" alt=""/></center>
        <h2>Cambiar contraseña</h2>
        <form action="../ProcesarModificar/ProcesarModificarUsuario.jsp" method="post">
    <center>
    <table  border="1">
        <tr>
        <td>Nombre del Usuario</td>     
       <td><label>
               <select name="User" required="">
            <%
       Usuario user =new Usuario();
       DaoUsuario  Usuario = new DaoUsuario();
       ArrayList Listar = new ArrayList();
      
      Listar=Usuario.ListarUsuario();
      
        for (int i=0;i<Listar.size();i++)
        {
        user=( Usuario)Listar.get(i);
        String Nombre_Usuario=user.getNombre_Usuario();  
                
         out.print("<option value="+Nombre_Usuario+">"+Nombre_Usuario+"</option>");      
        }        
        
        %>
        </select>
      </label></td>
    </tr>
    </table>
    </center>
            <input type="password" placeholder="Ingrese su Nueva contraseña " name="Password1" required=""/>
            <input type="password" placeholder="Ingrese su Nueva contraseña " name="Password2" required=""/>
            
   
<button type="submit" >Guardar</button>
<a href="../Modificar/MostrarModificarUsuario.jsp?Documento_Persona=0"><button type="button">Cancelar</button></a>
 </form>
        
         
    </body>
</html>

