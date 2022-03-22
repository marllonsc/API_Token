package com.msc.telecon.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.msc.telecon.entity.Authentication;

@Repository
public interface AuthenticationRepository extends JpaRepository<Authentication,Integer>{		
	
	@Query(value="SELECT * FROM authentication a WHERE a.user = :user LIMIT 1", nativeQuery = true)
	public Authentication getAuthenticationByUser(@Param("user") String user);

}
