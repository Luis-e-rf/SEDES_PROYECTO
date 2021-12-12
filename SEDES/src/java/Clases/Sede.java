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
public class Sede {
    
    private long id_sede;
    private String nombre_sede;
    private String Horario_sede;
    private String observaciones_sede;

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
     * @return the Horario_sede
     */
    public String getHorario_sede() {
        return Horario_sede;
    }

    /**
     * @param Horario_sede the Horario_sede to set
     */
    public void setHorario_sede(String Horario_sede) {
        this.Horario_sede = Horario_sede;
    }

    /**
     * @return the observaciones_sede
     */
    public String getObservaciones_sede() {
        return observaciones_sede;
    }

    /**
     * @param observaciones_sede the observaciones_sede to set
     */
    public void setObservaciones_sede(String observaciones_sede) {
        this.observaciones_sede = observaciones_sede;
    }

}
