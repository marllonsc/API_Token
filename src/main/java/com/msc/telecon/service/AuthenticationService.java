package com.msc.telecon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.msc.telecon.entity.Authentication;
import com.msc.telecon.repository.AuthenticationRepository;
import com.msc.telecon.util.Md5Util;

@Service
public class AuthenticationService {
	
	@Autowired
	private AuthenticationRepository repository;
	
	@SuppressWarnings("deprecation")
	public Authentication createAuthentication(Authentication authentication) {
		if(StringUtils.isEmpty(authentication.getId())) {
			authentication.setPassword(Md5Util.getMd5(authentication.getPassword()));
		}
	    return repository.save(authentication);
	}

	public Authentication getPerson(String user) {
	    return repository.getAuthenticationByUser(user);
	}

	public void deleteAuthentication(Integer id) {
		repository.deleteById(id);
	}
	
	public List<Authentication> returnAll() {
		return repository.findAll();
	}
	
	public Authentication authentication(String username, String pwd) {
		Authentication dBauthentication = repository.getAuthenticationByUser(username);
		if(Md5Util.getMd5(pwd).equals(dBauthentication.getPassword())) {
			return dBauthentication;
		}else {
			return null;
		}
	}
	

}
