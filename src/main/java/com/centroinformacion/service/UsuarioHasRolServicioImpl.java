package com.centroinformacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.UsuarioHasRol;
import com.centroinformacion.repository.UsuarioHasRolRepositorio;

@Service
public class UsuarioHasRolServicioImpl implements UsuarioHasRolServicio {

	@Autowired
	private UsuarioHasRolRepositorio repository;

	@Override
	public UsuarioHasRol inserta(UsuarioHasRol obj) {
		return repository.save(obj);
	}

	@Override
	public void elimina(UsuarioHasRol obj) {
		repository.delete(obj);
	}

}