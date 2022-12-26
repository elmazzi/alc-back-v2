package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class ConfirmationToken {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9031769415590864548L;

	/**
	 * 
	 */

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	@Column(nullable = false)
	private String token;

	@Column(nullable = false)
	private LocalDateTime expiresAt;
	@Column(nullable = false)
	private LocalDateTime createdAt;

	private LocalDateTime confirmedAt;

	@ManyToOne
	@JoinColumn(nullable = false, name = "user_id")
	@JsonIgnore
	private Etudiant user;

	public ConfirmationToken(String token, LocalDateTime createdAt, LocalDateTime expiresAt, Etudiant user) {
		this.createdAt = createdAt;
		this.token = token;
		this.expiresAt = expiresAt;
		this.user = user;
	}

}
