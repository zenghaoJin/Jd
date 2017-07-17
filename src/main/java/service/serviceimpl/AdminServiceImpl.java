package service.serviceimpl;

/**
 * Created by 曾浩津 on 2017/7/12.
 */

import mapper.JdAdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.JdAdmin;
import service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    private JdAdminMapper jdAdminMapper;
    public int findAdmin(String name,String pass) throws Exception{
        JdAdmin jdAdmin = new JdAdmin();
        jdAdmin.setName(name);
        jdAdmin.setPass(pass);
        return jdAdminMapper.findAdmin(jdAdmin);
    };
}
