package com.robot.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.IOException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.Date;

@Controller
public class HelloController{

    protected final Log logger = LogFactory.getLog(getClass());

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String now = (new Date()).toString();
        logger.info("Returning hello view with " + now);

        return new ModelAndView("hello", "now", now);
    }
    
    @RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
    public String homePage(ModelMap model){
    	model.addAttribute("user", getPrincipal());
    	return "welcome";
    }
    
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(ModelMap model){
    	model.addAttribute("user", getPrincipal());
    	return "admin";
    }
    
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model){
    	model.addAttribute("user", getPrincipal());
    	return "redirect:/home?accessDenied";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(ModelMap model){
    	return "login";
    }
    
    @RequestMapping(value="/logout", method = RequestMethod.POST)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response){
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	if (auth != null){
    		new SecurityContextLogoutHandler().logout(request, response, auth);
    	}
    	return "redirect:/login?logout";
    }

    private String getPrincipal(){
    	String userName = null;
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	
    	if (principal instanceof UserDetails){
    		userName = ((UserDetails)principal).getUsername();
    	}
    	else{
    		userName = principal.toString();
    	}
    	return userName;
    }

}