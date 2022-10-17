package com.escape.exiter.reservation.service;

import com.escape.exiter.reservation.domain.ReservationDomain;

public interface ReservationService {
	void addReservation(ReservationDomain reservation);
	long getCntReserByUid(long uid);
}
