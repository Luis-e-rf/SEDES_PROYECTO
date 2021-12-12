<%-- 
    Document   : ValidarFicha
    Created on : 25/08/2015, 05:59:23 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoFicha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoFicha Ficha = new DaoFicha();
    long numero_ficha  = Long.parseLong(request.getParameter("NumFicha"));  
    

if(Ficha.VerificarFicha(numero_ficha))
{   
%>
                                            <script languaje="javascript">
                                        
                                    location.href="../Asignar/AsignarAulaFicha.jsp?NumFicha=<%=numero_ficha%>";
                                    </script>
                                       <%
   }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("La Ficha no se encuentra Registrada en el Sistema");
                                    location.href="../Asignar/VerificarFicha.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
