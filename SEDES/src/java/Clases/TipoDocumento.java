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
public class TipoDocumento {
    private long id_tipo_documento;
    private String nombre_tipo_documento;
    private String descripcion_tipo_documento;

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
     * @return the nombre_tipo_documento
     */
    public String getNombre_tipo_documento() {
        return nombre_tipo_documento;
    }

    /**
     * @param nombre_tipo_documento the nombre_tipo_documento to set
     */
    public void setNombre_tipo_documento(String nombre_tipo_documento) {
        this.nombre_tipo_documento = nombre_tipo_documento;
    }

    /**
     * @return the descripcion_tipo_documento
     */
    public String getDescripcion_tipo_documento() {
        return descripcion_tipo_documento;
    }

    /**
     * @param descripcion_tipo_documento the descripcion_tipo_documento to set
     */
    public void setDescripcion_tipo_documento(String descripcion_tipo_documento) {
        this.descripcion_tipo_documento = descripcion_tipo_documento;
    }
    
}
