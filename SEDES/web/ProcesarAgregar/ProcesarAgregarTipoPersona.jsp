<%-- 
    Document   : ProcesarAgregarTipoPersona
    Created on : 20/08/2015, 01:59:07 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoTipoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DaoTipoPersona Persona = new DaoTipoPersona();
    
    long id_Tipo_Persona = Long.parseLong(request.getParameter("idTipoPersona"));
    String Nombre_Tipo_Persona = request.getParameter("NombreTipoPersona");
    String Descripcion_Tipo_Persona = request.getParameter("DescripcionTipoPersona");
    
    if (Persona.AgregarTipoPersona(Nombre_Tipo_Persona, Descripcion_Tipo_Persona))
    {
        
        %>
                                    <script languaje="javascript">
                                    alert("Has ingresado un Nuevo Tipo Persona");
                                    location.href="../Agregar/AgregarTipoPersona.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                    <script languaje="javascript">
                                    alert("No se ha ingresado el Tipo Persona");
                                    location.href="../Agregar/AgregarTipoPersona.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>