package ma.learn.quiz.dao;

import ma.learn.quiz.bean.Fonction;
import ma.learn.quiz.bean.NiveauEtude;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FonctionDao extends JpaRepository<Fonction, Long> {
        Fonction findByCode(String code);
        public int deleteByLibelle(String libelle);
}
