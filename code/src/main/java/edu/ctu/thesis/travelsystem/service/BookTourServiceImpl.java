package edu.ctu.thesis.travelsystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.ctu.thesis.travelsystem.dao.BookTourDao;
import edu.ctu.thesis.travelsystem.model.BookTour;

@Service
public class BookTourServiceImpl implements BookTourService {
	@Autowired
	private BookTourDao bookTourDao;
	
	@Override
	@Transactional
	public void saveBookTour(BookTour bookTour, int idTour) {
		this.bookTourDao.saveBookTour(bookTour, idTour);
	}
	
	@Override
	@Transactional
	public List<BookTour> registrationList(int idTour) {
		return this.bookTourDao.registrationList(idTour);
	}
	
	@Override
	@Transactional
	public BookTour searchById(int idBT) {
		return this.bookTourDao.searchById(idBT);
	}
	
	@Override
	@Transactional
	public void editBookTour(BookTour bookTour) {
		this.bookTourDao.editBookTour(bookTour);
	}

	@Override
	@Transactional
	public void deleteBookTour(int idBT, int idTour) {
		this.bookTourDao.deleteBookTour(idBT, idTour);
	}
	
	@Override
	@Transactional
	public BookTour searchByName(String cusName) {
		return this.bookTourDao.searchByName(cusName);
	}
	
	@Override
	@Transactional
	public BookTour searchByEmail(String cusEmail) {
		return this.bookTourDao.searchByEmail(cusEmail);
	}
	
	@Override
	@Transactional
	public BookTour searchByPhone(String cusPhone) {
		return this.bookTourDao.searchByPhone(cusPhone);
	}
	
	@Override
	@Transactional
	public Integer getNumBookTour(int idTour) {
		return this.bookTourDao.getNumBookTour(idTour);
	}

	@Override
	@Transactional
	public List<BookTour> registrationListByValue(String value) {
		return this.bookTourDao.registrationListByValue(value);
	}

	@Override
	@Transactional
	public Integer getNumBTBySearch(String value) {
		return this.bookTourDao.getNumBTBySearch(value);
	}

	@Override
	public Integer paginationX(Integer currentPage, Integer page) {
		return this.bookTourDao.paginationX(currentPage, page);
	}

	@Override
	public Integer paginationY(Integer numOfPage, Integer currentPage, Integer page) {
		return this.bookTourDao.paginationY(numOfPage, currentPage, page);
	}
	
	@Override
	@Transactional
	public List<BookTour> listBookTour() {
		return this.bookTourDao.listBookTour();
	}
	
	@Override
	public int getNumTicketBooked(int idTour) {
		return this.bookTourDao.getNumTicketBooked(idTour);
	}
	
	@Override
	public int getNumTicketAvailability(int idTour) {
		return this.bookTourDao.getNumTicketAvailability(idTour);
	}
}