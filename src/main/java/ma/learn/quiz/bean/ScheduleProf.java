package ma.learn.quiz.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ScheduleProf {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private Date startTime;
	private Date endTime;
	private String ref;
	private String subject;
	@ManyToOne
	private Etudiant etudiant;
	@ManyToOne
	private Prof prof;

	public Prof getProf() {
		return prof;
	}

	public void setProf(Prof prof) {
		this.prof = prof;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Date getStart() {
		return startTime;
	}

	public void setStart(Date start) {
		this.startTime = start;
	}

	public Date getEnd() {
		return endTime;
	}

	public void setEnd(Date end) {
		this.endTime = end;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Etudiant getEtudiant() {
		return etudiant;
	}

	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}

}
