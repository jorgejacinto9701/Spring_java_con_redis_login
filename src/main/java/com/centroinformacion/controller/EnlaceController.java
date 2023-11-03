package com.centroinformacion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class EnlaceController {

	//Login
	@GetMapping("/")
	public String verLogin() {	return "intranetLogin";  }
	
	@GetMapping("/verIntranetHome")
	public String verIntranetHome() {	return "intranetHome";  }

	//Matenimiento
	@GetMapping("/verMatenimientoAlumno")
	public String verMatenimientoAlumno() {	return "intranetMatenimientoAlumno";	}

	@GetMapping("/verMatenimientoLibro")
	public String verMatenimientoLibro() {	return "intranetMatenimientoLibro";	}

	@GetMapping("/verMatenimientoUsuario")
	public String verMatenimientoUsuario() {	return "intranetMatenimientoUsuario";	}


}
