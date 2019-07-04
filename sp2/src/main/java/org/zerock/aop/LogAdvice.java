package org.zerock.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {
	
	@AfterThrowing(pointcut = "execution(* org.zerock.service.SampleService*.*(..))", throwing="exception")
	public void logException(Exception exception) {
		log.info("EXCEPTION");
		log.info(exception);
	}
	
	@Before( "execution(* org.zerock.service.SampleService*.add(String,String))&& args(s1,s2)")
	public void logBefor(String s1, String s2) {
		log.info("==================");
		log.info("==================");
		log.info(s1);
		log.info(s2);
		log.info("==================");
		log.info("==================");
	}
	
	@Around("execution(* org.zerock.service.*Service*.*(..))")
	  public Object logTime( ProceedingJoinPoint pjp) {
	    
	    long start = System.currentTimeMillis();
	    log.info("Target: " + pjp.getTarget());
	    log.info("Param: " + Arrays.toString(pjp.getArgs()));
	    //invoke method 
	    Object result = null;
	    
	    try {
	      result = pjp.proceed();
	    } catch (Throwable e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
	    
	    long end = System.currentTimeMillis();
	    log.info("TIME: "  + (end - start));
	    
	    return result;
	  }
	
	
	
}
