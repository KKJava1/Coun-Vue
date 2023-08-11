package com.jiawa.wiki.config;

import com.jiawa.wiki.job.DocJob;
import org.quartz.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author k
 */
@Configuration
public class QuartzConfig {

    @Bean
    public JobDetail ebookUpdateJobDetail() {
        return JobBuilder.newJob(DocJob.class)
                .withIdentity("docJob")
                .storeDurably()
                .build();
    }

    @Bean
    public Trigger docJobTrigger(JobDetail ebookUpdateJobDetail){
        SimpleScheduleBuilder scheduleBuilder = SimpleScheduleBuilder.simpleSchedule()
                // 这里设置为每120秒执行一次
                .withIntervalInSeconds(120)
                .repeatForever();

        return TriggerBuilder.newTrigger()
                .forJob(ebookUpdateJobDetail)
                .withIdentity("docJobTrigger")
                .withSchedule(scheduleBuilder)
                .build();
    }
}
