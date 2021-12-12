<%-- 
    Document   : AgregarElementos
    Created on : 06-jul-2015, 18:09:07
    Author     : JupiterPC
--%>

<%@page import="Daos.DaoEstado"%>
<%@page import="Clases.Estado"%>
<%@page import="Daos.DaoMarca"%>
<%@page import="Clases.Marca"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.DaoTipoElemento"%>
<%@page import="Clases.TipoElemento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%!
    String Usuario ="";
    long Documento_Persona;
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
        <title>AGREGAR ELEMENTO</title>
    </head>
    <body>
       <center> <img src="../imagenes/mas.png" alt=""/></center>
    <h2>Agregar Elementos</h2>
    <form action="../ProcesarAgregar/ProcesarAgregarElemento.jsp" method="post">
        <input type="number"  placeholder="Id Elemento" name="Id_Elemento" min="1" required=""/>
        <input id="datos" type="text"  placeholder="Nombre Elemento" name="Nombre_Elemento" required=""/>
        <center>
    <table id="sel"  border="1">
    <tr>
        <td>Tipo  de Elemento</td>     
       <td><label>
        <select name="TipoElemento" required>
            <%
       TipoElemento tipoElem =new  TipoElemento();
       DaoTipoElemento  TipoElem = new DaoTipoElemento();
       ArrayList Listar =new ArrayList();
      
      Listar= TipoElem.ListarTipoElemento() ;
      
        for (int i=0;i<Listar.size();i++)
        {
        tipoElem =(TipoElemento)Listar.get(i);
        long id_Tipo_elemento= tipoElem.getIdTipo_Elemento();
        String Nombre_Tipo_Elemento= tipoElem.getNombre_Tipo_Elemento();  
               
         out.print("<option value="+id_Tipo_elemento+">"+Nombre_Tipo_Elemento+"</option>");    
        }            
        %>
        </select>
      </label></td>
    </tr>
       </table>
    </center>
        <center>
    <table id="sel"  border="1">
    <tr>
        <td>Marca del Elemento</td>     
       <td><label>
        <select name="Marca" required>
            <%
       Marca marca =new  Marca();
       DaoMarca  Marca = new DaoMarca();
     
      Listar= Marca.listarMarca() ;
      
        for (int i=0;i<Listar.size();i++)
        {
        marca=(Marca)Listar.get(i);
        long IdMarca= marca.getIdMarca();
        String Nombre_Marca= marca.getNombre_Marca();  
                
         out.print("<option value="+IdMarca+">"+Nombre_Marca+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>
    
    <tr>
        <td>Estado</td>     
       <td><label>
        <select name="Estado" required>
            <%
       Estado estado =new  Estado();
       DaoEstado  Estado = new DaoEstado();
     
      Listar= Estado.listarEstado() ;
      
        for (int i=0;i<Listar.size();i++)
        {
        estado=(Estado)Listar.get(i);
        long Id_Estado= estado.getId_Estado();
        String Nombre_Estado= estado.getNombre_Estado();  
                
         out.print("<option value="+Id_Estado+">"+Nombre_Estado+"</option>");      
        }            
        %>
        </select>
      </label></td>
    </tr>
       </table>
    </center>
        <input id="datos" type="text"  placeholder="Descripcion Elemento" name="DescripcionElemento" required=""/>

<div><button type="submit" >Agregar</button>
</div><a href="../paginas/menu.jsp"><button type="button">Cancelar</button></a>

</form>
    </body>
</html>
