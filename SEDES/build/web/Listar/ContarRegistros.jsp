<%-- 
    Document   : ContarRegistros
    Created on : 26/08/2015, 03:22:58 PM
    Author     : ADSI SENA
--%>

<%@page import="Daos.DaoUsuarioPersonas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
DaoUsuarioPersonas pero  = new DaoUsuarioPersonas();

response.getWriter().print(pero.ContarRegistros());
response.getWriter().flush();
response.getWriter().close();
 
%>
        
        