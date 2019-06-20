package com.ssrs.controller.reception.token;

import com.ssrs.permission.model.User;
import com.ssrs.permission.service.MUserLoginService;
import com.ssrs.vo.MUserVo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.Date;


/**
 * 
 * 开发公司：SOJSON在线工具 <p>
 * 版权所有：© www.sojson.com<p>
 * 博客地址：http://www.sojson.com/blog/  <p>
 * <p>
 * 
 * shiro 认证 + 授权   重写
 * 
 * <p>
 * 
 * 区分　责任人　日期　　　　说明<br/>
 * 创建　周柏成　2016年6月2日 　<br/>
 *
 * @author zhou-baicheng
 * @email  so@sojson.com
 * @version 1.0,2016年6月2日 <br/>
 * 
 */
public class MSampleRealm extends AuthorizingRealm {

	@Autowired
	@Qualifier(value = "mUserService")
	private MUserLoginService userService;

	public MSampleRealm() {
		super();
	}
	/**
	 *  认证信息，主要针对前台用户登录，
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		
		MShiroToken token = (MShiroToken) authcToken;
		MUserVo user = userService.login(token.getUsername(),token.getPswd());
		if(null == user){
			throw new AccountException("帐号或密码不正确！");
		/**
		 * 如果用户的status为禁用。那么就抛出<code>DisabledAccountException</code>
		 */
		}
// else if(User._0.equals(user.getStatus())){
//			throw new DisabledAccountException("帐号已经禁止登录！");
//		}else{
//			//更新登录时间 last login time
//			user.setLastLoginTime(new Date());
//			userService.updateByPrimaryKeySelective(user);
//		}
		return new SimpleAuthenticationInfo(user,user.getLoginPwd(), getName());
    }

	 /**
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

    	//Long userId = MTokenManager.getUserId();
		SimpleAuthorizationInfo info =  new SimpleAuthorizationInfo();
		//根据用户ID查询角色（role），放入到Authorization里。
		//Set<String> roles = roleService.findRoleByUserId(userId);
		//info.setRoles(roles);
		//根据用户ID查询权限（permission），放入到Authorization里。
		//Set<String> permissions = permissionService.findPermissionByUserId(userId);
		//info.setStringPermissions(permissions);
        return info;
    }
    /**
     * 清空当前用户权限信息
     */
	public  void clearCachedAuthorizationInfo() {
		PrincipalCollection principalCollection = SecurityUtils.getSubject().getPrincipals();
		SimplePrincipalCollection principals = new SimplePrincipalCollection(
				principalCollection, getName());
		super.clearCachedAuthorizationInfo(principals);
	}
	/**
	 * 指定principalCollection 清除
	 */
	public void clearCachedAuthorizationInfo(PrincipalCollection principalCollection) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(
				principalCollection, getName());
		super.clearCachedAuthorizationInfo(principals);
	}
}
