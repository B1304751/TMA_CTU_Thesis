package edu.ctu.thesis.travelsystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ctu.thesis.travelsystem.dao.FilterDao;
import edu.ctu.thesis.travelsystem.model.BookTour;

@Service
public class FilterServiceImpl implements FilterService {
	@Autowired
	private FilterDao filterDao;
	
	@Override
	public List<BookTour> regListByFilterSex(String filterSex, int idTour) {
		return this.filterDao.regListByFilterSex(filterSex, idTour);
	}
	
	@Override
	public List<BookTour> regListByFilterTicket(int filterTicket, int idTour) {
		return this.filterDao.regListByFilterTicket(filterTicket, idTour);
	}
	
	@Override
	public List<BookTour> cancelListByFilterSex(String filterSex, int idTour) {
		return this.filterDao.cancelListByFilterSex(filterSex, idTour);
	}
	
	@Override
	public List<BookTour> cancelListByFilterTicket(int filterTicket, int idTour) {
		return this.filterDao.cancelListByFilterTicket(filterTicket, idTour);
	}
}