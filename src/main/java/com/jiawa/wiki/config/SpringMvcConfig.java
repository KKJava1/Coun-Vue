package com.jiawa.wiki.config;

//import com.jiawa.wiki.interceptor.ActionInterceptor;
import com.jiawa.wiki.interceptor.LoginInterceptor;
import com.jiawa.wiki.interceptor.RefreshInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

@Configuration
public class SpringMvcConfig implements WebMvcConfigurer {

    @Resource
    LoginInterceptor loginInterceptor;
    @Resource
    RefreshInterceptor refreshInterceptor;

    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/test/**",
                        "/redis/**",
                        "/user/login",
                        "/category/all",
                        "/ebook/list",
                        "/doc/all/**",
                        "/doc/vote/**",
                        "/doc/find-content/**",
                        "/ebook-snapshot/**",
                        "/ebook/upload/avatar",
                        "/file/**",
                        "/user/regirster",
                        "/doc/handleSubmitComment",
                        "/doc/comments/{ebookId}",
                        "/doc/collect",
                        "/doc/saveDocrecord",
                        "/forum/**"
                ).order(1);
        //通过设置order参数来调整拦截器进入的顺序
        registry.addInterceptor(refreshInterceptor).addPathPatterns("/**").order(0);
    }


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/file/**").addResourceLocations("file:D:/file/img/");
    }
}
