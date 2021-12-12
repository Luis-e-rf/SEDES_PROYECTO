<%-- 
    Document   : ProcesarAgregarPrograma
    Created on : 06-jul-2015, 13:18:49
    Author     : JupiterPC
--%>

<%@page import="Daos.DaoPrograma"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  DaoPrograma  Programa = new DaoPrograma();
  long id_programa = Long.parseLong(request.getParameter("IdPrograma"));
  String nombre_programa =request.getParameter("NombrePrograma");
  long version_programa = Long.parseLong(request.getParameter("VersionPrograma"));
  String descripcion_programa =request.getParameter("DescripcionPrograma");


    if (Programa.AlmacenarPrograma(id_programa, nombre_programa, version_programa, descripcion_programa))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has ingresado un Nuevo Programa");
                                    location.href="../Agregar/AgregarPrograma.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha ingresado el Programa");
                                    location.href="../Agregar/AgregarPrograma.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
    