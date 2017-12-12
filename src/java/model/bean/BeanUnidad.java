/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

/**
 *
 * @author Myron Camus
 */
public class BeanUnidad {
    
    Integer unidad_ID;
    Integer persona_ID;
    String nombre;
    String descripcion;
    String tipo_unidad;

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getPersona_ID() {
        return persona_ID;
    }

    public void setPersona_ID(Integer persona_ID) {
        this.persona_ID = persona_ID;
    }

    public String getTipo_unidad() {
        return tipo_unidad;
    }

    public void setTipo_unidad(String tipo_unidad) {
        this.tipo_unidad = tipo_unidad;
    }

    public Integer getUnidad_ID() {
        return unidad_ID;
    }

    public void setUnidad_ID(Integer unidad_ID) {
        this.unidad_ID = unidad_ID;
    }    
    
}
