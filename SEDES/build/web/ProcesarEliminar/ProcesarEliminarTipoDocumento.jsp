<%-- 
    Document   : ProcesarEliminarTipoDocumento
    Created on : 8/07/2015, 04:57:18 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoTipoDocumento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    DaoTipoDocumento TipoDocumento = new DaoTipoDocumento();
    
    long id_tipo_documento  = Long.parseLong(request.getParameter("id_tipo_documento"));
    
    if (TipoDocumento.EliminarTipoDocumento(id_tipo_documento))
    {
%> 
                                    <script languaje="javascript">
                                    alert("Has Eliminado el Tipo Documento");
                                    location.href="../Eliminar/EliminarTipoDocumento.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                    <script languaje="javascript">
                                    alert("No Se Ha Eliminado el Tipo Documento");
                                    location.href="../Eliminar/EliminarTipoDocumento.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>