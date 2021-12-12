<%-- 
    Document   : ValidarEntrega
    Created on : 8/02/2016, 07:50:59 AM
    Author     : Admin_sena
--%>

<%@page import="Daos.DaoPrestamos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoPrestamos Prestamos = new DaoPrestamos();
    
    
    long documento_Persona = Long.parseLong(request.getParameter("DocumentoPersona"));  

if(Prestamos.VerificarPrestamo(documento_Persona))
    
{
    
%>
                                            <script languaje="javascript">
                                            location.href="ListarEntrega.jsp?DocumentoPersona=<%=documento_Persona%>";
                                            </script>
                                    <%
}     
               else{
              %>
                                             <script languaje="javascript">
                                    alert("La Persona no se Encuentra registrada en el Sistema");
                                    location.href="MostrarEntrega.jsp";
                                    </script>
                                    <%
         }         
              %>
                                           