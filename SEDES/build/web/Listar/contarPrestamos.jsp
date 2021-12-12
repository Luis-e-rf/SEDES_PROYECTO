<%-- 
    Document   : contarPrestamos
    Created on : 2/02/2016, 01:27:17 PM
    Author     : Admin_sena
--%>


<%@page import="Daos.DaoListaPrestamos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
DaoListaPrestamos pero  = new DaoListaPrestamos();

response.getWriter().print(pero.ContarRegistrosP());
response.getWriter().flush();
response.getWriter().close();
 
%>
