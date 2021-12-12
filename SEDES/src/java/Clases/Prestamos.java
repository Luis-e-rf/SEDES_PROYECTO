/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Time;
import java.util.Date;

/**
 *
 * @author ADSI SENA
 */
public class Prestamos
{
   private long Id_Prestamos;
   private long documento_Persona;
   private long Id_Elemento;
   private Date Fecha_Prestamos;
   private Time Hora_Prestamos;
   private Date Fecha_Entrega;
   private Time Hora_entrega;
   private String Observaciones;

    /**
     * @return the Id_Prestamos
     */
    public long getId_Prestamos() {
        return Id_Prestamos;
    }

    /**
     * @param Id_Prestamos the Id_Prestamos to set
     */
    public void setId_Prestamos(long Id_Prestamos) {
        this.Id_Prestamos = Id_Prestamos;
    }

    /**
     * @return the documento_Persona
     */
    public long getDocumento_Persona() {
        return documento_Persona;
    }

    /**
     * @param documento_Persona the documento_Persona to set
     */
    public void setDocumento_Persona(long documento_Persona) {
        this.documento_Persona = documento_Persona;
    }

    /**
     * @return the Id_Elemento
     */
    public long getId_Elemento() {
        return Id_Elemento;
    }

    /**
     * @param Id_Elemento the Id_Elemento to set
     */
    public void setId_Elemento(long Id_Elemento) {
        this.Id_Elemento = Id_Elemento;
    }

    /**
     * @return the Fecha_Prestamos
     */
    public Date getFecha_Prestamos() {
        return Fecha_Prestamos;
    }

    /**
     * @param Fecha_Prestamos the Fecha_Prestamos to set
     */
    public void setFecha_Prestamos(Date Fecha_Prestamos) {
        this.Fecha_Prestamos = Fecha_Prestamos;
    }

    /**
     * @return the Hora_Prestamos
     */
    public Time getHora_Prestamos() {
        return Hora_Prestamos;
    }

    /**
     * @param Hora_Prestamos the Hora_Prestamos to set
     */
    public void setHora_Prestamos(Time Hora_Prestamos) {
        this.Hora_Prestamos = Hora_Prestamos;
    }

    /**
     * @return the Fecha_Entrega
     */
    public Date getFecha_Entrega() {
        return Fecha_Entrega;
    }

    /**
     * @param Fecha_Entrega the Fecha_Entrega to set
     */
    public void setFecha_Entrega(Date Fecha_Entrega) {
        this.Fecha_Entrega = Fecha_Entrega;
    }

    /**
     * @return the Hora_entrega
     */
    public Time getHora_entrega() {
        return Hora_entrega;
    }

    /**
     * @param Hora_entrega the Hora_entrega to set
     */
    public void setHora_entrega(Time Hora_entrega) {
        this.Hora_entrega = Hora_entrega;
    }

    /**
     * @return the Observaciones
     */
    public String getObservaciones() {
        return Observaciones;
    }

    /**
     * @param Observaciones the Observaciones to set
     */
    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }

    
}
