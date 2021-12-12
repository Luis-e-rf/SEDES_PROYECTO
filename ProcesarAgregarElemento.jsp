<%-- 
    Document   : ProcesarAgregarElemento
    Created on : 06-jul-2015, 18:09:35
    Author     : JupiterPC
--%>

<%@page import="Daos.DaoEstado"%>
<%@page import="Daos.DaoMarca"%>
<%@page import="Daos.DaoElementos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  DaoElementos  Elementos  = new DaoElementos ();
  long Id_Elemento = Long.parseLong(request.getParameter("Id_Elemento"));
  long IdTipo_Elemento = Long.parseLong(request.getParameter("TipoElemento"));
  long idMarca = Long.parseLong(request.getParameter("Marca"));
  long Id_Estado = Long.parseLong(request.getParameter("Estado"));
  String Nombre_Elemento =request.getParameter("Nombre_Elemento");
  String Descripcion_Elemento =request.getParameter("DescripcionElemento");
  
  
 

     if (Elementos.AlmacenarElementos(Id_Elemento,IdTipo_Elemento, idMarca, Id_Estado, Nombre_Elemento, Descripcion_Elemento))
        
    {
        
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has ingresado un Nuevo Elemento");
                                    location.href="../Agregar/AgregarElementos.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha ingresado el Elemento");
                                    location.href="../Agregar/AgregarElementos.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>

    