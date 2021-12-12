 <%-- 
    Document   : ProcesarAgregarPrestamos
    Created on : 19/08/2015, 06:24:48 PM
    Author     : ADSI  Sena
--%>
<%@page import="Daos.DaoPersona"%>
<%@page import="Daos.DaoElementos"%>

<%@page import="Daos.DaoPrestamos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
private long Id_Estado ;
 %>   
<%
    
    DaoPersona person = new DaoPersona();
    long documento_Persona  = Long.parseLong(request.getParameter("doc"));
    
    DaoElementos elementos = new DaoElementos();
    long Id_Elemento = Long.parseLong(request.getParameter("elem"));
   
    
    
    DaoPrestamos prestamos = new DaoPrestamos();    
    
    
    
    String Fecha_Prestamos = request.getParameter("Fecha_Prestamos");
    String Hora_Prestamos = request.getParameter("Hora_Prestamos");
    
    
    
    
    
    
    
    
    
   if(prestamos.VerificarPrestamoEstadoPersona(documento_Persona, Id_Elemento, Id_Estado)){
        %>
                        <script type="text/javascript">
                            alert("La persona ya tiene prestado un objeto");
                            location.href = "../Agregar/AgregarPrestamo.jsp";
                        </script>
                        <%
                            }
   
   if(elementos.VerificarEstadoElemento(Id_Elemento, Id_Estado))
            {
                %>
            <script languaje="javascript">
                alert("El elemento ya esta prestado");
                location.href="../Agregar/AgregarPrestamo.jsp";
            </script>
            <%
                }
   else{
    
    if(person.VerificarPersona(documento_Persona))
    {
        if(elementos.VerificarElemento(Id_Elemento))
        {
            
                if (prestamos.AlmacenarPrestamos(documento_Persona, Id_Elemento, Fecha_Prestamos, Hora_Prestamos))
                {
                    if(elementos.ActualizarEstadoElementoAuto(Id_Elemento, Id_Estado))
                    {
                        
                           
                        %>
                        <script type="text/javascript">
                            alert("Has ingresado una Nuevo Prestamo");
                            location.href = "../Agregar/AgregarPrestamo.jsp";
                        </script>

                        <%
                }
                else{
                %>
                <script type="text/javascript">
                    alert("No se ha ingresado el Prestamo");
                    location.href = "../Agregar/AgregarPrestamo.jsp";
                </script>
                <%
                    }
            }
                else{
                %>
                <script type="text/javascript">
                    alert("No se ha ingresado el Prestamo");
                    location.href = "../Agregar/AgregarPrestamo.jsp";
                </script>
                <%
                    }
        }
            
        else{
        %>
        <script languaje="javascript">
            alert("El elemento no se encuentra Registrado en el Sistema");
            location.href="../Agregar/AgregarPrestamo.jsp";
        </script>
              <%
            }
    }
    else{
    %>
    <script languaje="javascript">
        alert("La Persona no se encuentra Registradaa en el Sistema");
        location.href="../Agregar/AgregarPrestamo.jsp";
    </script>
    <%
        }
   }
    %>