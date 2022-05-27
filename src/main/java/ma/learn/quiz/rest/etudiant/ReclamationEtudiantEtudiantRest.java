package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.ReclamationEtudiant;
import ma.learn.quiz.bean.User;
import ma.learn.quiz.exception.NotAnImageFileException;
import ma.learn.quiz.service.ReclamationEtudiantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import static ma.learn.quiz.filter.JwtConstant.*;
import static org.springframework.http.HttpStatus.OK;
import static org.springframework.http.MediaType.IMAGE_JPEG_VALUE;

@RestController

@RequestMapping("/etudiant/reclamationEtudiantEtudiant")
public class ReclamationEtudiantEtudiantRest {

    @Autowired
    private ReclamationEtudiantService reclamationEtudiantService;

    @PutMapping("/update/all")
    public List<ReclamationEtudiant> updateAll(@RequestBody List<ReclamationEtudiant> reclamationEtudiants) {
        return reclamationEtudiantService.updateAll(reclamationEtudiants);
    }


    @GetMapping("/")

    public List<ReclamationEtudiant> findAll() {
        return reclamationEtudiantService.findAll();
    }

    @PostMapping("/")
    public ReclamationEtudiant saveReclamationEtudiant(@RequestBody ReclamationEtudiant reclamationEtudiant) throws Exception {
        return reclamationEtudiantService.saveReclamationEtudiant(reclamationEtudiant);
    }

    @GetMapping("/{id}")
    public List<ReclamationEtudiant> findReclamationEtudiantByEtudiantId(@PathVariable Long id) {
        return reclamationEtudiantService.findReclamationEtudiantByEtudiantId(id);
    }

    @GetMapping("/{id}/{idetudiant}")

    public ReclamationEtudiant findReclamationEtudiantByIdAndEtudiantId(@PathVariable Long id, @PathVariable Long idetudiant) {
        return reclamationEtudiantService.findReclamationEtudiantByIdAndEtudiantId(id, idetudiant);
    }

    @PostMapping("/updateImg")
    public ReclamationEtudiant updateImg(@RequestParam("id") Long id, @RequestParam(value = "img") MultipartFile img) throws IOException, NotAnImageFileException {
        ReclamationEtudiant reclamationEtudiant = this.reclamationEtudiantService.findReclamationEtudiantById(id);
       return this.reclamationEtudiantService.saveReclamationImage(reclamationEtudiant, img);
    }


}

