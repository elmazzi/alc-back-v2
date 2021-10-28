package ma.learn.quiz.service.Util;


public class UtilString {
    public static boolean isEmpty(String value)
    {
        return (value==null || value.isEmpty());

    }


    public static boolean isnotEmpty(String value)
    {
        return !isEmpty(value);

    }
}
