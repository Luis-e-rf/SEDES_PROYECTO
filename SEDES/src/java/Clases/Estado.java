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
public class Estado {
    private long Id_Estado;
    private String Nombre_Estado;
    private String Observaciones_Estado;

    /**
     * @return the Id_Estado
     */
    public long getId_Estado() {
        return Id_Estado;
    }

    /**
     * @param Id_Estado the Id_Estado to set
     */
    public void setId_Estado(long Id_Estado) {
        this.Id_Estado = Id_Estado;
    }

    /**
     * @return the Nombre_Estado
     */
    public String getNombre_Estado() {
        return Nombre_Estado;
    }

    /**
     * @param Nombre_Estado the Nombre_Estado to set
     */
    public void setNombre_Estado(String Nombre_Estado) {
        this.Nombre_Estado = Nombre_Estado;
    }

    /**
     * @return the Observaciones_Estado
     */
    public String getObservaciones_Estado() {
        return Observaciones_Estado;
    }

    /**
     * @param Observaciones_Estado the Observaciones_Estado to set
     */
    public void setObservaciones_Estado(String Observaciones_Estado) {
        this.Observaciones_Estado = Observaciones_Estado;
    }

}
