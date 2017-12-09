package model.bean;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author Ronald Taipe
 */

@Entity
@Table(name="incidente")
public class Incidente implements Serializable {
    
    @Id
    @Column(name = "incidente_ID", nullable = false)
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SQ_incidente")
    @SequenceGenerator(name="SQ_incidente", sequenceName="SQ_incidente", allocationSize = 20)
    private Integer incidente_id;
    
    @Column(name = "cod_incidente", nullable = false, length = 255)
    private String cod_incidente;
    
    @Column(name = "estado", nullable = false, length = 255)
    private String estado;
    
    @Column(name = "fecha", nullable = false)
    private Date fecha;
    
    @Column(name = "descripcion", nullable = false, length = 255)
    private String descripcion;
    
    @Column(name = "observaciones", nullable = false, length = 255)
    private String observaciones;
    
    @Column(name = "fecha_cierre", nullable = false)
    private Date fecha_cierre;
    
    @Column(name = "fecha_actualizacion", nullable = false)
    private Date fecha_actualizacion;
    
    @Column(name = "direccion", nullable = false, length = 255)
    private String direccion;
    
    @Column(name = "tipo_incidente_ID", nullable = false)
    private Integer tipo_incidente_ID;
    
    @Column(name = "cmm_persona_ID", nullable = false)
    private Integer cmm_persona_ID;
    
    @Column(name = "cmm_empleado_cmm_persona_ID", nullable = false)
    private Integer cmm_empleado_cmm_persona_ID;

    public Incidente() {
    }

    public Incidente(Integer incidente_id, String cod_incidente, String estado, Date fecha, String descripcion, String observaciones, Date fecha_cierre, Date fecha_actualizacion, String direccion, Integer tipo_incidente_ID, Integer cmm_persona_ID, Integer cmm_empleado_cmm_persona_ID) {
        this.incidente_id = incidente_id;
        this.cod_incidente = cod_incidente;
        this.estado = estado;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.observaciones = observaciones;
        this.fecha_cierre = fecha_cierre;
        this.fecha_actualizacion = fecha_actualizacion;
        this.direccion = direccion;
        this.tipo_incidente_ID = tipo_incidente_ID;
        this.cmm_persona_ID = cmm_persona_ID;
        this.cmm_empleado_cmm_persona_ID = cmm_empleado_cmm_persona_ID;
    }

    public Integer getIncidente_id() {
        return incidente_id;
    }

    public void setIncidente_id(Integer incidente_id) {
        this.incidente_id = incidente_id;
    }

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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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

    public Integer getCmm_empleado_cmm_persona_ID() {
        return cmm_empleado_cmm_persona_ID;
    }

    public void setCmm_empleado_cmm_persona_ID(Integer cmm_empleado_cmm_persona_ID) {
        this.cmm_empleado_cmm_persona_ID = cmm_empleado_cmm_persona_ID;
    }

    @Override
    public String toString() {
        return "Incidente{" + "incidente_id=" + incidente_id + ", cod_incidente=" + cod_incidente + ", estado=" + estado + ", fecha=" + fecha + ", descripcion=" + descripcion + ", observaciones=" + observaciones + ", fecha_cierre=" + fecha_cierre + ", fecha_actualizacion=" + fecha_actualizacion + ", direccion=" + direccion + ", tipo_incidente_ID=" + tipo_incidente_ID + ", cmm_persona_ID=" + cmm_persona_ID + ", cmm_empleado_cmm_persona_ID=" + cmm_empleado_cmm_persona_ID + '}';
    }
        
        
        
}
