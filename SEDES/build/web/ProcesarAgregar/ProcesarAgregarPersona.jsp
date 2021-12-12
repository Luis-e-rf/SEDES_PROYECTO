<%-- 
    Document   : ProcesarAgregarPersona
    Created on : 8/07/2015, 06:30:21 PM
    Author     : ADSI Sena
--%>

<%@page import="Daos.DaoPersonaFicha"%>
<%@page import="Daos.DaoPersonaProfesion"%>
<%@page import="Daos.DaoPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
  
  DaoPersonaProfesion PerPro = new DaoPersonaProfesion();
  long id_profesion= Long.parseLong(request.getParameter("Profesion"));
  
  Daos.DaoPersonaFicha PerFicha =new DaoPersonaFicha();
  long numero_ficha = Long.parseLong(request.getParameter("Ficha"));
  
    if (Persona.AlmacenarPersona(documento_Persona, id_tipo_documento, Id_Tipo_Persona, Nombre_Persona, Apellido_Persona, Direccion_Persona, Telefono_Persona,Email))
    {
        if(PerPro.AlmacenarPersonaProfesion(documento_Persona, id_profesion))
        {
        if(PerFicha.AlmacenarPersonaFicha(numero_ficha, documento_Persona))
          {
       
 %>
 
                                             <script languaje="javascript">
                                    alert("Has agregado una nueva Persona");
                                    location.href="../Agregar/AgregarPersona.jsp";
                                    </script>
                                       <%
             }
    
              else{
              %>
                                             <script languaje="javascript">
                                    alert("No se Ha agregado la Persona");
                                    location.href="../Agregar/AgregarPersona.jsp";
                                    </script>
                                    <%
        
        
                }
         }     
               else{
              %>
                                             <script languaje="javascript">
                                    alert("No se Ha agregado la Persona");
                                    location.href="../Agregar/AgregarPersona.jsp";
                                    </script>
                                    <%
        
        
                    }
    }
                else{
              %>
                                             <script languaje="javascript">
                                    alert("No se Ha agregado la Persona");
                                    location.href="../Agregar/AgregarPersona.jsp";
                                    </script>
                                    <%
        
        
                    }
    %>
