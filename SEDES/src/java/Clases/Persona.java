/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author ADSI Sena
 */
public class Persona {
    private long Documento_Persona;
    private long id_tipo_documento;
    private long Id_Tipo_Persona;
    private String Nombre_Persona;
    private String Apellido_Persona;
    private String Direccion_Persona;
    private long Telefono_Persona;
    private String Email;

    /**
     * @return the Documento_Persona
     */
    public long getDocumento_Persona() {
        return Documento_Persona;
    }

    /**
     * @param Documento_Persona the Documento_Persona to set
     */
    public void setDocumento_Persona(long Documento_Persona) {
        this.Documento_Persona = Documento_Persona;
    }

    /**
     * @return the id_tipo_documento
     */
    public long getId_tipo_documento() {
        return id_tipo_documento;
    }

    /**
     * @param id_tipo_documento the id_tipo_documento to set
     */
    public void setId_tipo_documento(long id_tipo_documento) {
        this.id_tipo_documento = id_tipo_documento;
    }

    /**
     * @return the Id_Tipo_Persona
     */
    public long getId_Tipo_Persona() {
        return Id_Tipo_Persona;
    }

    /**
     * @param Id_Tipo_Persona the Id_Tipo_Persona to set
     */
    public void setId_Tipo_Persona(long Id_Tipo_Persona) {
        this.Id_Tipo_Persona = Id_Tipo_Persona;
    }

    /**
     * @return the Nombre_Persona
     */
    public String getNombre_Persona() {
        return Nombre_Persona;
    }

    /**
     * @param Nombre_Persona the Nombre_Persona to set
     */
    public void setNombre_Persona(String Nombre_Persona) {
        this.Nombre_Persona = Nombre_Persona;
    }

    /**
     * @return the Apellido_Persona
     */
    public String getApellido_Persona() {
        return Apellido_Persona;
    }

    /**
     * @param Apellido_Persona the Apellido_Persona to set
     */
    public void setApellido_Persona(String Apellido_Persona) {
        this.Apellido_Persona = Apellido_Persona;
    }

    /**
     * @return the Direccion_Persona
     */
    public String getDireccion_Persona() {
        return Direccion_Persona;
    }

    /**
     * @param Direccion_Persona the Direccion_Persona to set
     */
    public void setDireccion_Persona(String Direccion_Persona) {
        this.Direccion_Persona = Direccion_Persona;
    }

    /**
     * @return the Telefono_Persona
     */
    public long getTelefono_Persona() {
        return Telefono_Persona;
    }

    /**
     * @param Telefono_Persona the Telefono_Persona to set
     */
    public void setTelefono_Persona(long Telefono_Persona) {
        this.Telefono_Persona = Telefono_Persona;
    }

    /**
     * @return the Email
     */
    public String getEmail() {
        return Email;
    }

    /**
     * @param Email the Email to set
     */
    public void setEmail(String Email) {
        this.Email = Email;
    }
}

  