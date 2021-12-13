package ma.learn.quiz.util;

import ma.learn.quiz.bean.Section;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class SynchronizationHandler {

    private Map<Long, Section> currentSectionsMap = new HashMap<>();

    public int saveCurrentSectionByProfId(Long id, Section currentSection){
        this.currentSectionsMap.put(id,currentSection);
        return 1;
    }
    public int updateCurrentSectionByProfId(Long id, Section updatedSection){
        this.currentSectionsMap.remove(id);
        return this.saveCurrentSectionByProfId(id,updatedSection);
    }
    public Section getcurrentSectionByProf(Long id){
        return this.currentSectionsMap.get(id);
    }
    public int removeSessionWhenFinish(Long id){
        this.currentSectionsMap.remove(id);
        return 1;
    }
}
