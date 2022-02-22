package ma.learn.quiz.service.vo;

import ma.learn.quiz.bean.Prof;

public class ReclamationProfVo {
    private String reference;
    private String traite;
    private Prof prof;

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getTraite() {
        return traite;
    }

    public void setTraite(String traite) {
        this.traite = traite;
    }

    public Prof getProf() {
        return prof;
    }

    public void setProf(Prof prof) {
        this.prof = prof;
    }
}
