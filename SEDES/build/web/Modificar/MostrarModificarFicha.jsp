<%-- 
    Document   : Mostrar_Modificar_Ficha
    Created on : 3/07/2015, 05:26:50 PM
    Author     : Diego
--%>

<%@page import="Clases.Programa"%>
<%@page import="Daos.DaoPrograma"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Ficha"%>
<%@page import="Daos.DaoFicha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    long numero_ficha;
    long id_programa;
    Date fecha_inicio;
    Date fecha_fin;
    
    %> 
    
    <%
    DaoFicha Ficha = new DaoFicha();
                
                Ficha ficha = new Ficha();
                ArrayList Listar = new ArrayList();
                
               Listar = Ficha.ListarFichaUnico(Long.parseLong(request.getParameter("numeroficha")));
        
                
                for (int i=0;i<Listar.size();i++)
                {
                    ficha =(Ficha) Listar.get(i);
                    numero_ficha = ficha.getNumero_ficha();
                    id_programa = ficha.getId_programa();
                    fecha_inicio = ficha.getFecha_inicio();
                    fecha_fin = ficha.getFecha_fin();
                    
                }
   %>
   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Ficha</title>
    </head>
    <body>
        <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar Datos Ficha</h2>
        
    
        
         <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarFicha.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">Ficha N°</td>
      <td width="162"><label>
        <input type="text" name="numeroficha"  required value="<%=numero_ficha%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>Programa</td>
      <td><label>
        <select name="idprograma" >
            <%   
        DaoPrograma  Programa= new DaoPrograma();
        Programa programa = new Programa();
         
        Listar= Programa.ListarPrograma();
        
         for (int i=0;i<Listar.size();i++)
         {
         programa=(Programa)Listar.get(i);
         long id_programa = programa.getId_programa();
         String nombre_programa = programa.getNombre_programa();
         
          out.print("<option value="+id_programa+">"+nombre_programa+"</option>");
         }
         %>
        </select>
      </label></td>
    </tr>
 
    <tr>
      <td>Fecha de Inicio </td>
      <td><label>
        <input type="date" name="fechaInicio" required value="<%=fecha_inicio%>" readonly=""/>
      </label></td>
    </tr>
    <tr>
      <td>Fecha Fin </td>
      <td><label>
        <input type="date" name="fechaFin" required value="<%=fecha_fin%>" />
      </label></td>
    </tr>  
  </table>
      <center>
      <button type="submit" h>Modificar</button>
     <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
      </center>
      
</form>
        
    </body>
   
</html>
