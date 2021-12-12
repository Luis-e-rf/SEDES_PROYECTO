<%-- 
    Document   : Mostrar_Modificar_Persona
    Created on : 3/07/2015, 06:26:48 PM
    Author     : Diego
--%>

<%@page import="Daos.DaoFicha"%>
<%@page import="Clases.Ficha"%>
<%@page import="Daos.DaoProfesion"%>
<%@page import="Clases.Profesion"%>
<%@page import="Daos.DaoTipoPersona"%>
<%@page import="Clases.TipoPersona"%>
<%@page import="Daos.DaoTipoDocumento"%>
<%@page import="Clases.TipoDocumento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Persona"%>
<%@page import="Daos.DaoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!

     long Documento_Persona;
     long id_tipo_documento;
     long Id_Tipo_Persona;
     String Nombre_Persona;
     String Apellido_Persona;
     String Direccion_Persona;
     long Telefono_Persona;
     String Email;
     String nombre_tipo_documento;
    
    %> 
    
    <%
    DaoPersona Persona = new DaoPersona();
                
                Persona persona = new Persona();
                ArrayList Listar = new ArrayList();
                
                Listar = Persona.ListarPersonaUnica(Long.parseLong(request.getParameter("DocumentoPersona")));
                
                for (int i=0;i<Listar.size();i++)
                {
                   persona=(Persona) Listar.get(i);
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
   
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
       <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Persona</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Persona</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarPersona.jsp">
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
              <input id="datos" type="text" name="DireccionPersona" required value="<%=Direccion_Persona%>"/>
      </label></td>
    </tr>
    <tr>
      <td>Telefono Persona</td>
      <td><label>
        <input type="number" name="TelefonoPersona" required value="<%=Telefono_Persona%>"/>
      </label></td>
    </tr>
     <tr>
      <td>Correo Electronico</td>
      <td><label>
        <input type="email" name="Email" required value="<%=Email%>"/>
      </label></td>
    </tr>
  </table>
       <center>
      <button type="submit">Modificar</button>
     <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
      </center>
</form>
        
    </body>
   
</html>
