package org.springframework.security.laughingrobot.config;

import org.springframework.security.web.context.*;

public class RobotSecurityWebApplicationInitializer
      extends AbstractSecurityWebApplicationInitializer {

    public RobotSecurityWebApplicationInitializer() {
        super(RobotSecurity.class);
    }
}
