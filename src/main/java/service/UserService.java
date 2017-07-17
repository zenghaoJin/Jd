package service;

import com.sun.jna.platform.win32.OaIdl;
import po.JdUser;

/**
 * Created by 曾浩津 on 2017/7/12.
 */
public interface UserService {
    public int findUser(String name,String pass) throws Exception;
    public int insertUser(JdUser jdUser) throws Exception;
    public int findUserName(String name) throws  Exception;
    public void emailCheck(String name) throws Exception;
    public JdUser select_Name(String name) throws Exception;
    public int checkEmail(String email) throws Exception;
}
