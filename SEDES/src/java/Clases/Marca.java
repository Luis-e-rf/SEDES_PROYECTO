/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author Diego
 */
public class Marca {
    
    private long idMarca;
    private String Nombre_Marca;
    private String Descripcion_Marca;

    /**
     * @return the idMarca
     */
    public long getIdMarca() {
        return idMarca;
    }

    /**
     * @param idMarca the idMarca to set
     */
    public void setIdMarca(long idMarca) {
        this.idMarca = idMarca;
    }

    /**
     * @return the Nombre_Marca
     */
    public String getNombre_Marca() {
        return Nombre_Marca;
    }

    /**
     * @param Nombre_Marca the Nombre_Marca to set
     */
    public void setNombre_Marca(String Nombre_Marca) {
        this.Nombre_Marca = Nombre_Marca;
    }

    /**
     * @return the Descripcion_Marca
     */
    public String getDescripcion_Marca() {
        return Descripcion_Marca;
    }

    /**
     * @param Descripcion_Marca the Descripcion_Marca to set
     */
    public void setDescripcion_Marca(String Descripcion_Marca) {
        this.Descripcion_Marca = Descripcion_Marca;
    }

    
}