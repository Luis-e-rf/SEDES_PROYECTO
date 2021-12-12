<%-- 
    Document   : ProcesarAgregarSede
    Created on : 06-jul-2015, 10:49:57
    Author     : JupiterPC
--%>
<%@page import="Daos.DaoSede"%>
<%
  DaoSede  Sede = new DaoSede();
  String nombre_sede =request.getParameter("NombreSede");
  String Horario_sede =request.getParameter("HorarioSede");
  String observaciones_sede =request.getParameter("ObservacionesSede");


    if (Sede.AlmacenarSede(nombre_sede, Horario_sede, observaciones_sede))
        
    {
       
 %>
 
                                            <script languaje="javascript">
                                    alert("Has ingresado una Nueva Sede");
                                    location.href="../Agregar/AgregarSede.jsp";
                                    </script>
                                       <%
         }
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha ingresado la Sede");
                                    location.href="../Agregar/AgregarSede.jsp";
                                    </script>
                                    <%
        
        
    }
    
    %>
    
    
