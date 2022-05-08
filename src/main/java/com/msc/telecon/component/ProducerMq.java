package com.msc.telecon.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.msc.telecon.entity.Request;

@Component
public class ProducerMq {

	@Autowired
	JmsTemplate jmsTemplate;
	
	public Request sendMessage(final String queue,Request request) {

		try {
			ObjectMapper mapper = new ObjectMapper();
			String studentAsJson = mapper.writeValueAsString(request);

			jmsTemplate.convertAndSend(queue, studentAsJson);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return request;
	}
	
}
