<%-- 
    Document   : MostrarModificarPrestamos
    Created on : 28/07/2015, 04:04:33 PM
    Author     : ADSI Sena
--%>



<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page import="Clases.Persona"%>
<%@page import="Daos.DaoPersona"%>
<%@page import="Daos.DaoPrestamos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Prestamos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
     long Id_Prestamos;
     long DocumentoPersona;
     long Id_Elemento;
     Date Fecha_Prestamos;
     Time Hora_Prestamos;
     Date Fecha_Entrega;
     Time Hora_entrega;
     String Observaciones;
     
    
    %> 
    
    <%
            Calendar fecha = new GregorianCalendar();

            long Año = fecha.get(Calendar.YEAR);
            long Mes = (fecha.get(Calendar.MONTH)) + 1;
            long Dia = fecha.get(Calendar.DAY_OF_MONTH);

            long hora = fecha.get(Calendar.HOUR_OF_DAY);
            long minuto = fecha.get(Calendar.MINUTE);
            long segundo = fecha.get(Calendar.SECOND);

        %>
        
    <%
    DaoPrestamos Prestamos = new DaoPrestamos();
                
                Prestamos prestamos = new Prestamos();
                ArrayList Listar = new ArrayList();
                
                Listar = Prestamos.ListarPrestamoDoc(Long.parseLong(request.getParameter("DocumentoPersona")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    prestamos =(Prestamos) Listar.get(i);
                    Id_Prestamos = prestamos.getId_Prestamos();
                    DocumentoPersona = prestamos.getDocumento_Persona();
                    Id_Elemento = prestamos.getId_Elemento();
                    Fecha_Prestamos = prestamos.getFecha_Prestamos();
                    Hora_Prestamos = prestamos.getHora_Prestamos();
                    Fecha_Entrega = prestamos.getFecha_Entrega();
                    Hora_entrega = prestamos.getHora_entrega();
                    Observaciones = prestamos.getObservaciones();
                  
                }
   %>
   
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link href="../css/estiloconsultas.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Prestamos</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h1>Devolucion de prestamo</h1>
        
       <form method="post" action="../ProcesarModificar/ProcesarModificarPrestamos.jsp">
           <center>
           <table id="sel2" border="1">
    <tr>
      <td width="144">Prestado a:</td>
      <td width="144"><label>
              <input type="text" name="DocumentoPersona" value="<%=DocumentoPersona%>" readonly=""/>
      </label></td>
    </tr>   
    <tr>
      <td width="144">Serial Elemento</td>
      <td width="144"><label>
              <input type="text" name="IdElemento" value="<%=Id_Elemento%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
    <td width="144">Observaciones</td>
      <td width="144"><label>
              <input type="text" name="Observaciones" required value="" />
      </label></td>
    </tr>
    <input type="hidden" name="Fecha_Entrega" value="<%=(Año + "/" + Mes + "/" + Dia)%>" readonly=""/>
    <input type="hidden" name="Hora_entrega" value="<%=(hora + ":" + minuto + ":" + segundo)%>" readonly=""/>
      
  
  </table>
           </center>
      <center>
      <button type="submit" >Modificar</button>
     <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
      </center>
      
</form>
        
    </body>
   
</html>
