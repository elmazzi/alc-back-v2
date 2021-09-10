package ma.learn.quiz.rest;

import ma.learn.quiz.service.TranslationEnAr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping(value = "learn/TranslateEnAr")
public class TranslationEnArRest {
    @Autowired
    private TranslationEnAr translationEnAr;

    @GetMapping("/text/{texttotranslate}")
    public String TranslationResult(@PathVariable String texttotranslate) throws IOException {
        return translationEnAr.TranslationResult(texttotranslate);
    }

    @GetMapping("/text/synonymes/{text}")
    public List<String> synonyme(@PathVariable String text) throws IOException {
        return translationEnAr.synonyme(text);
    }
}
