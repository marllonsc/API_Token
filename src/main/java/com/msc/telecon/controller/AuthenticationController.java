package com.msc.telecon.controller;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.msc.telecon.entity.Authentication;
import com.msc.telecon.entity.Token;
import com.msc.telecon.service.AuthenticationService;
import com.msc.telecon.util.JsonUtil;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;


@RestController
public class AuthenticationController {
	
	@Autowired
	private AuthenticationService service;
	
	@PostMapping("/token")
	public String login(@RequestParam("user") String username, @RequestParam("password") String pwd) {
		Authentication user = service.authentication(username,pwd);
		if(user!=null) {
			String token = getJWTToken(username);
			Token to = new Token();
			to.setUser(username);
			to.setToken(token);
			return JsonUtil.createJson(to);
		}else {
			return JsonUtil.createJson("User not found!");
		}
		
	}

	private String getJWTToken(String username) {
		String secretKey = "mySecretKey";
		List<GrantedAuthority> grantedAuthorities = AuthorityUtils
				.commaSeparatedStringToAuthorityList("ROLE_USER");
		
		String token = Jwts
				.builder()
				.setId("softtekJWT")
				.setSubject(username)
				.claim("authorities",
						grantedAuthorities.stream()
								.map(GrantedAuthority::getAuthority)
								.collect(Collectors.toList()))
				.setIssuedAt(new Date(System.currentTimeMillis()))
				.setExpiration(new Date(System.currentTimeMillis() + 1800000))
				.signWith(SignatureAlgorithm.HS512,
						secretKey.getBytes()).compact();

		return "Bearer " + token;
	}

}
