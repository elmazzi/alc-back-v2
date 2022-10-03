package ma.learn.quiz.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TypeHomeWork {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String lib;
    private String code;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLib() {
        return lib;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setLib(String lib) {
        this.lib = lib;
    }
}
