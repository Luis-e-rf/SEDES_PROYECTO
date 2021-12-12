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
public class TipoAula {
    private long id_tipo_aula;
    private String nombre_tipo_aula;
    private String descripcion_tipo_aula;

    /**
     * @return the id_tipo_aula
     */
    public long getId_tipo_aula() {
        return id_tipo_aula;
    }

    /**
     * @param id_tipo_aula the id_tipo_aula to set
     */
    public void setId_tipo_aula(long id_tipo_aula) {
        this.id_tipo_aula = id_tipo_aula;
    }

    /**
     * @return the nombre_tipo_aula
     */
    public String getNombre_tipo_aula() {
        return nombre_tipo_aula;
    }

    /**
     * @param nombre_tipo_aula the nombre_tipo_aula to set
     */
    public void setNombre_tipo_aula(String nombre_tipo_aula) {
        this.nombre_tipo_aula = nombre_tipo_aula;
    }

    /**
     * @return the descripcion_tipo_aula
     */
    public String getDescripcion_tipo_aula() {
        return descripcion_tipo_aula;
    }

    /**
     * @param descripcion_tipo_aula the descripcion_tipo_aula to set
     */
    public void setDescripcion_tipo_aula(String descripcion_tipo_aula) {
        this.descripcion_tipo_aula = descripcion_tipo_aula;
    }
    
}
