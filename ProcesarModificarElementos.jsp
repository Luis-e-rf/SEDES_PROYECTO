<%-- 
    Document   : ProcesarModificarElementos
    Created on : 27/07/2015, 04:59:20 PM
    Author     : ADSI Sena
--%>

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
  
  
 

     if (Elementos.ActualizarElemento(Id_Elemento,IdTipo_Elemento, idMarca, Id_Estado, Nombre_Elemento, Descripcion_Elemento))
        
    {
        
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has modificado el  Elemento");
                                    location.href="../Modificar/ModificarElementos.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No has modificado el Elemento");
                                    location.href="../Modificar/ModificarElementos.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
