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
public class BeanAsignacionUnidad {
    
    Integer asignacion_unidad_ID;
    String cod_asignacion;
    String estado;
    Date fecha;
    String observaciones;
    Date fecha_registro;
    Date fecha_aprobacion;
    Integer tipo_asignacion_ID;
    Integer turno_ID;
    Integer zona_ID;
    Integer cmm_persona_ID;
    String cod_zona;
    Boolean flag_seleccionado = false;
    BeanPersona persona = new BeanPersona();
    
    public Integer getAsignacion_unidad_ID() {
        return asignacion_unidad_ID;
    }

    public void setAsignacion_unidad_ID(Integer asignacion_unidad_ID) {
        this.asignacion_unidad_ID = asignacion_unidad_ID;
    }

    public Integer getCmm_persona_ID() {
        return cmm_persona_ID;
    }

    public void setCmm_persona_ID(Integer cmm_persona_ID) {
        this.cmm_persona_ID = cmm_persona_ID;
    }

    public String getCod_asignacion() {
        return cod_asignacion;
    }

    public void setCod_asignacion(String cod_asignacion) {
        this.cod_asignacion = cod_asignacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getFecha_aprobacion() {
        return fecha_aprobacion;
    }

    public void setFecha_aprobacion(Date fecha_aprobacion) {
        this.fecha_aprobacion = fecha_aprobacion;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Integer getTipo_asignacion_ID() {
        return tipo_asignacion_ID;
    }

    public void setTipo_asignacion_ID(Integer tipo_asignacion_ID) {
        this.tipo_asignacion_ID = tipo_asignacion_ID;
    }

    public Integer getTurno_ID() {
        return turno_ID;
    }

    public void setTurno_ID(Integer turno_ID) {
        this.turno_ID = turno_ID;
    }

    public Integer getZona_ID() {
        return zona_ID;
    }

    public void setZona_ID(Integer zona_ID) {
        this.zona_ID = zona_ID;
    }

    public BeanPersona getPersona() {
        return persona;
    }

    public void setPersona(BeanPersona persona) {
        this.persona = persona;
    }

    public void setCod_zona(String cod_zona) {
        this.cod_zona = cod_zona;
    }

    public String getCod_zona() {
        return cod_zona;
    }

    public Boolean getFlag_seleccionado() {
        return flag_seleccionado;
    }

    public void setFlag_seleccionado(Boolean flag_seleccionado) {
        this.flag_seleccionado = flag_seleccionado;
    }

}
