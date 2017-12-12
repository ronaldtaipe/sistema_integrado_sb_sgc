/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import model.bean.BeanAsignacionUnidad;
import model.bean.BeanIncidente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import persistence.GSC_IncidenteDAO;

/**
 *
 * @author Myron Camus
 */

@Controller
public class GSC_AtencionIncidenteController extends HttpServlet {
    
    @Autowired
    GSC_IncidenteDAO incidenteDAO;
    
    @RequestMapping(value = "frm_AtencionIncidente")  
    public String mant_atencionIncidente(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BeanIncidente objIncidente = new BeanIncidente();
        List<BeanIncidente> list = incidenteDAO.buscarIncidente(objIncidente);
     
        model.addAttribute("busquedaincidente",objIncidente);
        model.addAttribute("listIncidente", list);
        
        return "GSC/frm_AtencionIncidente";
    }
    
    @RequestMapping(value = "frm_RegistroIncidente")  
    public String initRegistroIncidente(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BeanIncidente objIncidente = new BeanIncidente();
        BeanAsignacionUnidad objAsignacionUnidad = new BeanAsignacionUnidad();
        
        List<BeanAsignacionUnidad> listUnidades = incidenteDAO.buscarUnidadesAsignadas(objAsignacionUnidad);

        if(listUnidades != null && listUnidades.size() > 0){
            model.addAttribute("lstUnidades", listUnidades);
            model.addAttribute("countUnidades", listUnidades.size());
        }
        
        model.addAttribute("incidente", objIncidente);        
        model.addAttribute("neworupdate", "new");
        
        return "GSC/frm_RegistroIncidente";
    }
    
    @RequestMapping(value = "/buscarIncidente", method = RequestMethod.POST)  
    public String buscarIncidente(@ModelAttribute("busquedapip") BeanIncidente busquedaincidente,
                                   BindingResult result, Model model)  {

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        
        if(!busquedaincidente.getEstado().equals("0")){
            if(busquedaincidente.getEstado().equals("1")){
                busquedaincidente.setEstado("En Proceso");
            }else{
                if(busquedaincidente.getEstado().equals("2")){
                    busquedaincidente.setEstado("Atendido");
                }else{
                    if(busquedaincidente.getEstado().equals("3")){
                        busquedaincidente.setEstado("Rechazado"); 
                    }else{
                        busquedaincidente.setEstado(null);
                    }
                }
            }
        }else{
            busquedaincidente.setEstado(null);
        }
        
        List<BeanIncidente> list = incidenteDAO.buscarIncidente(busquedaincidente);
 
        model.addAttribute("busquedaincidente", busquedaincidente);
        
        if(list != null && list.size()>0){
            model.addAttribute("listIncidente", list);   
        }

        return "GSC/frm_AtencionIncidente";
    }  
    
    @RequestMapping(value = "/saveIncidente", method = RequestMethod.POST)  
    public String saveIncidente(@ModelAttribute("incidente") @Valid BeanIncidente incidente,
                                        BindingResult result, Model model, RedirectAttributes redir) throws ServletException, IOException {
  
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");//dd/MM/yyyy
        Date now = new Date();
        String strDate = sdfDate.format(now);
        
        if (result.hasErrors()) {
            model.addAttribute("errorINC", "Faltan llenar datos obligatorios. Por favor verifique");
            
            return "GSC/frm_RegistroIncidente";
        }else{
            
            incidente.setFechaStr(strDate);
            incidente.setCmm_persona_ID(1);
            incidente.setEstado("En Proceso");
            System.out.println("incidente.getLstIdUnidades()::"+incidente.getLstIdUnidades());
            String ids = incidente.getLstIdUnidades();
            String[] idUnidades = ids.split(","); 
            
            for (String id : idUnidades) {
                System.out.println(id);
             }
            
            incidenteDAO.save(incidente);
            
            redir.addFlashAttribute("successINC", "Registro grabado correctamente.");
            return "redirect:/frm_AtencionIncidente.html";  
        }   
    }
    
    @RequestMapping(value = "/cancelIncidente", method = RequestMethod.GET)
    public String cancelIncidente() {
        return "redirect:/frm_AtencionIncidente.html";
    }
    
    @RequestMapping(value = "/getUnidadByZona", method = RequestMethod.GET)
    public String getUnidadByZona(){
        
        
        return "Hola";
    }
    
    @ExceptionHandler({IOException.class, java.sql.SQLException.class, CannotGetJdbcConnectionException.class})
    public ModelAndView handleIOException(Exception ex) {
        ModelAndView model = new ModelAndView("IOError");
 
        model.addObject("exception", ex.getMessage());
         
        return model;
    } 
}
