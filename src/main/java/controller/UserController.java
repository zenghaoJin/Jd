package controller;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import po.JdUser;
import service.UserService;
import tool.EmailCheck;
import tool.Forget;
import tool.actiCode;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 曾浩津 on 2017/7/12.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/forget")
    public String forget(){
        return "forget";
    }
    @RequestMapping("/sign_up")
    public String sign_up(){
        return "sign-up";
    }
    @RequestMapping("/loginUI")
    public String loginUI(HttpSession session, String username, String pass, Model model)throws Exception {
        if(username!=null&&!"".equals(username)&&pass!=null&&!"".equals(pass)){
            if(userService.findUser(username,pass)>0){
                session.setAttribute("username",username);
                return "";
            }else{
                model.addAttribute("message","密码错误");
                model.addAttribute("username", username);
                return "login";
            }
        }else{
            model.addAttribute("message","账号或密码不能为空");
            return "login";
        }
    }
    @RequestMapping("/sign_upUI")
    public String sign_upUI(@Validated JdUser jdUser, BindingResult bindingResult, Model model,String pnum)throws Exception {
        if(bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for(ObjectError objectError:allErrors){
                System.out.println(objectError.getDefaultMessage());
            }
            model.addAttribute("message",allErrors);
            model.addAttribute("jdUser",jdUser);
            model.addAttribute("pnum",pnum);
            return "forward:sign_up";
        }
        if(pnum.equals(jdUser.getActicode())) {
            jdUser.setState("0");
            jdUser.setMoney(0f);
            userService.insertUser(jdUser);
            EmailCheck emailCheck = new EmailCheck();
            emailCheck.message(jdUser.getEmail(),jdUser.getName(),jdUser.getActicode());
        }else{
            model.addAttribute("message","验证码不正确或已过期，请重新获取");
            model.addAttribute("jdUser",jdUser);
            model.addAttribute("pnum",pnum);
            return "forward:sign_up";
        }
        return "login";
    }
    @RequestMapping("/checkUname")
    public void Checkname(HttpServletResponse response,String name)throws Exception{
        int x = userService.findUserName(name);
        String result = null;
        if(x>0){
            result = "{\"message\":\"0\"}";
        }else{
            result = "{\"message\":\"1\"}";
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }
    @RequestMapping("/checkEmail")
    public void checkEmail(HttpServletResponse response,String email)throws Exception{
        int x = userService.checkEmail(email);
        String result = null;
        if(x>0){
            result = "{\"message\":\"0\"}";
        }else{
            result = "{\"message\":\"1\"}";
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }
    @RequestMapping("/num")
    public void num(HttpServletResponse response,HttpSession session)throws Exception{
        actiCode actiCode = new actiCode();
        String x = actiCode.number();
        System.out.print(x);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print( "{\"pnum\":\""+x+"\"}");
    }
    @RequestMapping("/emailCheck")
    public String emailCheck(String name,String acticode)throws Exception{
        JdUser jdUser = userService.select_Name(name);
        if (acticode.equals(jdUser.getActicode())){
            userService.emailCheck(name);
        }
        return "login";
    }
    @RequestMapping("/forgetPass")
    public void forget(HttpServletResponse response,String email)throws Exception{
        Forget forget = new Forget();
        String result = null;
        JdUser jdUser = userService.select_Email(email);
        if(jdUser!=null){
        forget.forgetPass(email,jdUser.getName());
        result = "{\"message\":\"1\"}";
        }else{
        result = "{\"message\":\"0\"}";
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }
    @RequestMapping("/forgetPass2")
    public String forget2(String name,Model model)throws Exception{
        model.addAttribute("name",name);
        return "forget2";
    }
    @RequestMapping("/forgetPassUI")
    public String forgetUI(@Validated JdUser jdUser,BindingResult bindingResult, Model model)throws Exception{
        if(bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for(ObjectError objectError:allErrors){
                System.out.println(objectError.getDefaultMessage());
            }
            model.addAttribute("message",allErrors);
            model.addAttribute("name",jdUser.getName());
            return "forward:forgetPass2";
        }else{
            userService.updateUser_name(jdUser);
        return "login";
        }
    }
}
