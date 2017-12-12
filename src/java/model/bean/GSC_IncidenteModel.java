/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author Myron Camus
 */
@Entity
@Table(name = "incidente", uniqueConstraints = @UniqueConstraint
        (columnNames = "cod_incidente"))
public class GSC_IncidenteModel implements java.io.Serializable{

    private Integer idIncidente;
    private String estado;
    private Date fechaIncidente;
    private String descripcion;
    private String observacion;
    private String direccion;
    private String nroTelefono;
    
    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SQ_t_incidente")
    @Column(name = "incidente_ID", unique = true, nullable = false, precision = 12, scale = 0)
    @SequenceGenerator(
	name="SQ_t_incidente",
	sequenceName="SQ_t_incidente",
	allocationSize=20
    )
    
    public Integer getIdIncidente() {
	return this.idIncidente;
    }

    public void setIdIncidente(Integer idIncidente) {
	this.idIncidente = idIncidente;
    }

    @Column(name = "estado")
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Column(name = "descripcion")
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Column(name = "direccion")
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "fecha", length = 7)
    public Date getFechaIncidente() {
        return fechaIncidente;
    }

    public void setFechaIncidente(Date fechaIncidente) {
        this.fechaIncidente = fechaIncidente;
    }

    @Column(name = "observaciones")
    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String getNroTelefono() {
        return nroTelefono;
    }

    public void setNroTelefono(String nroTelefono) {
        this.nroTelefono = nroTelefono;
    }
 
}
