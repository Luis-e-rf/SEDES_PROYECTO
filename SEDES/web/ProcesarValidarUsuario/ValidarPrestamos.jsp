<%-- 
    Document   : ValidarPrestamos
    Created on : 2/10/2015, 01:43:40 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoPrestamos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DaoPrestamos Prestamos = new DaoPrestamos();
    
    long documento_Persona  = Long.parseLong(request.getParameter("DocumentoPersona"));  

if(Prestamos.VerificarPrestamo(documento_Persona))
{
%>
                                            <script languaje="javascript">
                                        
                                    location.href="../Modificar/MostrarModificarPrestamos.jsp?DocumentoPersona=<%=documento_Persona%>";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("La Persona no se encuentra Registrada en el Sistema");
                                    location.href="../Modificar/ModificarPrestamos.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
