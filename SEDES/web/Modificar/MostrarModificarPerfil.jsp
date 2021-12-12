<%-- 
    Document   : editarPerfil
    Created on : 9/06/2015, 03:59:09 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Usuario"%>
<%@page import="Daos.DaoUsuario"%>
<%@page import="Daos.DaoTipoPersona"%>
<%@page import="Clases.TipoPersona"%>
<%@page import="Daos.DaoTipoDocumento"%>
<%@page import="Clases.TipoDocumento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Persona"%>
<%@page import="Daos.DaoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="../imagenes/escudo.png"/>
        <title>Editar Perfil</title>
    </head>
    
<%!
    String Usuario = "";
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

<%!
    long Documento_Persona;
    long id_tipo_documento;
    long Id_Tipo_Persona;
    String Nombre_Persona;
    String Apellido_Persona;
    String Direccion_Persona;
    long Telefono_Persona;
    String Email;
%> 

<%       
   DaoUsuario user = new DaoUsuario();

    Usuario claseuser = new Usuario();

    ArrayList Lista2 = new ArrayList();

    Lista2 = user.ListarUsuarioUnico2(Usuario);

    for (int x = 0; x < Lista2.size(); x++) {

        claseuser = (Usuario) Lista2.get(x);
        Documento_Persona = claseuser.getDocumento_persona();
    }

    DaoPersona Persona = new DaoPersona();

    Persona persona = new Persona();
    ArrayList Listar = new ArrayList();

    Listar = Persona.ListarPersonaUnica(Documento_Persona);

    for (int i = 0; i < Listar.size(); i++) {
        persona = (Persona) Listar.get(i);
        Documento_Persona = persona.getDocumento_Persona();
        id_tipo_documento = persona.getId_Tipo_Persona();
        Id_Tipo_Persona = persona.getId_Tipo_Persona();
        Nombre_Persona = persona.getNombre_Persona();
        Apellido_Persona = persona.getApellido_Persona();
        Direccion_Persona = persona.getDireccion_Persona();
        Telefono_Persona = persona.getTelefono_Persona();
        Email = persona.getEmail();

    }
%>

    <body>
    <center><img src="../imagenes/editar.png" alt=""/> </center> 
    <h1>Editar Perfil</h1>   
    <center><a  class="fotos"  href="../Modificar/ModificarFoto.jsp">Editar Foto del Perfil</a></center>
   
    <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarPerfil.jsp">
        <table width="304" border="1">
    
    <tr>
        <td>Tipo Documento</td>     
       <td><label>
               <select name="TipoDoc" required="">
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
      <tr>
      <td width="168">N° Documento</td>
      <td width="162"><label>
        <input type="number" name="DocumentoPersona" required value="<%=Documento_Persona%>" readonly="" />
      </label></td>
    </tr> 
    <tr>
        <td>Rol</td>     
       <td><label>
      <select name="TipoPersona" required="">
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
    <tr>
      <td>Nombre Persona</td>
      <td><label>
        <input type="text" name="Nombre_Persona" required value="<%=Nombre_Persona%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Apellido Persona</td>
      <td><label>
        <input type="text" name="Apellido_Persona" required value="<%=Apellido_Persona%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Direccion Persona</td>
      <td><label>
        <input type="text" name="DireccionPersona" required value="<%=Direccion_Persona%>"/>
      </label></td>
    </tr>
    <tr>
      <td>Telefono Persona</td>
      <td><label>
        <input type="tel" name="TelefonoPersona" required value="<%=Telefono_Persona%>"/>
      </label></td>
    </tr>
     <tr>
      <td>Correo Electronico</td>
      <td><label>
        <input type="email" name="Email" required value="<%=Email%>"/>
      </label></td>
    </tr>
  </table>
      <center><a  class="contra"  href="../Modificar/MostrarModificarUsuario.jsp?Documento_Persona=<%=Documento_Persona%>">Modificar Contraseña</a></center>
        <button type="submit" >Guardar</button>
        <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
</form>
  
 </body>
</html>