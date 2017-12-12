/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Myron Camus
 */
public class BeanCiudadano {
    
    Integer cmm_persona_ID;
    String cod_ciudadano;
    String nombres;
    String apellidos;
    @NotEmpty
    String telefono;
    String correo;
    String direccion;

    public Integer getCmm_persona_ID() {
        return cmm_persona_ID;
    }

    public void setCmm_persona_ID(Integer cmm_persona_ID) {
        this.cmm_persona_ID = cmm_persona_ID;
    }

    public String getCod_ciudadano() {
        return cod_ciudadano;
    }

    public void setCod_ciudadano(String cod_ciudadano) {
        this.cod_ciudadano = cod_ciudadano;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    
    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
}
