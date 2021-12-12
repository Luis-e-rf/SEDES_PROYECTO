<%-- 
    Document   : ProcesarEliminarMarca
    Created on : 21/08/2015, 06:33:51 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoMarca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  DaoMarca  Marca = new DaoMarca();
  long idMarca= Long.parseLong(request.getParameter("id_Marca"));
  
  
    if (Marca.EliminarMarca(idMarca))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado una Marca");
                                    location.href="../Eliminar/EliminarMarca.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                    <script languaje="javascript">
                                    alert("No se ha Eliminado una Marca");
                                    location.href="../Eliminar/EliminarMarca.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
