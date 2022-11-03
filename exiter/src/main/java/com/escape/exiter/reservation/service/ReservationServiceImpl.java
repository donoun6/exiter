package com.escape.exiter.reservation.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.reservation.dao.ReservationDao;
import com.escape.exiter.reservation.domain.ReserDetail;
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
		List<ReserThemeCom> afterList = reservationDao.findReservationsAfterToday(uid);
		// afterList의 예약일시 오름차순 정렬
		afterList = reserDateSort(afterList, "asc");
		return afterList;
	}

	@Override
	public List<ReserThemeCom> getReservationsBeforeToday(long uid) {
		List<ReserThemeCom> beforeList = reservationDao.findReservationsBeforeToday(uid);
		// beforeList의 예약일시 내림차순 정렬
		beforeList = reserDateSort(beforeList, "desc");
		return beforeList;
	}

	@Override
	public List<Object> findReservationTime(String rDate, long tid) {
		return reservationDao.findReservationTime(rDate, tid);
	}

	@Override
	public ReserDetail getReservationDetail(long rid, long uid) {
		return reservationDao.findReservationDetail(rid, uid);
	}
	
	/**
	 * 예약일시 기준으로 리스트 정렬
	 * @param list => 정렬할 리스트
	 * @param sortType => asc(오름차순) / desc(내림차순)
	 * @return 정렬된 리스트
	 */
	@Override
	public List<ReserThemeCom> reserDateSort(List<ReserThemeCom> list, String sortType) {
		for(int i = 0; i < list.size(); i++) {
			String[] timeArr = list.get(i).getRTime().split(":|\\s+"); // [03,05,PM]
			String[] dateArr = list.get(i).getRDate().split("-"); // [2022, 10, 28]
			dateArr[0] = dateArr[0].substring(3, 4); // 2022 -> 2 (int 범위 넘어서서 마지막 자까지만 자름)
			if(timeArr[2].equals("PM") && !(timeArr[0].equals("12"))) {
				timeArr[0] = String.valueOf(Integer.valueOf(timeArr[0]) + 12);
			}
			String dt = dateArr[0] + dateArr[1] + dateArr[2] + timeArr[0] + timeArr[1];
			list.get(i).setReserDate(Integer.valueOf(dt));
		}
		
		if(sortType.equals("asc")) {
			// 오름차순 정렬
			list.sort(new Comparator<ReserThemeCom>() {
			    public int compare(ReserThemeCom rtc1, ReserThemeCom rtc2) {
			    	// 오름차순일 경우 1 ? 1 : 0 ? 0 : -1
			        return Integer.compare(rtc1.getReserDate(), rtc2.getReserDate()) == 1 ? 1 : Integer.compare(rtc1.getReserDate(), rtc2.getReserDate()) == 0 ? 0 : -1;
			    }
			});
		} else if(sortType.equals("desc")) {
			// 내림차순 정렬
			list.sort(new Comparator<ReserThemeCom>() {
			    public int compare(ReserThemeCom rtc1, ReserThemeCom rtc2) {
			    	// 내림차순일 경우 1 ? -1 : 0 ? 0 : 1
			        return Integer.compare(rtc1.getReserDate(), rtc2.getReserDate()) == 1 ? -1 : Integer.compare(rtc1.getReserDate(), rtc2.getReserDate()) == 0 ? 0 : 1;
			    }
			});
		}
		
		return list;
	}

	/**
	 * 현재일시와 예약일시 비교
	 * @param ReserThemeCom reser
	 * @return 예약일시가 현재일시 이전인 경우 : true / 에약일시가 현재일시와 같거나 이후인 경우 : false
	 * @throws ParseException
	 */
	@Override
	public boolean reserDateBeforeCheck(ReserThemeCom reser) throws ParseException {
		String[] timeArr = reser.getRTime().split(":|\\s+");
		if(timeArr[2].equals("PM") && !(timeArr[0].equals("12"))) {
			timeArr[0] = String.valueOf(Integer.valueOf(timeArr[0]) + 12);
		}
		String reserDt = reser.getRDate() + " " + timeArr[0] + ":" + timeArr[1];
		Date currentDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date rDate = sdf.parse(reserDt);
		boolean result = rDate.before(currentDate);
		
		return result;
	}
	
	/**
	 * 현재일시와 예약일시 비교
	 * @param ReserDetail reser
	 * @return 예약일시가 현재일시 이전인 경우 : true / 에약일시가 현재일시와 같거나 이후인 경우 : false
	 * @throws ParseException
	 */
	@Override
	public boolean reserDateBeforeCheck(ReserDetail reser) throws ParseException {
		String[] timeArr = reser.getRTime().split(":|\\s+");
		if(timeArr[2].equals("PM") && !(timeArr[0].equals("12"))) {
			timeArr[0] = String.valueOf(Integer.valueOf(timeArr[0]) + 12);
		}
		String reserDt = reser.getRDate() + " " + timeArr[0] + ":" + timeArr[1];
		Date currentDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date rDate = sdf.parse(reserDt);
		boolean result = rDate.before(currentDate);
		
		return result;
	}

	/**
	 * 현재일시+2시간과 예약일시 비교
	 * @param ReserDetail reser
	 * @return 현재일시(+2h)가 예약일시 이전인 경우 : true / 현재일시(+2h)가 예약일시와 같거나 이후인 경우 : false
	 * @throws ParseException
	 */
	@Override
	public boolean reserDateCheckTwoHour(ReserDetail reser) throws ParseException {
		// 예약일시
		String[] timeArr = reser.getRTime().split(":|\\s+");
		if(timeArr[2].equals("PM") && !(timeArr[0].equals("12"))) {
			timeArr[0] = String.valueOf(Integer.valueOf(timeArr[0]) + 12);
		}
		String reserDt = reser.getRDate() + " " + timeArr[0] + ":" + timeArr[1];
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date rDate = sdf.parse(reserDt);
		
		// 현재일시 + 2시간
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.HOUR_OF_DAY , 2);
		Date twoDate = new Date(cal.getTimeInMillis());

		// 비교
		boolean result = twoDate.before(rDate);
		
		return result;
	}

	@Override
	public void deleteReservation(long rid, long uid) {
		reservationDao.deleteReservation(rid, uid);
	}
	
	
}
