package tool;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by 曾浩津 on 2017/8/11.
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //获取请求的URL
        String url = request.getRequestURI();
        //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
        if(url.indexOf("select_page.action")>=0||url.indexOf("select2.action")>=0||url.indexOf("select.action")>=0
                ||url.indexOf("selectP.action")>=0||url.indexOf("prod.action")>=0||url.indexOf("login.action")>=0
                ||url.indexOf("forget.action")>=0||url.indexOf("sign_up.action")>=0||url.indexOf("loginUI.action")>=0
                ||url.indexOf("sign_upUI.action")>=0||url.indexOf("checkUname.action")>=0||url.indexOf("checkEmail.action")>=0
                ||url.indexOf("num.action")>=0||url.indexOf("emailCheck.action")>=0||url.indexOf("forgetPass.action")>=0
                ||url.indexOf("forgetPass2.action")>=0||url.indexOf("forgetPassUI.action")>=0||url.indexOf("select_price.action")>=0
                ||url.indexOf("selectSize.action")>=0||url.indexOf("a_login.action")>=0||url.indexOf("a_loginUI.action")>=0
                ||url.indexOf("s_login.action")>=0||url.indexOf("s_updateUI.action")>=0||url.indexOf("add_pseries.action")>=0){
            return true;
        }
        //获取Session
        HttpSession session = request.getSession();
        String JdUser = (String)session.getAttribute("JdUser");
        String jdStores = (String)session.getAttribute("jdStores");
        String jdAdmin = (String)session.getAttribute("jdAdmin");

        if(JdUser != null||jdStores != null||jdAdmin != null){
            return true;
        }
        //不符合条件的，跳转到登录界面
        request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse re, Object o, Exception e) throws Exception {

    }
}
