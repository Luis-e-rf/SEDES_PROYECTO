<%-- 
    Document   : PorcesarAgregarRegistro
    Created on : 8/07/2015, 03:10:04 PM
    Author     : ADSI Sena
--%>

 <%@page import="Daos.DaoPersonaProfesion"%>
<%@page import="Encripcion.MD5"%>
<%@page import="Daos.DaoUsuario"%>
<%@page import="Daos.DaoPersona"%>
<%
  DaoPersona  Persona = new DaoPersona();
  long documento_Persona= Long.parseLong(request.getParameter("NumeroDoc"));
  long id_tipo_documento = Long.parseLong(request.getParameter("TipoDoc"));
  long Id_Tipo_Persona = Long.parseLong(request.getParameter("TipoPersona"));
  String Nombre_Persona=request.getParameter("Nombres");
  String Apellido_Persona =request.getParameter("Apellidos");
  String Direccion_Persona=request.getParameter("Direccion");
  long Telefono_Persona =Long.parseLong(request.getParameter("Telefono"));
  String Email=request.getParameter("Email");
  
  DaoUsuario Usuario =new DaoUsuario();
  MD5 ecs =new MD5();
  String Nombre_Usuario = request.getParameter("User");
  String Contraseña_Usuario = ecs.hash(request.getParameter("password"));
  long Id_Tipo_usuario= Long.parseLong(request.getParameter("TipoUser"));
  
  DaoPersonaProfesion PerPro = new DaoPersonaProfesion();
  long id_profesion= Long.parseLong(request.getParameter("Profesion"));
  
    if (Persona.AlmacenarPersona(documento_Persona, id_tipo_documento, Id_Tipo_Persona, Nombre_Persona, Apellido_Persona, Direccion_Persona, Telefono_Persona, Email))
    {
        if(PerPro.AlmacenarPersonaProfesion(documento_Persona, id_profesion))
        {
        if(Usuario.AgregarUsuario(Nombre_Usuario, Contraseña_Usuario, documento_Persona, Id_Tipo_usuario))
          {
       
 %>
 
                                             <script languaje="javascript">
                                    alert("Tu Registro ha sido Exitoso");
                                    location.href="../paginas/index.jsp";
                                    </script>
                                       <%
         }
        else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha registrado correctamente");
                                    location.href="../paginas/registro.jsp";
                                    </script>
                                    <%
        
        
            }
        }
        else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha registrado correctamente");
                                    location.href="../paginas/registro.jsp";
                                    </script>
                                    <%
        
        
                  }
     }
    
    
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se ha registrado correctamente");
                                    location.href="../paginas/registro.jsp";
                                    </script>
                                    <%
        
        
                  }
    
    
    %>