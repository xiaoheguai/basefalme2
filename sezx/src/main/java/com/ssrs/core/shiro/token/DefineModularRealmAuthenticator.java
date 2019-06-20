package com.ssrs.core.shiro.token;

import com.ssrs.controller.reception.token.MShiroToken;
import com.ssrs.core.shiro.filter.LoginFilter;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.util.CollectionUtils;

import java.util.Collection;
import java.util.Map;

public class DefineModularRealmAuthenticator extends ModularRealmAuthenticator {

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
     * 根据filter的name 取对应realm进行登录
     */
    @Override
    protected AuthenticationInfo doAuthenticate(
            AuthenticationToken authenticationToken)
            throws AuthenticationException {
        assertRealmsConfigured();

        /**
         * authenticationToken 如果是自定义的UsernamePasswordAndFilterToken，调用单个realm
         * 否则 使用默认的迭代realm方式
         */
        if(authenticationToken instanceof ShiroToken) {
//            LoginFilter loginFilter =
//                    (LoginFilter)((UsernamePasswordAndFilterToken) authenticationToken).getLoginFilter();

            Realm realm = defineRealms.get("u_login");
            if (realm == null) {
                // log.error("没有配置NewFormAuthenticationFilter对应的Realm");
                throw new RuntimeException("没有配置LoginFilter对应的Realm");
            }
            ;
            return doSingleRealmAuthentication(realm, authenticationToken);
        }else if(authenticationToken instanceof MShiroToken){
            Realm realm = defineRealms.get("m_login");
            if (realm == null) {
                // log.error("没有配置NewFormAuthenticationFilter对应的Realm");
                throw new RuntimeException("没有配置LoginFilter对应的Realm");
            }
            ;
            return doSingleRealmAuthentication(realm, authenticationToken);
        }else{
            return oldDoAuthenticate(authenticationToken);
        }


    }

    private  AuthenticationInfo oldDoAuthenticate(AuthenticationToken authenticationToken)throws AuthenticationException{

        Collection<Realm> realms = defineRealms.values();
        if (realms.size() == 1) {
            return doSingleRealmAuthentication(realms.iterator().next(), authenticationToken);
        } else {
            return doMultiRealmAuthentication(realms, authenticationToken);
        }
    }


    public void setDefineRealms(Map<String, Realm> defineRealms) {
        this.defineRealms = defineRealms;
    }

    public Map<String, Realm> getDefineRealms() {
        return defineRealms;
    }


}
