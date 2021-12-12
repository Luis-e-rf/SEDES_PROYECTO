<%-- 
    Document   : ProcesarEliminarTipoElemento
    Created on : 21/08/2015, 06:34:25 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoTipoElemento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  DaoTipoElemento   TipoElemento = new DaoTipoElemento ();
  long Id_Tipo_Elemento= Long.parseLong(request.getParameter("IdTipoElemento"));
  
  
    if (TipoElemento.EliminarTipoElemento(Id_Tipo_Elemento))
        
    {
       
 %>
 
                                    <script languaje="javascript">
                                    alert("Has Eliminado El Tipo Elemento");
                                    location.href="../Eliminar/EliminarTipoElemento.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado El tipo Elemento");
                                    location.href="../Eliminar/EliminarTipoElemento.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
