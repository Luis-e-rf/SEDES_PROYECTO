<%-- 
    Document   : ProcesarEntregar
    Created on : 12/02/2016, 07:21:10 AM
    Author     : Admin_sena
--%>



<%@page import="Daos.DaoElementos"%>
<%@page import="Daos.DaoPrestamos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DaoPrestamos Prestamos = new DaoPrestamos();
    
 
    long documento_Persona = Long.parseLong(request.getParameter("DocumentoPersona"));
    long Id_Elemento = Long.parseLong(request.getParameter("Id_Elemento"));
    String Fecha_Entrega = request.getParameter("Fecha_entrega");
    String Hora_entrega = request.getParameter("Hora_entrega");
    String Observaciones = request.getParameter("Observaciones");
     
    DaoElementos Elemento = new DaoElementos();
    long Id_Estado= 1;
    if (Prestamos.EntregarPrestamo(documento_Persona, Fecha_Entrega, Hora_entrega, Observaciones))
    {
        if (Elemento.ModificarElemento(Id_Elemento, Id_Estado))
    {
 %>
                                             <script languaje="javascript">
                                    alert("Has Entregado un Prestamo");
                                    location.href="MostrarEntrega.jsp";
                                    </script>
                                       <%
    }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se Ha Entregado el Prestamo");
                                    location.href="MostrarEntrega.jsp";
                                    </script>
                                    <%       
                  }
    }
               else{
              %>
                                             <script languaje="javascript">
                                    alert("No se Ha Entregado el Prestamo");
                                    location.href="MostrarEntrega.jsp";
                                    </script>
                                    <%       
                   }    
              %>
                                             