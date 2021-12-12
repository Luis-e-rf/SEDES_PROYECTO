<%@page import="Daos.DaoElementos"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String ubicacionArchivo = "/D:/mauro/SEDES PROYECTO/SEDES/web/CSV/";

DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(1024); 
factory.setRepository(new File(ubicacionArchivo));

ServletFileUpload upload = new ServletFileUpload(factory);

try
{
List<FileItem> partes = upload.parseRequest(request);

for(FileItem item : partes)
{
File file = new File( ubicacionArchivo,"mycsvelementos.csv");
item.write(file);
}
%>
        
        <script type="text/javascript">
            alert("Archivo subido con exito");
        </script>
        <%
}
catch(FileUploadException ex)
{
out.println("Error Subiendo Archivo"+ex.getMessage());
}
%>

<%
    DaoElementos elementos = new DaoElementos();
    
    if(elementos.ProcesarEnviarBDelementos())
    {
%>
    <script languaje="javascript">
        alert("Has Ingresado Datos al Sistema");
        location.href="../paginas/menu.jsp";
    </script>
<%
    }
    else
    {
%>                              
    <script languaje="javascript">
    alert("No se Ha agregado nada");
    location.href="../Agregar/AgregarCSVelementos.jsp";
    </script>
<%
    }   
%>