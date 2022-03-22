package lab.spring.sikgu.interceptor;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {

   private Logger log = Logger.getLogger(this.getClass().getName());
   
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      
      try {
         if(request.getSession().getAttribute("user") == null) {
            //������Ʈ�� context path���� ��ȯ�ϰ� �� ��ο� /user/needLogin.do�� �߰��Ѵ�.
            response.sendRedirect(request.getContextPath()+ "/user/needLogin.do");
            return false;
         } else {
            return true;
         }
      } catch(Exception e) {
         e.printStackTrace();
      }
      return super.preHandle(request, response, handler);
   }
   
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
      super.postHandle(request, response, handler, modelAndView);
   }
}