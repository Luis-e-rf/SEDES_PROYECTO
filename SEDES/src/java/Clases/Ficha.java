/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;


import java.sql.Date;



/**
 *
 * @author ADSI Sena
 */
public class Ficha {
    private long numero_ficha;
    private long id_programa;
    private Date fecha_inicio;
    private Date fecha_fin;
    private String nombre_programa;

    /**
     * @return the numero_ficha
     */
    public long getNumero_ficha() {
        return numero_ficha;
    }

    /**
     * @param numero_ficha the numero_ficha to set
     */
    public void setNumero_ficha(long numero_ficha) {
        this.numero_ficha = numero_ficha;
    }

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
     * @return the fecha_inicio
     */
    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    /**
     * @param fecha_inicio the fecha_inicio to set
     */
    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    /**
     * @return the fecha_fin
     */
    public Date getFecha_fin() {
        return fecha_fin;
    }

    /**
     * @param fecha_fin the fecha_fin to set
     */
    public void setFecha_fin(Date fecha_fin) {
        this.fecha_fin = fecha_fin;
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

    
}

   