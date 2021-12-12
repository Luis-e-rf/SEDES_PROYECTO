<%-- 
    Document   : MostrarModificarAula_ficha
    Created on : 28/07/2015, 02:11:18 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Aula"%>
<%@page import="Daos.DaoAula"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Aula_ficha"%>
<%@page import="Daos.DaoAula_ficha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    long id_aula_ficha;
    long numero_ficha;
    long id_aula;
    
    %> 
    
    <%
    DaoAula_ficha Aula_ficha = new DaoAula_ficha();
                
                Aula_ficha aula_ficha = new Aula_ficha();
                ArrayList Listar = new ArrayList();
                
                Listar = Aula_ficha.ListarAula_fichaUnica(Long.parseLong(request.getParameter("idaulaficha")));
                
                for (int i=0;i<Listar.size();i++)
                {
                    aula_ficha =(Aula_ficha) Listar.get(i);
                    id_aula_ficha = aula_ficha.getId_aula_ficha();
                    numero_ficha = aula_ficha.getNumero_ficha();
                    id_aula = aula_ficha.getId_aula();
                    
                  
                }
   %>
   
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Modificar Aula Ficha</title>
    </head>
    <body>
        
    <center><img src="../imagenes/modificar.png" alt=""/></center>
   
       <h2><p>Modificar El Aula de una ficha</h2>
        
       <form id="form6" name="form6" method="post" action="../ProcesarModificar/ProcesarModificarAula_ficha.jsp">
  <table width="304" border="1">
    <tr>
      <td width="168">ID Aula de una ficha</td>
      <td width="162"><label>
        <input type="text" name="id_aula_ficha"  required value="<%=id_aula_ficha%>" readonly="" />
      </label></td>
    </tr>
    <tr>
      <td>FICHA N°</td>
      <td><label>
              <input type="text" name="numero_ficha" required value="<%=numero_ficha%>" readonly=""/>
      </label></td>
    </tr>
     <tr>
      <td>AULA</td>
      <td><label>
        <select name="id_aula" >
            <%   
        DaoAula  Aula = new DaoAula();
        Aula aula = new Aula();
        
         
        Listar= Aula.listarAula();
        
         for (int i=0;i<Listar.size();i++)
         {
         aula=(Aula)Listar.get(i);
         long id_aula=aula.getId_aula();
         String nombre_aula=aula.getNombre_aula();
         
          out.print("<option value="+id_aula+">"+nombre_aula+"</option>");
         }
         %>
        </select>
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
