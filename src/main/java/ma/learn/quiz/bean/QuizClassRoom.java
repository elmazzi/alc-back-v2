package ma.learn.quiz.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class QuizClassRoom {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne
	private ClassRoom classRoom;
	@ManyToOne
	private Quiz quiz;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public ClassRoom getClassRoom() {
		return classRoom;
	}
	public void setClassRoom(ClassRoom classRoom) {
		this.classRoom = classRoom;
	}
	public Quiz getQuiz() {
		return quiz;
	}
	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}

	public QuizClassRoom(ClassRoom classRoom, Quiz quiz) {
		super();
		this.classRoom = classRoom;
		this.quiz = quiz;
	}
	public QuizClassRoom() {
		super();
	}

}
