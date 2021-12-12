<%-- 
    Document   : ProcesarAgregarFicha
    Created on : 06-jul-2015, 20:08:45
    Author     : JupiterPC
--%>

<%@page import="Daos.DaoFicha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  DaoFicha  Ficha = new DaoFicha();
  long numero_ficha = Long.parseLong(request.getParameter("Ficha"));
  long id_programa = Long.parseLong(request.getParameter("Programa"));
  String fecha_inicio =request.getParameter("Inicio");
  String fecha_fin = request.getParameter("Fin");

    if (Ficha.AlmacenarFicha(numero_ficha, id_programa,fecha_inicio,fecha_fin))   
    {
          response.getWriter().write("Correcto");
          response.getWriter().flush();
          response.getWriter().close();
     
        }
        else
        {
         response.getWriter().write("Incorrecto");
          response.getWriter().flush();
          response.getWriter().close(); 
        }
    
    %>
    