package com.msc.telecon.component;

import java.util.Map;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;

@Component
public class ReceiveMq {

	@Autowired
	JmsTemplate jmsTemplate;

//	@JmsListener(destination = "requests")
//    public void processToDo(String student) {
//        System.out.println("Consumer> " + student);
//    }
	
	@JmsListener(destination = "requests")
	public void consumeMessage(String message) {
		System.out.println("Message received from activemq queue---"+message);
	}

}
