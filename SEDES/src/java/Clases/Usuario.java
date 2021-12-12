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
public class Usuario {
    private String Nombre_Usuario;
    private String Contraseña_Usuario;
     private long documento_persona;
     private long Id_Tipo_usuario;

    /**
     * @return the Nombre_Usuario
     */
    public String getNombre_Usuario() {
        return Nombre_Usuario;
    }

    /**
     * @param Nombre_Usuario the Nombre_Usuario to set
     */
    public void setNombre_Usuario(String Nombre_Usuario) {
        this.Nombre_Usuario = Nombre_Usuario;
    }

    /**
     * @return the Contraseña_Usuario
     */
    public String getContraseña_Usuario() {
        return Contraseña_Usuario;
    }

    /**
     * @param Contraseña_Usuario the Contraseña_Usuario to set
     */
    public void setContraseña_Usuario(String Contraseña_Usuario) {
        this.Contraseña_Usuario = Contraseña_Usuario;
    }

    /**
     * @return the documento_persona
     */
    public long getDocumento_persona() {
        return documento_persona;
    }

    /**
     * @param documento_persona the documento_persona to set
     */
    public void setDocumento_persona(long documento_persona) {
        this.documento_persona = documento_persona;
    }

    /**
     * @return the Id_Tipo_usuario
     */
    public long getId_Tipo_usuario() {
        return Id_Tipo_usuario;
    }

    /**
     * @param Id_Tipo_usuario the Id_Tipo_usuario to set
     */
    public void setId_Tipo_usuario(long Id_Tipo_usuario) {
        this.Id_Tipo_usuario = Id_Tipo_usuario;
    }

}