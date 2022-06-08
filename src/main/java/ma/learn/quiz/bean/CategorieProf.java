package ma.learn.quiz.bean;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonProperty;
@Entity
public class CategorieProf {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String level ;
    private BigDecimal lessonRate ;
    private String code ;
    @JsonProperty(access=JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy="categorieProf", cascade = CascadeType.ALL)
    private List<Prof> profs;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public BigDecimal getLessonRate() {
		return lessonRate;
	}
	public void setLessonRate(BigDecimal lessonRate) {
		this.lessonRate = lessonRate;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<Prof> getProfs() {
		return profs;
	}
	public void setProfs(List<Prof> profs) {
		this.profs = profs;
	}
}
