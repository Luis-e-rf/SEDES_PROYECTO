<<%-- 
    Document   : ListarEntrega
    Created on : 8/02/2016, 07:54:16 AM
    Author     : Admin_sena
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
     String Nombre_Persona;
     String Apellido_Persona;
     
    
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
   
   <%
    DaoPersona Persona = new DaoPersona();
                
                Persona persona = new Persona();
                ArrayList Listar2 = new ArrayList();
                
                Listar2 = Persona.ListarPersonaUnica(Long.parseLong(request.getParameter("DocumentoPersona")));
                
                for (int i=0;i<Listar2.size();i++)
                {
                   persona=(Persona) Listar2.get(i);
                    
                    Nombre_Persona = persona.getNombre_Persona();
                    Apellido_Persona = persona.getApellido_Persona();
                    
                }
   %>
<%
      Calendar fecha = new GregorianCalendar();
        
        long Año = fecha.get(Calendar.YEAR);
        long Mes = (fecha.get(Calendar.MONTH))+1;
        long Dia = fecha.get(Calendar.DAY_OF_MONTH);
        
        long hora = fecha.get(Calendar.HOUR_OF_DAY);
        long minuto = fecha.get(Calendar.MINUTE);
        long segundo = fecha.get(Calendar.SECOND);
        
    %>
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link href="../css/estiloprest.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Entrega de Prestamos</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Entrega de Prestamos</h2>
        
       <form id="form6" name="form6" method="post" action="ProcesarEntregar.jsp">
  <table width="304" border="1">
    
    <tr>
        <td>Prestado a:</td>     
       <td><label>
              <input type="text" name="" required value="<%=Nombre_Persona%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td>Documento:</td>
      <td><label>
              <input type="text" name="DocumentoPersona" required value="<%=DocumentoPersona%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
    <td>Elemento Prestado:</td>
      <td><label>
              <input type="text" name="Id_Elemento" required value="<%=Id_Elemento%>"  readonly=""/>
      </label></td>
    </tr>
    <tr id="input1">
      <td>Fecha Entrega</td>
      <td><label>
              <input id="input1" name="Fecha_entrega" readonly="" value="<%=(Año+"/"+Mes+"/"+Dia)%>" />
      </label></td>
    </tr>
    <tr id="input2">
      <td>Hora Entrega</td>
      <td><label>
              <input id="input2" name="Hora_entrega" readonly="" value="<%=(hora+":"+minuto+":"+segundo)%>" />
      </label></td>
    </tr>
    <tr>
    <td>Observaciones</td>
      <td><label>
              <input type="text" name="Observaciones"/>
      </label></td>
    </tr>
  </table>
      <center>
      <button type="submit" >Entregar</button>
     <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
      </center>
      
</form>
        
    </body>
   
</html>
