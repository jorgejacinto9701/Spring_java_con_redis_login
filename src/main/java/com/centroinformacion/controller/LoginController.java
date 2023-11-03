package com.centroinformacion.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.centroinformacion.entity.Opcion;
import com.centroinformacion.entity.Rol;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.UsuarioService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import redis.clients.jedis.Jedis;

import java.lang.reflect.Type;

@Controller
public class LoginController {

	@Autowired
	private UsuarioService servicio;

	
	@PostMapping("/login")
	public String login(Usuario user, HttpSession session, HttpServletRequest request) {
		
		
		Jedis jedis = new Jedis();
		Gson gson = new Gson();
		
		try {
			//---------------------------------------------
			//CACHE ==> DINAMICO
			//---------------------------------------------
		
			Map<String, String> mapsUsuarios  = jedis.hgetAll("usuarios");
			Map<String, String> mapsRoles  = jedis.hgetAll("roles");
			Map<String, String> mapsMenus  = jedis.hgetAll("menus");
			
			if (mapsUsuarios.containsKey(user.getLogin())){
			 	Usuario usuarioRedis =  gson.fromJson(mapsUsuarios.get(user.getLogin()), Usuario.class);
				if (usuarioRedis.getPassword().equals(user.getPassword())) {
					
					Type listRolType = new TypeToken<List<Rol>>() {}.getType();
					Type listOpcionType = new TypeToken<List<Opcion>>() {}.getType();
					
					List<Rol> rolesRedis =  gson.fromJson(mapsRoles.get(user.getLogin()), listRolType);
					List<Opcion> menusRedis =  gson.fromJson(mapsMenus.get(user.getLogin()), listOpcionType);
					
					session.setAttribute("objUsuario", usuarioRedis);
					session.setAttribute("objMenus", menusRedis);
					session.setAttribute("objRoles", rolesRedis);
					
					return "intranetHome";	
				}else {
					request.setAttribute("mensaje", "El usuario no existe");
					return "intranetLogin";
				}
			}else {
				Usuario usuarioMysql = servicio.login(user);
				if (usuarioMysql == null) {
					request.setAttribute("mensaje", "El usuario no existe");
					return "intranetLogin";
				} else {
					List<Rol> roles = servicio.traerRolesDeUsuario(usuarioMysql.getIdUsuario());
					List<Opcion> menus = servicio.traerEnlacesDeUsuario(usuarioMysql.getIdUsuario());
					session.setAttribute("objUsuario", usuarioMysql);
					session.setAttribute("objMenus", menus);
					session.setAttribute("objRoles", roles);
					
					//Se agrega al CACHE el usuario, roles y menus del MYSQL
					mapsUsuarios.put(usuarioMysql.getLogin(), gson.toJson(usuarioMysql));
					jedis.hset("usuarios", mapsUsuarios);
					
					mapsRoles.put(usuarioMysql.getLogin(), gson.toJson(roles));
					jedis.hset("roles", mapsRoles);
					
					mapsMenus.put(usuarioMysql.getLogin(), gson.toJson(usuarioMysql));
					jedis.hset("menus", mapsMenus);
					
					return "intranetHome";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			jedis.close();
		}
		return "intranetLogin";
		
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "intranetLogin";

	}

}
