package com.ssrs.core.shiro.token;

import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.web.servlet.AdviceFilter;
import org.apache.shiro.web.servlet.NameableFilter;

public class UsernamePasswordAndFilterToken extends UsernamePasswordToken {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * 存放当前Filter
     */
    private NameableFilter loginFilter;

    public UsernamePasswordAndFilterToken() {
        super();
    }

    public UsernamePasswordAndFilterToken(final String username,
                                          final char[] password, final boolean rememberMe, final String host,
                                          final AdviceFilter loginFilter) {
        super(username, password, rememberMe, host);
        this.loginFilter = loginFilter;
    }

    public UsernamePasswordAndFilterToken(final String username,
                                          final String password, final boolean rememberMe, final String host,
                                          final AdviceFilter loginFilter) {
        super(username, password, rememberMe, host);
        this.loginFilter = loginFilter;
    }

    public NameableFilter getLoginFilter() {
        return loginFilter;
    }

    public void setLoginFilter(NameableFilter loginFilter) {
        this.loginFilter = loginFilter;
    }

}
