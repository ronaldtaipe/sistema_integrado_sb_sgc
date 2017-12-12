package model.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Myron Camus
 */

public class BeanIncidente{
    
    Integer incidente_ID;
    String cod_incidente;
    String estado;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date fecha;
    String observaciones;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date fecha_cierre;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date fecha_actualizacion;
    @NotEmpty
    String direccion;
    @NotEmpty
    String nombres;
    @NotEmpty
    String apellidos;
    @NotEmpty
    String telefono;
    String email;
    String numero_documento;
    Integer tipo_incidente_ID;
    Integer tipo_documento_ID;
    Integer cmm_persona_ID;
    String fechaStr;
    String lstIdUnidades;
    List<BeanAsignacionUnidad> lstUnidadesAsignadas = new ArrayList<BeanAsignacionUnidad>();

    public String getCod_incidente() {
        return cod_incidente;
    }

    public void setCod_incidente(String cod_incidente) {
        this.cod_incidente = cod_incidente;
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

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Date getFecha_cierre() {
        return fecha_cierre;
    }

    public void setFecha_cierre(Date fecha_cierre) {
        this.fecha_cierre = fecha_cierre;
    }

    public Date getFecha_actualizacion() {
        return fecha_actualizacion;
    }

    public void setFecha_actualizacion(Date fecha_actualizacion) {
        this.fecha_actualizacion = fecha_actualizacion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Integer getTipo_incidente_ID() {
        return tipo_incidente_ID;
    }

    public void setTipo_incidente_ID(Integer tipo_incidente_ID) {
        this.tipo_incidente_ID = tipo_incidente_ID;
    }

    public Integer getCmm_persona_ID() {
        return cmm_persona_ID;
    }

    public void setCmm_persona_ID(Integer cmm_persona_ID) {
        this.cmm_persona_ID = cmm_persona_ID;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEmail() {
        return email;
    }

    public Integer getIncidente_ID() {
        return incidente_ID;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setIncidente_ID(Integer incidente_ID) {
        this.incidente_ID = incidente_ID;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getNumero_documento() {
        return numero_documento;
    }

    public void setNumero_documento(String numero_documento) {
        this.numero_documento = numero_documento;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Integer getTipo_documento_ID() {
        return tipo_documento_ID;
    }

    public void setTipo_documento_ID(Integer tipo_documento_ID) {
        this.tipo_documento_ID = tipo_documento_ID;
    }

    public String getFechaStr() {
        return fechaStr;
    }

    public void setFechaStr(String fechaStr) {
        this.fechaStr = fechaStr;
    }

    public List<BeanAsignacionUnidad> getLstUnidadesAsignadas() {
        return lstUnidadesAsignadas;
    }

    public void setLstUnidadesAsignadas(List<BeanAsignacionUnidad> lstUnidadesAsignadas) {
        this.lstUnidadesAsignadas = lstUnidadesAsignadas;
    }

    public String getLstIdUnidades() {
        return lstIdUnidades;
    }

    public void setLstIdUnidades(String lstIdUnidades) {
        this.lstIdUnidades = lstIdUnidades;
    }
    
}
