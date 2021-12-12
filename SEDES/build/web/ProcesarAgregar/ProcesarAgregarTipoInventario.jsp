<%-- 
    Document   : ProcesarAgregarTipoInventario
    Created on : 06-jul-2015, 14:34:53
    Author     : JupiterPC
--%>


<%@page import="Daos.DaoTipoInventario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  DaoTipoInventario  TipoInventario = new DaoTipoInventario();
  String Nombre_Tipo_Inventario =request.getParameter("NombreInventario");
  String Descripcion_Tipo_Inventario =request.getParameter("DescripcionInventario");


    if (TipoInventario.AgregarTipoInventario(Nombre_Tipo_Inventario, Descripcion_Tipo_Inventario))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has ingresado un Nuevo Tipo de Inventario");
                                    location.href="../Agregar/AgregarTipoInventario.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha ingresado el Tipo Inventario");
                                    location.href="../Agregar/TipoInventario.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
    
