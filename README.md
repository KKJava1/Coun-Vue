# Coun-Vue

## 介绍

### Springboot+vue3
项目采用了前后端分离技术；后端采用 springBoot 基本框架，数据库连接池技
术，Redis+token权限验证；前端使用 vue3+vueCil 开发模式；使用了axios+Json，vuex，
Ant Design Vue,router来实现页面功能。

## 技术栈
#### 后端技术
SpringBoot：简化新Spring应用的初始搭建以及开发过程  
MyBatis：持久层框架  
Redis：内存缓存  
HTTPClient: Http协议客户端    
Lombok  
Mysql：关系型数据库  
阿里云数据库：第三方数据库
#### 前端技术  
Vue.js：web 界面的渐进式框架  
Node.js： JavaScript 运行环境  
Axios：Axios 是一个基于 promise 的 HTTP 库  
Ant Design Vue:进行页面布局  
Webpack：打包工具  


## 软件架构
基于 SSM 开发模式，模拟实现书法网页平台系统，利用，Interceptor过滤器技术进
行登录校验，通过登录到账号，管理书法的管理和分类。所有用户可以对页面进行点赞功
能，利用websocket，完成点赞通知功能，设置定时任务，完成每隔一段时间更新点赞数，阅
读数页面显示，使用异步化解耦点赞功能缓解服务器压力，采用 axio+json 与后端数据进行
交互，管理者也能通过该系统了解各个书法的情况，通过 Echarts图表显示分析后的数据，让
读者清晰的知道30天的用户访问曲线图。


## 项目特点
友好的代码结构及注释，便于阅读及二次开发  
实现前后端分离，通过token进行数据交互  
页面交互使用Vue3.x，极大的提高了开发效率  
完善的部门管理及数据权限，通过注解实现数据权限的控制  
完善的XSS防范及脚本过滤，彻底杜绝XSS攻击  
完善的代码生成机制，可在线生成domain、xml、dao、service、vue、sql代码，减少70%以上的开发任务  
引入quartz定时任务，可动态完成书本的点赞，阅读数，文档功能  
利用websocket实时更新数据  
新增AOP注解实现日志管理。  
代码遵循RestFul风格，阿里巴巴开发规范，利于开发者学习。  



## 技术选型
核心框架：Spring Boot 2.4.0  
持久层框架：MyBatis 3.5  
定时器：SpringJob  
日志管理：Logback  
页面交互：Vue3.x  

## 项目截图
#### 欢迎界面  
![image](https://user-images.githubusercontent.com/116629035/199486607-e2c9e021-bc6f-4b20-9ad7-59bf6de522cb.png)  
#### 登录后可以进行电子书管理 ，还可以进行富文本编辑
![image](https://user-images.githubusercontent.com/116629035/199486009-8d8b12cd-37f8-4245-a2d2-6509765d80b1.png)

#### 用户如果觉得书本好，可以给书本进行点赞
![image](https://user-images.githubusercontent.com/116629035/199486423-8b4b8176-fe0e-4a02-b970-b13ddd197dc5.png)

#### 可以进行管理页面，展示到封面上
![image](https://user-images.githubusercontent.com/116629035/199486696-710e1cbb-9310-4d39-8ce3-4f825b4f2d40.png)


