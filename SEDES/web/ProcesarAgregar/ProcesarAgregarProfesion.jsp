<%-- 
    Document   : ProcesarAgregarProfesion
    Created on : 06-jul-2015, 12:16:59
    Author     : JupiterPC
--%>

<%@page import="Daos.DaoProfesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  DaoProfesion Profesion  = new DaoProfesion();
  String nombre_profesion =request.getParameter("NombreProfesion");
  String descripcion_profesion =request.getParameter("DescripcionProfesion");


    if (Profesion.AlmacenarProfesion(nombre_profesion, descripcion_profesion))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has ingresado una Nueva Profesion");
                                    location.href="../Agregar/AgregarProfesion.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha ingresado la Profesion");
                                    location.href="../Agregar/AgregarProfesion.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
    
    
