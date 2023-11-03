package com.centroinformacion.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Usuario;
import com.centroinformacion.entity.UsuarioHasRol;
import com.centroinformacion.entity.UsuarioHasRolPK;
import com.centroinformacion.repository.UsuarioHasRolRepositorio;
import com.centroinformacion.service.UsuarioService;
import com.centroinformacion.util.AppSettings;


@Controller 
public class UsuarioCrudController {

	@Autowired
	private UsuarioService alumnoService;
	
	@Autowired
	private UsuarioHasRolRepositorio usuarioHasRolRepositorio;
	
	
	@ResponseBody
	@GetMapping(value = "/consultaCrudUsuario")
	public List<Usuario> consulta(String filtro){
		return alumnoService.listaPorNombreApellidoLike("%" + filtro + "%");
	}
			
		
	@PostMapping("/registraCrudUsuario")
	@ResponseBody
	public Map<?, ?> registra(Usuario obj) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		obj.setEstado(AppSettings.ACTIVO);
		Usuario objSalida = alumnoService.insertaUsuario(obj);
		
		UsuarioHasRolPK pk = new UsuarioHasRolPK();
		pk.setIdUsuario(objSalida.getIdUsuario());
		pk.setIdRol(2);

		UsuarioHasRol objUsuRol = new UsuarioHasRol();
		objUsuRol.setUsuarioHasRolPk(pk);

		usuarioHasRolRepositorio.save(objUsuRol);
		
		List<Usuario> lista = alumnoService.listaPorNombreApellidoLike("%");
		map.put("lista", lista);
		map.put("mensaje", "Registro exitoso");
		return map;
	}
	

	
	

}
