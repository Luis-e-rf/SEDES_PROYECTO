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
public class TipoInventario {
    
    private long Id_Tipo_Inventario;
    private String Nombre_Tipo_Inventario;
    private String Descripcion_Tipo_Inventario;

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

    /**
     * @return the Nombre_Tipo_Inventario
     */
    public String getNombre_Tipo_Inventario() {
        return Nombre_Tipo_Inventario;
    }

    /**
     * @param Nombre_Tipo_Inventario the Nombre_Tipo_Inventario to set
     */
    public void setNombre_Tipo_Inventario(String Nombre_Tipo_Inventario) {
        this.Nombre_Tipo_Inventario = Nombre_Tipo_Inventario;
    }

    /**
     * @return the Descripcion_Tipo_Inventario
     */
    public String getDescripcion_Tipo_Inventario() {
        return Descripcion_Tipo_Inventario;
    }

    /**
     * @param Descripcion_Tipo_Inventario the Descripcion_Tipo_Inventario to set
     */
    public void setDescripcion_Tipo_Inventario(String Descripcion_Tipo_Inventario) {
        this.Descripcion_Tipo_Inventario = Descripcion_Tipo_Inventario;
    }
    
}
