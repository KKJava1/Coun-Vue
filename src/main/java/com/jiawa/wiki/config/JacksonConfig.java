package com.jiawa.wiki.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

/**
 * 统一注解，解决前后端交互Long类型精度丢失的问题
 *  * 由于雪花算法的id太长返回到前端会出现精度丢失的问题，
 *  * （JSON字符串转JS对象，JSON中的数字会转为 number 类型，
 *  * number 类型的精度是16位，但是雪花算法生成的id长度有19位，
 * so后面的几位精度就丢失了）
 */
@Configuration
public class JacksonConfig {
    @Bean
    public ObjectMapper jacksonObjectMapper(Jackson2ObjectMapperBuilder builder) {
        ObjectMapper objectMapper = builder.createXmlMapper(false).build();
        SimpleModule simpleModule = new SimpleModule();
        simpleModule.addSerializer(Long.class, ToStringSerializer.instance);
        objectMapper.registerModule(simpleModule);
        return objectMapper;
    }
}
