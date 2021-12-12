<%-- 
    Document   : ProcesarAgregarTipoElemento
    Created on : 25/08/2015, 01:40:34 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoTipoElemento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DaoTipoElemento TipoElemento = new DaoTipoElemento();
    String Nombre_Tipo_Elemento = request.getParameter("NombreTipoElem");
    
    if(TipoElemento.AgregarTipoElemento(Nombre_Tipo_Elemento))
    {
%>
                                    <script languaje="javascript">
                                    alert("Has ingresado un Nuevo Tipo Elemento");
                                    location.href="../Agregar/AgregarTipoElemento.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                    <script languaje="javascript">
                                    alert("No se ha ingresado el Tipo Elemento");
                                    location.href="../Agregar/AgregarTipoElemento.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
