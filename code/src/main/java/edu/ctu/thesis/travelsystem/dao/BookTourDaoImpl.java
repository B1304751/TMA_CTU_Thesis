package edu.ctu.thesis.travelsystem.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import edu.ctu.thesis.travelsystem.model.BookTour;
import edu.ctu.thesis.travelsystem.model.Tour;

@Service
public class BookTourDaoImpl extends AbstractDao implements BookTourDao {
	// Fill the fields automatically
	private static final Logger logger = Logger.getLogger(BookTourDaoImpl.class);
	private TourDao tourDao;

	// Save book tour form when have id tour
	@Override
	public void saveBookTour(BookTour bookTour, int idTour) {
		Session session = getCurrentSession();
		if (bookTour != null) {
			try {
				logger.info("Save book tour be called!");
				session.saveOrUpdate(bookTour);
				session.flush();
			} catch (Exception e) {
				logger.error("Occured ex", e);
			}
		}
	}

	// Display registration list by Id tour
	@SuppressWarnings("unchecked")
	@Override
	public List<BookTour> registrationList(int idTour) {
		Session session = getCurrentSession();
		String hql = "FROM edu.ctu.thesis.travelsystem.model.BookTour WHERE ID_TOUR = :idTour";
		Query query = session.createQuery(hql);
		query.setParameter("idTour", idTour);
		List<BookTour> registrationList = query.list();
		for (BookTour bookTour : registrationList) {
			logger.info("Registration List:" + bookTour);
		}
		return registrationList;
	}

	// Search information of customer booked tour by Id
	@Override
	public BookTour searchById(int idBT) {
		Session session = getCurrentSession();
		BookTour bookTour = new BookTour();
		logger.info("Information of customer have ID: " + idBT);
		String hql = "FROM edu.ctu.thesis.travelsystem.model.BookTour WHERE idBT = ?";
		try {
			Query query = session.createQuery(hql);
			query.setParameter(0, idBT);
			bookTour = (BookTour) query.uniqueResult();
		} catch (Exception e) {
			logger.info("Exception when find tour!");
		}
		return bookTour;
	}

	// Edit information of customer after booked tour
	@Override
	public void editBookTour(BookTour bookTour) {
		Session session = getCurrentSession();
		if (bookTour != null) {
			try {
				session.update(bookTour);
				session.flush();
				logger.info("Edit information of customer booked tour successfully: " + bookTour);
			} catch (Exception e) {
				logger.error("Occured ex", e);
			}
		}
	}

	@Override
	public void deleteBookTour(int idBT, int idTour) {
		Session session = getCurrentSession();
		BookTour bookTour = (BookTour) session.load(BookTour.class, new Integer(idBT));
		if (bookTour != null) {
			Query query = session.createQuery("update BookTour set ID_TOUR = null where ID_BT = :idBT");
			query.setParameter("idBT", bookTour.getIdBT());
			query.executeUpdate();
			session.delete(bookTour);
			session.flush();
			logger.info("Delete customer success!");
		}
	}

	// Search information of customer booked tour by Name
	@Override
	public BookTour searchByName(String cusName) {
		Session session = getCurrentSession();
		BookTour bookTour = (BookTour) session.load(BookTour.class, new String(cusName));
		logger.info("Information of customer have: " + cusName);
		return bookTour;
	}

	// Search information of customer booked tour by Email
	@Override
	public BookTour searchByEmail(String cusEmail) {
		Session session = getCurrentSession();
		BookTour bookTour = (BookTour) session.load(BookTour.class, new String(cusEmail));
		logger.info("Information of customer have: " + cusEmail);
		return bookTour;
	}

	// Search information of customer booked tour by Phone
	@Override
	public BookTour searchByPhone(String cusPhone) {
		Session session = getCurrentSession();
		BookTour bookTour = (BookTour) session.load(BookTour.class, new String(cusPhone));
		logger.info("Information of customer have: " + cusPhone);
		return bookTour;
	}

	@Override
	public List<BookTour> registrationListByValue(String value) {
		Session session = getCurrentSession();
		String hql = "FROM edu.ctu.thesis.travelsystem.model.BookTour WHERE idBT like :value or cusName like :value or cusEmail like :value or cusPhone like :value";
		Query query = session.createQuery(hql);
		query.setParameter("value", "%" + value + "%");
		@SuppressWarnings("unchecked")
		List<BookTour> registrationList = query.list();
		return registrationList;
	}

	@Override
	public Integer getNumBookTour(int idTour) {
		Integer numBookTour = registrationList(idTour).size();
		logger.info("Number of registration are: " + numBookTour);
		return numBookTour;
	}

	@Override
	public Integer getNumBTBySearch(String value) {
		Integer numBookTour = registrationListByValue(value).size();
		logger.info("Number of registration are: " + numBookTour);
		return numBookTour;
	}

	@Override
	public Integer paginationX(Integer currentPage, Integer page) {
		return currentPage * page - page;
	}

	@Override
	public Integer paginationY(Integer numOfPage, Integer currentPage, Integer page) {
		Integer y = 0;
		if (numOfPage < currentPage * page) {
			y = numOfPage % 10;
			if (y > page) {
				y = paginationX(currentPage, page) + (y - page);
			} else {
				y = paginationX(currentPage, page) + y;
			}
		} else {
			y = paginationX(currentPage, page) + page;
		}
		return y;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookTour> listBookTour() {
		Session session = getCurrentSession();
		String hql = "from edu.ctu.thesis.travelsystem.model.BookTour";
		List<BookTour> bookTourList = session.createQuery(hql).list();
		for (BookTour bookTour : bookTourList) {
			logger.info("Tour List:" + bookTour);
		}
		return bookTourList;
	}

	@Override
	public int getNumTicketBooked(int idTour) {
		int numTicketBooked = 0;
		Session session = getCurrentSession();
		String hql = "SELECT SUM(o.cusNumOfTicket) FROM BookTour o WHERE o.tour.id = :idTour";
		logger.info(session);
		Query query = session.createQuery(hql);
		query.setParameter("idTour", idTour);
		Object obj = query.uniqueResult();
		try {
			if (obj != null) {
				numTicketBooked = ((Long) obj).intValue();
				logger.info("Total ticket booked: " + numTicketBooked);
			}
		} catch (Exception e) {
			logger.error("Occured ex", e);
		}
		logger.info("Number of Ticket are booked: " + numTicketBooked);
		return numTicketBooked;
	}

	@Override
	public int getNumTicketAvailability(int idTour) {
		int numTicketBooked = getNumTicketBooked(idTour);
		logger.info("Number of ticket are booked: " + numTicketBooked);
		Tour tour = tourDao.findTourById(idTour);
		int numTicketAvailability = tour.getQuantum();
		int quantum = tour.getQuantum();
		logger.info("Total Ticket: " + quantum);
		for (int i = 0; i <= quantum; i++) {
			numTicketAvailability = quantum - numTicketBooked;
		}
		return numTicketAvailability;
	}
}
