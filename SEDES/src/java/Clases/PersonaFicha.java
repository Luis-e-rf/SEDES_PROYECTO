/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author ADSI SENA
 */
public class PersonaFicha 

{
  private long id_Persona_ficha;
  private long numero_ficha;
  private long documento_Persona;

    /**
     * @return the id_Persona_ficha
     */
    public long getId_Persona_ficha() {
        return id_Persona_ficha;
    }

    /**
     * @param id_Persona_ficha the id_Persona_ficha to set
     */
    public void setId_Persona_ficha(long id_Persona_ficha) {
        this.id_Persona_ficha = id_Persona_ficha;
    }

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
}