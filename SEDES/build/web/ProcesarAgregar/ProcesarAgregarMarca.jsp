<%-- 
    Document   : ProcesarAgregarMarca
    Created on : 25/08/2015, 01:39:46 PM
    Author     : ADSI  Sena
--%>

<%@page import="Daos.DaoMarca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  DaoMarca Marca = new DaoMarca();
  String Nombre_Marca = request.getParameter("NombreMarca");
  String Descripcion_Marca = request.getParameter("Descripcion_Marca");

  if(Marca.AlmacenarMarca(Nombre_Marca, Descripcion_Marca))
   
  {
%>
                                    <script languaje="javascript">
                                    alert("Has ingresado una Nueva Marca ");
                                    location.href="../Agregar/AgregarMarca.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                    <script languaje="javascript">
                                    alert("No se ha ingresado la Marca");
                                    location.href="../Agregar/AgregarMarca.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>