<%-- 
    Document   : ProcesarAgregarTipoAula
    Created on : 06-jul-2015, 12:50:52
    Author     : JupiterPC
--%>

<%@page import="Daos.DaoTipoAula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  DaoTipoAula  TipoAula = new DaoTipoAula();
  String nombre_tipo_aula =request.getParameter("TipoAula");
  String descripcion_tipo_aula =request.getParameter("ObservacionesTipoAula");

    if (TipoAula.AgregarTipoAula(nombre_tipo_aula, descripcion_tipo_aula))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has ingresado un Nuevo Tipo de Aula");
                                    location.href="../Agregar/AgregarTipoAula.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha ingresado el Tipo de Aula");
                                    location.href="../Agregar/AgregarTipoAula.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
    
    

