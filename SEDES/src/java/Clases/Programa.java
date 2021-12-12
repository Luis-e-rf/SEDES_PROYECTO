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
public class Programa {
    
    private long id_programa;
    private String nombre_programa;
    private long version_programa;
    private String descripcion_programa;

    /**
     * @return the id_programa
     */
    public long getId_programa() {
        return id_programa;
    }

    /**
     * @param id_programa the id_programa to set
     */
    public void setId_programa(long id_programa) {
        this.id_programa = id_programa;
    }

    /**
     * @return the nombre_programa
     */
    public String getNombre_programa() {
        return nombre_programa;
    }

    /**
     * @param nombre_programa the nombre_programa to set
     */
    public void setNombre_programa(String nombre_programa) {
        this.nombre_programa = nombre_programa;
    }

    /**
     * @return the version_programa
     */
    public long getVersion_programa() {
        return version_programa;
    }

    /**
     * @param version_programa the version_programa to set
     */
    public void setVersion_programa(long version_programa) {
        this.version_programa = version_programa;
    }

    /**
     * @return the descripcion_programa
     */
    public String getDescripcion_programa() {
        return descripcion_programa;
    }

    /**
     * @param descripcion_programa the descripcion_programa to set
     */
    public void setDescripcion_programa(String descripcion_programa) {
        this.descripcion_programa = descripcion_programa;
    }
    
}
