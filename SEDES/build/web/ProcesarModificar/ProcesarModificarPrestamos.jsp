<%-- 
    Document   : ProcesarModificarPrestamos
    Created on : 28/07/2015, 05:51:49 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoInventarioElementos"%>
<%@page import="Daos.DaoPrestamos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DaoPrestamos Prestamos = new DaoPrestamos();
    
 
    long documento_Persona = Long.parseLong(request.getParameter("DocumentoPersona"));
    long Id_Elemento = Long.parseLong(request.getParameter("IdElemento"));
    String Fecha_Entrega = request.getParameter("Fecha_Entrega");
    String Hora_entrega = request.getParameter("Hora_entrega");
    String Observaciones = request.getParameter("Observaciones");
  
    DaoInventarioElementos inventarioelem = new DaoInventarioElementos();
    
    Long Id_inventario_elementos = Long.parseLong(request.getParameter("IdElemento"));
    Long Id_Tipo_Inventario = Long.parseLong(request.getParameter(""));
    
    
    
    
    if (inventarioelem.AlmacenarInventarioElementos(Id_inventario_elementos, Id_Tipo_Inventario, Id_Elemento))
    {
        if (Prestamos.ModificarPrestamo(documento_Persona, Fecha_Entrega, Hora_entrega, Observaciones))
        {
        %>
        
        <script languaje="javascript">
            alert("Has devuelto el objeto al inventario");
            location.href="../Modificar/ModificarPrestamos.jsp";
        </script>
        <%
        }
    else{
        %>
        <script languaje="javascript">
            alert("No se  actualizado datos del prestamo ");
            location.href="../Modificar/ModificarPrestamos.jsp";
        </script>
        <%
           }
          %>
        
