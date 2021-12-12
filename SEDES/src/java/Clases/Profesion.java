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
public class Profesion {
    
    private long id_profesion;
    private String nombre_profesion;
    private String descripcion_profesion;

    /**
     * @return the id_profesion
     */
    public long getId_profesion() {
        return id_profesion;
    }

    /**
     * @param id_profesion the id_profesion to set
     */
    public void setId_profesion(long id_profesion) {
        this.id_profesion = id_profesion;
    }

    /**
     * @return the nombre_profesion
     */
    public String getNombre_profesion() {
        return nombre_profesion;
    }

    /**
     * @param nombre_profesion the nombre_profesion to set
     */
    public void setNombre_profesion(String nombre_profesion) {
        this.nombre_profesion = nombre_profesion;
    }

    /**
     * @return the descripcion_profesion
     */
    public String getDescripcion_profesion() {
        return descripcion_profesion;
    }

    /**
     * @param descripcion_profesion the descripcion_profesion to set
     */
    public void setDescripcion_profesion(String descripcion_profesion) {
        this.descripcion_profesion = descripcion_profesion;
    }
    
}
