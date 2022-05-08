package com.msc.telecon.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter @Entity
public class Request implements Serializable {

	private static final long serialVersionUID = 369318715837585837L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column(nullable = false)
	private String type;
	
	@Column(nullable = false)
	private String status;
	
	@Column(nullable = false)
	private Integer type_services_id;
	
	@Column(nullable = false)
	private Integer line_id;

}
