package com.escape.exiter.reservation.dao;

import java.util.Date;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.escape.exiter.config.DataSourceConfig;
import com.escape.exiter.reservation.domain.ReservationDomain;

public class ReservationDaoTest {
	
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataSourceConfig.class);
		ReservationDao dao = context.getBean("reservationDao", ReservationDao.class);
		ReservationDomain reservation = new ReservationDomain();
		
//		예약 등록
//		Date date = new Date();
//		reservation.setUid(1);
//		reservation.setTid(1);
//		reservation.setRPrice(1);
//		reservation.setRDate(date);
//		reservation.setRTime("test");
//		reservation.setRNum(2);
//		dao.addReservation(reservation);
		
		
		context.close();
	}
}
