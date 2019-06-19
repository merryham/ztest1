package org.zerock.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Log4j
@ToString
@Service
@AllArgsConstructor
public class Restaurant {
	
	private Chef chef;

	
	public void order() {
		log.info(chef.cook());
	}
	
}
