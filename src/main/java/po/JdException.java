package po;

/**
 * Created by 曾浩津 on 2017/8/19.
 */
public class JdException extends Exception {
    public String message;
    public JdException(String message){
        super(message);
        this.message = message;
    }
    public String getMessage(){
        return message;
    }
    public void  setMessage(String message){
        this.message = message;
    }
}
