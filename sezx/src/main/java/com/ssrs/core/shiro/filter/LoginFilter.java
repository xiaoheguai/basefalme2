package com.ssrs.core.shiro.filter;

import com.ssrs.controller.reception.token.mamager.MTokenManager;
import com.ssrs.core.shiro.token.UsernamePasswordAndFilterToken;
import com.ssrs.core.shiro.token.manager.TokenManager;
import com.ssrs.permission.model.User;
import com.ssrs.util.commom.LoggerUtils;
import com.ssrs.vo.MUserVo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
* @Description:    判断登录
* @Author:         ssrs
* @CreateDate:     2018/8/7 16:26
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/7 16:26
* @Version:        1.0
*/
public class LoginFilter extends FormAuthenticationFilter {
	final static Class<LoginFilter> CLASS = LoginFilter.class;
	@Override
	protected boolean isAccessAllowed(ServletRequest request,
                                      ServletResponse response, Object mappedValue){
		HttpServletRequest servletRequest = (HttpServletRequest)request;
		String url = servletRequest.getServletPath();
		Object token = null;
		if(SecurityUtils.getSubject()==null){
			if(url!=null&&url!=""&&url.startsWith("/m")){
				token = MTokenManager.getToken();
			}else{
				token = TokenManager.getToken();
			}
		}else {
			token = SecurityUtils.getSubject().getPrincipals();

		}


		
		if(null != token || isLoginRequest(request, response)){// && isEnabled()
            return Boolean.TRUE;
        } 
		if (ShiroFilterUtils.isAjax(request)) {// ajax请求
			Map<String,String> resultMap = new HashMap<String, String>();
			LoggerUtils.debug(getClass(), "当前用户没有登录，并且是Ajax请求！");
			resultMap.put("login_status", "300");
			resultMap.put("message", "\u5F53\u524D\u7528\u6237\u6CA1\u6709\u767B\u5F55\uFF01");//当前用户没有登录！
			ShiroFilterUtils.out(response, resultMap);
		}
		return Boolean.FALSE ;
            
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response)
			throws Exception {

		Subject subject = getSubject(request, response);
//		if (subject.getPrincipal() == null) {  // 表示没有登录，重定向到登录页面
//			saveRequest(request);
//			HttpServletRequest httpServletRequest = (HttpServletRequest)request;
//			String url = httpServletRequest.getServletPath();
//			if(url!=null&&url!=""&&url.startsWith("/m")){
//				WebUtils.issueRedirect(request, response, "/m/login");
//			}else{
//				WebUtils.issueRedirect(request, response, "/u/login");
//			}
//
//		}else{
			//保存Request和Response 到登录后的链接
			saveRequestAndRedirectToLogin(request, response);
//		}
		return Boolean.FALSE ;
	}


	/**
	 * 创建自定义的令牌，加入当前filter
	 */
	@Override
	protected AuthenticationToken createToken(String username, String password,
											  boolean rememberMe, String host) {
		return new UsernamePasswordAndFilterToken(username, password,
				rememberMe, host, this);
	}

	/**
	 * 获取当前Filter的名字（角色名）扩大访问范围
	 */
	@Override
	public String getName() {
		return super.getName();
	}

	

}
