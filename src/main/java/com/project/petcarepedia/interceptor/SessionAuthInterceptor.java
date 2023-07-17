package com.project.petcarepedia.interceptor;

import com.project.petcarepedia.dto.SessionDto;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionAuthInterceptor extends HandlerInterceptorAdapter{
	/**
	 * preHandle : Controller
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
								HttpServletResponse response,
								Object handler)
										throws Exception {
		HttpSession session = request.getSession();

		SessionDto svo = (SessionDto) session.getAttribute("svo");
        if(svo==null) {
            response.sendRedirect("/login");
            return false;
        } else {
            if(!svo.getGrade().equals("admin")) {
                String requestURI = request.getRequestURI();
                if (requestURI.startsWith("/admin_")) {
                    response.sendRedirect("/");
                    return false;
                }
            }
        }

        return true;
	}
}
