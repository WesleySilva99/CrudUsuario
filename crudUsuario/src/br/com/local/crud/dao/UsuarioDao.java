package br.com.local.crud.dao;

import br.com.local.crud.model.Usuario;
import br.com.local.crud.util.Util;
import org.hibernate.Criteria;
import org.springframework.util.DigestUtils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;

public class UsuarioDao {


    private static final String PERSISTENCE_UNIT = "crud";

    public void salvar(Usuario usuario) {

        usuario.setSenha(Util.gerarSenhaHasheada(usuario.getSenha()));
        System.out.println("Nova senha: " + usuario.getSenha());
        EntityManagerFactory factory =
                Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        manager.persist(usuario);
        manager.getTransaction().commit();
        manager.close();
        factory.close();
    }

    public List<Usuario> listar() {

        List<Usuario> lista = null;

        EntityManagerFactory factory =
                Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
        EntityManager manager = factory.createEntityManager();
        lista = manager.createQuery("FROM Usuario ORDER BY id").getResultList();

        manager.close();

        factory.close();
        return lista;

    }

    public Usuario getOnlyOneUser(Usuario usuario){

        List<Usuario> lista = null;

        EntityManagerFactory factory =
                Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
        EntityManager manager = factory.createEntityManager();

        Query query = manager.createQuery("FROM Usuario u WHERE u.email = :email and u.senha = :senha");

        usuario.setSenha(Util.gerarSenhaHasheada(usuario.getSenha()));

        query.setParameter("email", usuario.getEmail());
        query.setParameter("senha", usuario.getSenha());


        lista = query.getResultList();

        manager.close();

        factory.close();

        if(lista.size()>0)
            return lista.get(0);

        return null;

    }

}
