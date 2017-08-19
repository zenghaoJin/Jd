package tool;

import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import po.JdException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by 曾浩津 on 2017/8/19.
 */
public class JdExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest,
                                         HttpServletResponse httpServletResponse, Object o,
                                         Exception e) {
        JdException jdException = null;
        if (e instanceof JdException){
            jdException = (JdException) e;
        }else{
            jdException = new JdException("未知错误");
        }
        String message = jdException.getMessage();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message",message);
        modelAndView.setViewName("error");
        return modelAndView;
    }
}
