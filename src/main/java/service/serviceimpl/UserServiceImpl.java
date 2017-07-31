package service.serviceimpl;

import mapper.JdUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.JdUser;
import service.UserService;

/**
 * Created by 曾浩津 on 2017/7/12.
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private JdUserMapper jdUserMapper;
    public int findUser(String username,String pass) throws Exception{
        JdUser jdUser = new JdUser();
        jdUser.setName(username);
        jdUser.setPass(pass);
        return  jdUserMapper.findUser(jdUser);
    };
    public int insertUser(JdUser jdUser) throws Exception{
        return jdUserMapper.insert(jdUser);
    };
    public int findUserName(String name) throws  Exception{
        return jdUserMapper.findUserName(name);
    };
    public void emailCheck(String name) throws Exception{
        jdUserMapper.emailCheck(name);
    }
    public JdUser select_Name(String name) throws Exception {
        return jdUserMapper.select_Name(name);
    }
    public int checkEmail(String email) throws Exception{
        return jdUserMapper.checkEmail(email);
    }
    public JdUser select_Email(String email) throws Exception {
        return jdUserMapper.select_Email(email);
    }
    public void updateUser_name(JdUser user) throws Exception {
        jdUserMapper.updateUser(user);
    };


}
