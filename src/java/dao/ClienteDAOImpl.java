package dao;

import entidades.Cliente;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ClienteDAOImpl implements ClienteDAO {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("chireiaPU");

    public void save(Cliente cliente) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (cliente.getId() > 0) {
            em.merge(cliente);
        } else {
            em.persist(cliente);
        }
        em.getTransaction().commit();
        em.clear();
    }

    public void delete(Cliente cliente) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (!em.contains(cliente)) {
            cliente = em.merge(cliente);
        }
        em.remove(cliente);
        em.getTransaction().commit();
        em.close();
    }

    public Cliente find(int id) {
        EntityManager em = fabrica.createEntityManager();
        return em.find(Cliente.class, id);
    }

    public List<Cliente> list() {
        EntityManager em = fabrica.createEntityManager();
        Query q = em.createQuery("SELECT c FROM Cliente as c"); //JPQL
        return q.getResultList();
    }
}
