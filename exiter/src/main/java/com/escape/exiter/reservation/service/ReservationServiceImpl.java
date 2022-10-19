package com.escape.exiter.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.reservation.dao.ReservationDao;
import com.escape.exiter.reservation.domain.ReserThemeCom;
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

	@Override
	public List<ReserThemeCom> getReservationsAfterToday(long uid) {
		return reservationDao.findReservationsAfterToday(uid);
	}

	@Override
	public List<ReserThemeCom> getReservationsBeforeToday(long uid) {
		return reservationDao.findReservationsBeforeToday(uid);
	}
}
