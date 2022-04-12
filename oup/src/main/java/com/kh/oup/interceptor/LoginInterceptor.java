package com.kh.oup.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.oup.employee.vo.EmployeeVo;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		EmployeeVo loginEmployee = (EmployeeVo) request.getSession().getAttribute("loginEmployee");
		if(null != loginEmployee) {
			return true;
		} else {
			request.setAttribute("msg", "로그인을 하신 뒤 이용해주세요.");
			request.getRequestDispatcher("/WEB-INF/views/error/loginErrorPage.jsp").forward(request, response);
			return false;
		}
	}
 
}
