package ma.learn.quiz.service;
public class AbstractService {

    public String init(String className) {
        return "SELECT item FROM " + className + " item WHERE 1=1";
    }

    public String addCriteria(String key, Object value, String operator) {
        if (value != null && !value.toString().isEmpty()) {
            if (value instanceof String && operator.equals("LIKE") ){
                return " AND item." + key + " " + operator + " '%" + value.toString() + "%'";
            } else {
                return " AND item." + key + " " + operator + " '" + value.toString() + "'";
            }
        }
        return "";
    }

    public String addCriteria(String key, Object value) {
        return addCriteria(key, value, "=");
    }

    public String addCriteria(String key, Object valueMin, Object valueMax) {
        String query = addCriteria(key, valueMin, ">=");
        query += addCriteria(key, valueMax, "<=");
        return query;
    }

}