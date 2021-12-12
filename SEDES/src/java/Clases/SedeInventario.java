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
public class SedeInventario {
    private long Id_Sede_Inventario;
    private long Id_sede;
    private long Id_Tipo_Inventario;

    /**
     * @return the Id_Sede_Inventario
     */
    public long getId_Sede_Inventario() {
        return Id_Sede_Inventario;
    }

    /**
     * @param Id_Sede_Inventario the Id_Sede_Inventario to set
     */
    public void setId_Sede_Inventario(long Id_Sede_Inventario) {
        this.Id_Sede_Inventario = Id_Sede_Inventario;
    }

    /**
     * @return the Id_sede
     */
    public long getId_sede() {
        return Id_sede;
    }

    /**
     * @param Id_sede the Id_sede to set
     */
    public void setId_sede(long Id_sede) {
        this.Id_sede = Id_sede;
    }

    /**
     * @return the Id_Tipo_Inventario
     */
    public long getId_Tipo_Inventario() {
        return Id_Tipo_Inventario;
    }

    /**
     * @param Id_Tipo_Inventario the Id_Tipo_Inventario to set
     */
    public void setId_Tipo_Inventario(long Id_Tipo_Inventario) {
        this.Id_Tipo_Inventario = Id_Tipo_Inventario;
    }
}
