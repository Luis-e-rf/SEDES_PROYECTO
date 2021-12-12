<%-- 
    Document   : ValidarPersona
    Created on : 28/07/2015, 03:52:05 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoPersona Persona = new DaoPersona();
    long documento_Persona  = Long.parseLong(request.getParameter("DocumentoPersona"));  

if(Persona.VerificarPersona(documento_Persona))
{
%>
                                            <script languaje="javascript">
                                        
                                    location.href="../Modificar/MostrarModificarPersona.jsp?DocumentoPersona=<%=documento_Persona%>";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("La Persona no se encuentra Registrada en el Sistema");
                                    location.href="../Agregar/AgregarPersona.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>