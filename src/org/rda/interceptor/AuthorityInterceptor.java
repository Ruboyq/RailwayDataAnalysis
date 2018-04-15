package org.rda.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthorityInterceptor implements HandlerInterceptor {

	// 权限认证
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String currentURL = request.getRequestURI();
		// 截取到当前文件名用于比较
		String targetURL = currentURL.substring(currentURL.indexOf("/", 1), currentURL.length());
		// 如果session不为空就返回该session，如果为空就返回null
		if (!"/".equals(targetURL)) {
			HttpSession session = request.getSession(false);
			// 判断当前页面是否是重定向后的登陆页面，如果是就不做session的判断，防止死循环
			if (session == null || session.getAttribute("uid") == null) {
				// 如果session或者userId为空表示用户没有登陆就重定向到login.jsp页面
				response.sendRedirect(request.getContextPath());
				return false;
			}
		}
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
