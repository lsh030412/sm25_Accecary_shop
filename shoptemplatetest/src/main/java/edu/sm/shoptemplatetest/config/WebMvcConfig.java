package edu.sm.shoptemplatetest.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Slf4j
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
//imgs라는 디렉토리를 스프링프레임우ㅗㅓ크에서 imgs라는 명칭으로 등록하갰다
    @Value("${app.dir.imgsdir}")
    String imgdir;
//resours 핸들러에 등록시킴 imgs폴더를 springboot에서 사용하겠다.
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/imgs/**").addResourceLocations(imgdir);
    }
}