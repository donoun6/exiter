package com.escape.exiter.reservation.service;

import java.util.List;

import com.escape.exiter.reservation.domain.ReserThemeCom;
import com.escape.exiter.reservation.domain.ReservationDomain;

public interface ReservationService {
	void addReservation(ReservationDomain reservation);
	long getCntReserByUid(long uid);
	List<ReserThemeCom> getReservationsByUid(long uid);
}
