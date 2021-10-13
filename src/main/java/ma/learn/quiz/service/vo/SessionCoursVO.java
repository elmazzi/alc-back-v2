package ma.learn.quiz.service.vo;

public class SessionCoursVO {
    private String reference;
    private String profname;
    private String etudiantname;
    private String dateDebut;
    private String dateFin;

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getProfname() {
        return profname;
    }

    public void setProfname(String profname) {
        this.profname = profname;
    }

    public String getEtudiantname() {
        return etudiantname;
    }

    public void setEtudiantname(String etudiantname) {
        this.etudiantname = etudiantname;
    }

    public String getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(String dateDebut) {
        this.dateDebut = dateDebut;
    }

    public String getDateFin() {
        return dateFin;
    }

    public void setDateFin(String dateFin) {
        this.dateFin = dateFin;
    }
}
