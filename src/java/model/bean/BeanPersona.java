/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

import java.util.Date;

/**
 *
 * @author Myron Camus
 */
public class BeanPersona {
 
    Integer cmm_persona_ID;
    Integer cod_persona;
    String nombre;
    String apellidos;
    String num_documento;
    String direccion;
    String telefono;
    Date fecha_nacimiento;

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public Integer getCmm_persona_ID() {
        return cmm_persona_ID;
    }

    public void setCmm_persona_ID(Integer cmm_persona_ID) {
        this.cmm_persona_ID = cmm_persona_ID;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setCod_persona(Integer cod_persona) {
        this.cod_persona = cod_persona;
    }

    public Integer getCod_persona() {
        return cod_persona;
    }

    public void setNum_documento(String num_documento) {
        this.num_documento = num_documento;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public String getNum_documento() {
        return num_documento;
    }

    public String getNombre() {
        return nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
}
