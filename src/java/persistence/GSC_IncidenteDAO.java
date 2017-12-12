/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.List;
import model.bean.BeanAsignacionUnidad;
import model.bean.BeanIncidente;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Myron Camus
 */
public class GSC_IncidenteDAO {
    
    JdbcTemplate template;
    
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    
    public List<BeanIncidente> buscarIncidente(BeanIncidente busquedaIncidente) {

        String query = " select inc.incidente_ID, inc.cod_incidente, inc.fecha, inc.telefono, inc.nombre, inc.apellidos, inc.tipo_incidente_ID, inc.estado" +
                              " from db_seguridad_ciudadana.incidente inc WHERE incidente_ID > 0 ";
        if(busquedaIncidente.getTelefono() != null && !busquedaIncidente.getTelefono().isEmpty()){
            query += " AND inc.telefono = '"+busquedaIncidente.getTelefono()+"'";
        }
        
        if(busquedaIncidente.getEstado() != null && !busquedaIncidente.getEstado().isEmpty()){
            query += " AND inc.estado = '"+busquedaIncidente.getEstado()+"'";
        }
        
        if(busquedaIncidente.getFechaStr() != null && !busquedaIncidente.getFechaStr().isEmpty()){
            query += " AND inc.fecha = '"+busquedaIncidente.getFechaStr()+"'";
        }
        
        query += " ORDER BY inc.fecha";
        
        System.out.println("query:: "+query);
        
        return template.query(query, new RowMapper<BeanIncidente>() {
            public BeanIncidente mapRow(ResultSet rs, int row) throws SQLException {
                BeanIncidente e = new BeanIncidente();
                e.setIncidente_ID(rs.getInt(1));
                e.setCod_incidente(rs.getString(2));
                e.setFecha(rs.getDate(3));
                e.setTelefono(rs.getString(4));
                e.setNombres(rs.getString(5));
                e.setApellidos(rs.getString(6));
                e.setTipo_incidente_ID(rs.getInt(7));
                e.setEstado(rs.getString(8));
                return e;
            }
        });
    }
    
    public int save(BeanIncidente p) throws DuplicateKeyException{
        //SimpleDateFormat d = new SimpleDateFormat("dd-MM-yyyy");
        Integer id = 0;
        String query = "SELECT max(incidente_ID) from db_seguridad_ciudadana.incidente";
        id = template.queryForObject(query, null, Integer.class);
        
        if(id > 0){
            id = id + 1;
        }
        p.setIncidente_ID(id);
        p.setCod_incidente("INC-00"+id);
        
        String sql = "INSERT INTO db_seguridad_ciudadana.incidente(incidente_ID, cod_incidente, estado, "+
                " fecha, observaciones, fecha_cierre, fecha_actualizacion, nombre, apellidos, telefono, "+
                " direccion, tipo_documento_ID, numero_documento, email, tipo_incidente_ID, cmm_persona_ID) "
                + " values('" + p.getIncidente_ID()+ "', "
                + "        '" + p.getCod_incidente()+ "', "
                + "        '" + p.getEstado()+ "', "
                + "        '" + p.getFechaStr()+ "', "
                + "        '" + ((p.getObservaciones() != null && p.getObservaciones() != "null") ? p.getObservaciones() : "")+ "', "
                + "        '" + p.getFechaStr()+ "', "
                + "        '" + p.getFechaStr()+ "', "
                + "        '" + p.getNombres()+ "', "
                + "        '" + p.getApellidos()+ "', "
                + "        '" + p.getTelefono()+ "', "
                + "        '" + p.getDireccion()+ "', "
                + "        " + p.getTipo_documento_ID()+ ", "
                + "        '" + ((p.getNumero_documento() != null && p.getNumero_documento() != "null") ? p.getNumero_documento() : "")+ "', "
                + "        '" + p.getEmail()+ "', "
                + "        '" + p.getTipo_incidente_ID()+ "', "
                + "        '1' ); ";
        
        System.out.println(sql);
        
        return template.update(sql);
    }
    
    public List<BeanAsignacionUnidad> buscarUnidadesAsignadas(BeanAsignacionUnidad busquedaIncidente) {

        String query = " select au.asignacion_unidad_ID, au.cod_asignacion, au.estado, p.nombre, p.apellidos, p.telefono, z.cod_zona" +
                              " from db_seguridad_ciudadana.asignacion_unidad au "+
                              " LEFT JOIN db_seguridad_ciudadana.cmm_persona p ON p.cmm_persona_ID = au.cmm_persona_ID "+
                              " LEFT JOIN db_seguridad_ciudadana.zona z ON z.zona_ID = au.zona_ID ";
        
        query += " ORDER BY au.asignacion_unidad_ID";
        
        System.out.println("query:: "+query);
        
        return template.query(query, new RowMapper<BeanAsignacionUnidad>() {
            public BeanAsignacionUnidad mapRow(ResultSet rs, int row) throws SQLException {
                BeanAsignacionUnidad e = new BeanAsignacionUnidad();
                e.setAsignacion_unidad_ID(rs.getInt(1));
                e.setCod_asignacion(rs.getString(2));
                e.setEstado(rs.getString(3));
                e.getPersona().setNombre(rs.getString(4));
                e.getPersona().setApellidos(rs.getString(5));
                e.getPersona().setTelefono(rs.getString(6));
                e.setCod_zona(rs.getString(7));
                return e;
            }
        });
    }
    
}
