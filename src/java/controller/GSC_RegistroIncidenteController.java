/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Myron Camus
 */
@Controller
public class GSC_RegistroIncidenteController {
    
    @RequestMapping(value = "frm_RegistroIncidente")  
    public String mant_registroIncidente(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //List<BeanEstudioPIP> list = estudiopipdao.getEstudiosPIP();
        //BeanEstudioPIP estudiopip = new BeanEstudioPIP();
        //model.addAttribute("estudiopip", estudiopip);
        //model.addAttribute("list", list);        

        return "GSC/frm_RegistroIncidente";
    }
}
