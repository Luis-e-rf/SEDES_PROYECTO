<%-- 
    Document   : ProcesarModificarFoto
    Created on : 14/08/2015, 02:15:51 PM
    Author     : ADSI Sena
--%>

<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String Usuario = "";
%>
<%

    HttpSession SessionActiva = request.getSession();

    if (SessionActiva.getAttribute("Usuario") == null) {
%>
<script type="text/javascript">

    alert("Por Favor Iniciar Sesión");
    location.href = "../paginas/ingresar.jsp";

</script>

<%
    } else {

        Usuario = (String) SessionActiva.getAttribute("Usuario");
    }

%>
<%
      String Ubicacion="G:/mauro//SEDES PROYECTO/SEDES/web/imgPerfil"; 
      
      DiskFileItemFactory factory = new DiskFileItemFactory();
      
      factory.setSizeThreshold(1024);
      
      factory.setRepository(new File(Ubicacion));
      
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      try 
      {
          List<FileItem> partes = upload.parseRequest(request);
          
          for(FileItem item: partes)
          {
              File file = new File(Ubicacion,Usuario+".jpg");
              item.write(file);
              
          }
          
           %>
           <script type="text/javascript">
           alert("La Foto de tu Perfil ha sido Modificada");
           location.href="../paginas/menu.jsp";
               
           </script>
<%
      }
      catch(FileUploadException ex)
      {
          out.println("Error Subiendo Archivo"+ex.getMessage());
          
      }
      
      


%>
