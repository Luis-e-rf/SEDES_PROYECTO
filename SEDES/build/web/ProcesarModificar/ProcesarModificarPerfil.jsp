
<%@page import="Daos.DaoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
long Documento_Persona; 
%> 

<%
    DaoPersona Persona = new DaoPersona();
    
   
    long documento_Persona  = Long.parseLong(request.getParameter("DocumentoPersona"));  
    String Direccion_Persona   = request.getParameter("DireccionPersona");
    long Telefono_Persona  = Long.parseLong(request.getParameter("TelefonoPersona"));  
    String Email=request.getParameter("Email");
    
    if (Persona.ModificarPersona(documento_Persona, Direccion_Persona, Telefono_Persona, Email))
        
    {
        %>
        
        <script languaje="javascript">
            alert("Has actualizado tu Perfil");
            location.href="../paginas/menu.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado el Perfil ");
            location.href="../Modificar/MostrarModificarPerfil.jsp?Documento_Persona=<%=Documento_Persona%>";
        </script>
       <%
           }
         %>
