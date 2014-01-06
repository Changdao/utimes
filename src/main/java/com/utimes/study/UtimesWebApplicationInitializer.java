package com.utimes.study;

import org.springframework.core.annotation.Order;
import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/**
 * No customizations of {@link AbstractSecurityWebApplicationInitializer} are necessary.
 *
 * @author Rob Winch
 */

public class UtimesWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer {

    public UtimesWebApplicationInitializer() {
        super(SecurityConfig.class);
    }
}