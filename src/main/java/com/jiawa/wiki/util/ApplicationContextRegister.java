package com.jiawa.wiki.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * @author k
 */
@Component
public class ApplicationContextRegister implements ApplicationContextAware {
    private static ApplicationContext APPLICATION_CONTEXT;

    public ApplicationContextRegister() {
    }

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        APPLICATION_CONTEXT = applicationContext;
    }

    public static ApplicationContext getApplicationContext() {
        return APPLICATION_CONTEXT;
    }

    public static <T> T getBean(Class<T> type) {
        try {
            return APPLICATION_CONTEXT.getBean(type);
        } catch (Exception var2) {
            return null;
        }
    }

    public static Object getBean(String beanName) {
        try {
            return APPLICATION_CONTEXT.getBean(beanName);
        } catch (Exception var2) {
            return null;
        }
    }

    public static <T> T getBean(String beanName, Class<T> clazz) {
        try {
            return APPLICATION_CONTEXT.getBean(beanName, clazz);
        } catch (Exception var3) {
            return null;
        }
    }
}