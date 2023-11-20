package vn.edu.iuh.backend.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vn.edu.iuh.backend.models.Order;

import java.time.LocalDateTime;
import java.util.List;

public class OrderRepository {
    private EntityManager em;
    private EntityTransaction trans;

    private final Logger logger = LoggerFactory.getLogger(this.getClass().getName());

    public OrderRepository() {
        em = Persistence
                .createEntityManagerFactory("week2")
                .createEntityManager();
        trans = em.getTransaction();
    }
    public List<Order> getOrderDate(LocalDateTime startDate, LocalDateTime endDate) {
        return em.createNamedQuery("Order.findDate", Order.class)
                .setParameter("startDate", startDate)
                .setParameter("endDate", endDate).getResultList();
    }
}
