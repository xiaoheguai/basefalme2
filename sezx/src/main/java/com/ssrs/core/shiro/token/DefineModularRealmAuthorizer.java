package com.ssrs.core.shiro.token;

import com.ssrs.core.shiro.filter.LoginFilter;
import com.ssrs.permission.model.User;
import com.ssrs.vo.MUserVo;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.Authorizer;
import org.apache.shiro.authz.ModularRealmAuthorizer;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.CollectionUtils;

import java.util.Collection;
import java.util.Map;

public class DefineModularRealmAuthorizer extends ModularRealmAuthorizer {

    private Map<String, Realm> defineRealms;
    /**
     * 判断Realm是不是null
     */
    @Override
    protected void assertRealmsConfigured() throws IllegalStateException {
        defineRealms = getDefineRealms();
        if (CollectionUtils.isEmpty(defineRealms)) {
            String msg = "Configuration error:  No realms have been configured!  One or more realms must be "
                    + "present to execute an authentication attempt.";
            throw new IllegalStateException(msg);
        }
    }


    /**
     * 根据filter的name 取对应realm进行授权
     */
    @Override
    public boolean isPermitted(PrincipalCollection principals, String permission) {
        assertRealmsConfigured();
        Object primaryPrincipal = principals.getPrimaryPrincipal();



        if(primaryPrincipal instanceof User){

            Realm realm = defineRealms.get("u_login");
            if(realm==null){
                // log.error("没有配置NewFormAuthenticationFilter对应的Realm");
                throw new RuntimeException("没有配置后台对应的Realm");
            };
            return ((Authorizer)realm).isPermitted(principals, permission);
        }else if(primaryPrincipal instanceof MUserVo){
            Realm realm = defineRealms.get("m_login");
            if(realm==null){
                // log.error("没有配置NewFormAuthenticationFilter对应的Realm");
                throw new RuntimeException("没有配置前台对应的Realm");
            };
            return ((Authorizer)realm).isPermitted(principals, permission);
        }

        return false;
    }

    public void setDefineRealms(Map<String, Realm> defineRealms) {
        this.defineRealms = defineRealms;
    }

    public Map<String, Realm> getDefineRealms() {
        return defineRealms;
    }


}
