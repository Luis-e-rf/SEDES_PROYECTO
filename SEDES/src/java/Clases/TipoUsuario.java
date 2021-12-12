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
public class TipoUsuario {
    
    private long Id_Tipo_usuario;
    private String Nombre_Tipo_usuario;
    private String Descripcion_Tipo_usuario;        

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

    /**
     * @return the Nombre_Tipo_usuario
     */
    public String getNombre_Tipo_usuario() {
        return Nombre_Tipo_usuario;
    }

    /**
     * @param Nombre_Tipo_usuario the Nombre_Tipo_usuario to set
     */
    public void setNombre_Tipo_usuario(String Nombre_Tipo_usuario) {
        this.Nombre_Tipo_usuario = Nombre_Tipo_usuario;
    }

    /**
     * @return the Descripcion_Tipo_usuario
     */
    public String getDescripcion_Tipo_usuario() {
        return Descripcion_Tipo_usuario;
    }

    /**
     * @param Descripcion_Tipo_usuario the Descripcion_Tipo_usuario to set
     */
    public void setDescripcion_Tipo_usuario(String Descripcion_Tipo_usuario) {
        this.Descripcion_Tipo_usuario = Descripcion_Tipo_usuario;
    }
    
}
