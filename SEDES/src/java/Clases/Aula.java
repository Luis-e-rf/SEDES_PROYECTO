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
public class Aula {
    private long id_aula;
    private long id_tipo_aula;
    private long id_sede;
    private String nombre_aula;
    private String observaciones_aula;
    private String nombre_sede;
    private String nombre_tipo_aula;

    /**
     * @return the id_aula
     */
    public long getId_aula() {
        return id_aula;
    }

    /**
     * @param id_aula the id_aula to set
     */
    public void setId_aula(long id_aula) {
        this.id_aula = id_aula;
    }

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
     * @return the id_sede
     */
    public long getId_sede() {
        return id_sede;
    }

    /**
     * @param id_sede the id_sede to set
     */
    public void setId_sede(long id_sede) {
        this.id_sede = id_sede;
    }

    /**
     * @return the nombre_aula
     */
    public String getNombre_aula() {
        return nombre_aula;
    }

    /**
     * @param nombre_aula the nombre_aula to set
     */
    public void setNombre_aula(String nombre_aula) {
        this.nombre_aula = nombre_aula;
    }

    /**
     * @return the observaciones_aula
     */
    public String getObservaciones_aula() {
        return observaciones_aula;
    }

    /**
     * @param observaciones_aula the observaciones_aula to set
     */
    public void setObservaciones_aula(String observaciones_aula) {
        this.observaciones_aula = observaciones_aula;
    }

    /**
     * @return the nombre_sede
     */
    public String getNombre_sede() {
        return nombre_sede;
    }

    /**
     * @param nombre_sede the nombre_sede to set
     */
    public void setNombre_sede(String nombre_sede) {
        this.nombre_sede = nombre_sede;
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
   
}