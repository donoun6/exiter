package com.escape.exiter.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.reservation.dao.ReservationDao;
import com.escape.exiter.reservation.domain.ReservationDomain;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	ReservationDao reservationDao;

	@Override
	public void addReservation(ReservationDomain reservation) {
		reservationDao.addReservation(reservation);
	}
	
	@Override
	public long getCntReserByUid(long uid) {
		return reservationDao.findCntReserByUid(uid);
	}
}
