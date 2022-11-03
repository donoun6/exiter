package com.escape.exiter.reservation.service;

import java.text.ParseException;
import java.util.List;

import com.escape.exiter.reservation.domain.ReserDetail;
import com.escape.exiter.reservation.domain.ReserThemeCom;
import com.escape.exiter.reservation.domain.ReservationDomain;

public interface ReservationService {
	void addReservation(ReservationDomain reservation);
	long getCntReserByUid(long uid);
	List<ReserThemeCom> getReservationsAfterToday(long uid);
	List<ReserThemeCom> getReservationsBeforeToday(long uid);
	List<Object> findReservationTime(String rDate, long tid);
	ReserDetail getReservationDetail(long rid, long uid);
	List<ReserThemeCom> reserDateSort(List<ReserThemeCom> list, String sortType);
	boolean reserDateBeforeCheck(ReserThemeCom reser) throws ParseException;
	boolean reserDateBeforeCheck(ReserDetail reser) throws ParseException;
	boolean reserDateCheckTwoHour(ReserDetail reser) throws ParseException;
	void deleteReservation(long rid, long uid);
	long getBeforeReservationCount(long uid);
}
