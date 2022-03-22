package com.msc.telecon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.msc.telecon.entity.Person;
import com.msc.telecon.repository.PersonRepository;


@Service
public class PersonService {
	
	@Autowired
	private PersonRepository repository;
	
	public Person createPerson(Person person) {
	    return repository.save(person);
	}

	public List<Person> getPerson() {
	    return repository.findAll();
	}

	public void deletePerson(Integer id) {
		repository.deleteById(id);
	}
	
	public List<Person> returnAll() {
		return repository.findAll();
	}
}
