package com.msc.telecon.repository;

import org.springframework.stereotype.Repository;

import com.msc.telecon.entity.Person;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface PersonRepository extends JpaRepository<Person,Integer>{		

}
