<%-- 
    Document   : ProcesarEliminarTipoAula
    Created on : 16/07/2015, 01:38:51 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoTipoAula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  DaoTipoAula TipoAula = new DaoTipoAula();
  long id_tipo_aula = Long.parseLong(request.getParameter("id_tipo_aula"));
  
  
  
    if (TipoAula.EliminarTipoAula(id_tipo_aula))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado el Tipo de Aula");
                                    location.href="../Eliminar/EliminarTipoAula.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado el Tipo de Aula");
                                    location.href="../Eliminar/EliminarElementos.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
