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
public class Elementos {
    private long Id_Elemento;
    private long Id_Tipo_Elemento;
    private long Id_Tipo_Inventario;
    private long  id_Marca;    
    private long Id_Estado;
    private String Nombre_Elemento;
    private String Descripcion_Elemento;

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
     * @return the Id_Tipo_Elemento
     */
    public long getId_Tipo_Elemento() {
        return Id_Tipo_Elemento;
    }

    /**
     * @param Id_Tipo_Elemento the Id_Tipo_Elemento to set
     */
    public void setId_Tipo_Elemento(long Id_Tipo_Elemento) {
        this.Id_Tipo_Elemento = Id_Tipo_Elemento;
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

    /**
     * @return the id_Marca
     */
    public long getId_Marca() {
        return id_Marca;
    }

    /**
     * @param id_Marca the id_Marca to set
     */
    public void setId_Marca(long id_Marca) {
        this.id_Marca = id_Marca;
    }

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
     * @return the Nombre_Elemento
     */
    public String getNombre_Elemento() {
        return Nombre_Elemento;
    }

    /**
     * @param Nombre_Elemento the Nombre_Elemento to set
     */
    public void setNombre_Elemento(String Nombre_Elemento) {
        this.Nombre_Elemento = Nombre_Elemento;
    }

    /**
     * @return the Descripcion_Elemento
     */
    public String getDescripcion_Elemento() {
        return Descripcion_Elemento;
    }

    /**
     * @param Descripcion_Elemento the Descripcion_Elemento to set
     */
    public void setDescripcion_Elemento(String Descripcion_Elemento) {
        this.Descripcion_Elemento = Descripcion_Elemento;
    }

    

}