<%-- 
    Document   : ProcesarAgregarElemento
    Created on : 06-jul-2015, 18:09:35
    Author     : JupiterPC
--%>


<%@page import="Daos.DaoElementos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  DaoElementos  Elementos  = new DaoElementos ();
  long Id_Elemento = Long.parseLong(request.getParameter("IdElemento"));
  long Id_Tipo_Inventario = Long.parseLong(request.getParameter("TipoInventario"));
  long Id_Estado = 1;
  String Nombre_Elemento =request.getParameter("NombreElemento");
  long idMarca = Long.parseLong(request.getParameter("Marca"));
  long IdTipo_Elemento = Long.parseLong(request.getParameter("TipoElemnt"));
  String Descripcion_Elemento =request.getParameter("DescripcionElemento");
  
  
  

  
    if (Elementos.AlmacenarElementos(Id_Elemento, IdTipo_Elemento, Id_Tipo_Inventario, idMarca, Id_Estado, Nombre_Elemento, Descripcion_Elemento))
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
    