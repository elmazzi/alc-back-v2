package ma.learn.quiz.rest.prof;

import ma.learn.quiz.bean.EtudiantClassRoom;
import ma.learn.quiz.service.EtudiantClassRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/prof/etudiant-classRoom")
public class EtudiantClassRoomProfRest {
	@Autowired
	private EtudiantClassRoomService etudiantClassRoomService;
	
	@GetMapping("etudiant/ref/{ref}")
	public List<EtudiantClassRoom> findByEtudiantRef(@PathVariable String ref) {
		return etudiantClassRoomService.findByEtudiantRef(ref);
	}
	
	@DeleteMapping("etudiant/ref/{ref}")
	public int deleteByEtudiantRef(@PathVariable String ref) {
		return etudiantClassRoomService.deleteByEtudiantRef(ref);
	}
	
	@PostMapping("/")
	public int save(@RequestBody EtudiantClassRoom etudiantClassRoom) {
		return etudiantClassRoomService.save(etudiantClassRoom);
	}
	@GetMapping("/id/{id}")
	public List<EtudiantClassRoom> findByClassRoomId(@PathVariable Long id) {
		return etudiantClassRoomService.findByClassRoomId(id);
	}
	@DeleteMapping("/id/{id}")
	public int deleteByClassRoomId(@PathVariable Long id) {
		return etudiantClassRoomService.deleteByClassRoomId(id);
	}
	@GetMapping("/")
	public List<EtudiantClassRoom> findAll() {
		return etudiantClassRoomService.findAll();
	}
	
}
