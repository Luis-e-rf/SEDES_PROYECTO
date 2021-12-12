<%-- 
    Document   : MostrarModificarTipoPersona
    Created on : 28/07/2015, 04:49:52 PM
    Author     : ADSI Sena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.TipoPersona"%>
<%@page import="Daos.DaoTipoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
      long id_Tipo_Persona;
     String Nombre_Tipo_Persona;
     String Descripcion_Tipo_Persona;
    
    %> 
    
    <%
    DaoTipoPersona TipoPersona = new DaoTipoPersona();
                
                TipoPersona tipopersona = new TipoPersona();
                ArrayList Listar = new ArrayList();
                
                Listar = TipoPersona.ListarTipoPersonaunico(Long.parseLong(request.getParameter("idTipoPersona")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    tipopersona =(TipoPersona) Listar.get(i);
                    id_Tipo_Persona = tipopersona.getId_Tipo_Persona();
                    Nombre_Tipo_Persona = tipopersona.getNombre_Tipo_Persona();
                    Descripcion_Tipo_Persona = tipopersona.getDescripcion_Tipo_Persona();
                   
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link href="../css/estiloprest.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Tipo Persona</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Rol Persona</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarTipoPersona.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">Rol N°</td>
      <td width="162"><label>
              <input type="text" name="id_Tipo_Persona"  required value="<%=id_Tipo_Persona%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Rol</td>
      <td><label>
              <input id="datos" type="text" name="Nombre_Tipo_Persona" required value="<%=Nombre_Tipo_Persona%>" />
      </label></td>
    </tr>
    <tr>
      <td>Descripcion</td>
      <td><label>
              <input id="datos" type="text" name="Descripcion_Tipo_Persona" required value="<%=Descripcion_Tipo_Persona%>" />
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
