package model.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 *
 * @author Ronald Taipe
 */

@Entity
@Table(name="atencion_incidente")
public class AtencionIncidente implements Serializable {
    
    @Column(name = "incidente_ID", nullable = false)
    private Integer incidente_ID;
    
    @Column(name = "unidad_ID", nullable = false)        
    private Integer unidad_ID;
    
    @Column(name = "observacion", nullable = false, length = 255)
    private String observacion;

    public AtencionIncidente() {
    }

    public AtencionIncidente(Integer incidente_ID, Integer unidad_ID, String observacion) {
        this.incidente_ID = incidente_ID;
        this.unidad_ID = unidad_ID;
        this.observacion = observacion;
    }

    public Integer getIncidente_ID() {
        return incidente_ID;
    }

    public void setIncidente_ID(Integer incidente_ID) {
        this.incidente_ID = incidente_ID;
    }

    public Integer getUnidad_ID() {
        return unidad_ID;
    }

    public void setUnidad_ID(Integer unidad_ID) {
        this.unidad_ID = unidad_ID;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    @Override
    public String toString() {
        return "AtencionIncidente{" + "incidente_ID=" + incidente_ID + ", unidad_ID=" + unidad_ID + ", observacion=" + observacion + '}';
    }
    
    
    
    
}
