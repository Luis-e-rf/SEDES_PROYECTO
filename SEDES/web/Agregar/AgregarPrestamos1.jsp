<%-- 
    Document   : AgregarPrestamos
    Created on : 4/09/2015, 03:34:01 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Estado"%>
<%@page import="Daos.DaoEstado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoPersona"%>
<%@page import="Clases.Persona"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../imagenes/escudo.png">
        <link href="../css/estiloprest.css" rel="stylesheet" type="text/css"/>
        <title>Prestamos</title>
        
    </head>
    <%
      Calendar fecha = new GregorianCalendar();
        
        long Año = fecha.get(Calendar.YEAR);
        long Mes = (fecha.get(Calendar.MONTH))+1;
        long Dia = fecha.get(Calendar.DAY_OF_MONTH);
        
        long hora = fecha.get(Calendar.HOUR_OF_DAY);
        long minuto = fecha.get(Calendar.MINUTE);
        long segundo = fecha.get(Calendar.SECOND);
        
    %>
       <body>

     <center> <img src="../imagenes/prestamo.png" alt=""/></center>
     <h1>Prestamo de Elementos </h1>
     
       
     <form name="form1" method="post" action="../ProcesarAgregar/ProcesarAgregarPrestamos.jsp" >         
  <table width="304" border="1">
    <tr>
      <td>documento_Persona</td>
      <td><label>
        <select name="documento_Persona" required >
            <%
       Persona Persona =new Persona();
       DaoPersona  persona = new DaoPersona();
       ArrayList Listar = new ArrayList();
      
       Listar=persona.ListarPersona();
      
        for (int i=0;i<Listar.size();i++)
        {
        Persona =(Persona)Listar.get(i);
        long Documento_Persona =Persona.getDocumento_Persona();
         
                
         out.print("<option value="+Documento_Persona+">"+Documento_Persona+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>
    <tr>
      <td>Fecha_Prestamos</td>
      <td><label>
              <input name="Fecha_Prestamos" readonly="" value="<%=(Año+"/"+Mes+"/"+Dia)%>" />
      </label></td>
    </tr>
    <tr>
      <td>Hora_Prestamos</td>
      <td><label>
              <input name="Hora_Prestamos" readonly="" value="<%=(hora+":"+minuto+":"+segundo)%>" />
      </label></td>
    </tr>
    <tr>
      <td>Fecha_Entrega</td>
      <td><label>
              <input name="Fecha_entrega" readonly="" value="<%=(Año+"/"+Mes+"/"+Dia)%>" />
      </label></td>
    </tr>
    <tr>
      <td>Hora_entrega</td>
      <td><label>
              <input name="Hora_entrega" readonly="" value="<%=(hora+":"+minuto+":"+segundo)%>" />
      </label></td>
    </tr>
    <tr>
      <td>Observaciones</td>
      <td><label>
              <input type="text" name="Observaciones" />
      </label></td>
    </tr>
  </table>
       <center>
           <a href="../Listar/Listar_Prestamos.jsp"><button type="button" >Consultar</button></a>
       <button type="submit" >Guardar</button>
       <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
       </center>
     </form>
  </body>
</html>