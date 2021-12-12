<%-- 
    Document   : AsignarAulaFicha
    Created on : 25/08/2015, 05:56:40 PM
    Author     : ADSI Sena
--%>

<%@page import="Clases.Aula"%>
<%@page import="Daos.DaoAula"%>
<%@page import="java.util.Date"%>
<%@page import="Clases.Ficha"%>
<%@page import="java.util.ArrayList"%>
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
                
                Listar = Ficha.ListarFichaUnico(Long.parseLong(request.getParameter("NumFicha")));
                
                for (int i=0;i<Listar.size();i++)
                {
                   ficha=(Ficha) Listar.get(i);
                    numero_ficha = ficha.getNumero_ficha();
                    id_programa =ficha.getId_programa();
                    fecha_inicio = ficha.getFecha_inicio();
                    fecha_fin = ficha.getFecha_fin();
                       
                }
   %>
<html>
  <html>
     <head>
          <%!
    String Usuario ="";
%>
<%
    
    HttpSession SessionActiva = request.getSession();
    
    if(SessionActiva.getAttribute("Usuario")==null)
    {
%>
    <script type="text/javascript">
    
    alert("Por Favor Iniciar Sesión");
    location.href="../paginas/ingresar.jsp";
    
    </script>

<%    
    }
    
    else 
    {
    
    Usuario =(String)SessionActiva.getAttribute("Usuario");
    }

%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/estiloform.css" rel="stylesheet" type="text/css"/>
         <link rel="shortcut icon" href="../imagenes/escudo.png">
        <title>Asignar Aula Ficha</title>
    </head>
    <body>
    <center><img src="../imagenes/modificar.png" alt=""/></center>
      
       <h2><p>Asignar Aula a una Ficha</h2>
       <form id="form6" action="../Asignar/ProcesarAgregarAulaFicha.jsp" method="Post">
           <table width="304" border="1">
           <tr>
             <td width="168">Numero de la ficha</td>
             <td width="162"><label>
             <input type="number" name="NumFicha" required value="<%=numero_ficha%>" readonly="" />
         </label></td>
           </tr> 
            <tr>
      <td>Seleccione el Aula</td>
      <td><label>
        <select name="IdAula" >
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
                <button type="submit">Enviar</button>
          <a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>
           </center>
       </form>
          
          
    </body>
</html>
