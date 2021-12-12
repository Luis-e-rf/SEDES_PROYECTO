<%-- 
    Document   : ProcesarEliminarTipoPersona
    Created on : 29/07/2015, 02:58:19 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoTipoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  DaoTipoPersona  TipoPersona = new DaoTipoPersona();
  long id_Tipo_Persona= Long.parseLong(request.getParameter("id_Tipo_Persona"));
  
  
    if (TipoPersona.EliminarTipoPersona(id_Tipo_Persona))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has Eliminado un Tipo Persona");
                                    location.href="../Eliminar/EliminarTipoPerspna.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha Eliminado el Tipo Persona");
                                    location.href="../Eliminar/EliminarTipoPersona.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
