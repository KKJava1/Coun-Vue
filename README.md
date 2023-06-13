## Coun-Vue
介绍
## Springboot+vue3
Coun-Vue 是一个采用前后端分离技术的项目。后端基于SpringBoot框架，利用数据库连接池技术进行高效的数据库操作，且使用Redis配合token进行权限验证，确保数据安全。前端则采用vue3+vueCil开发模式，利用axios+Json, vuex, Ant Design Vue和router等技术实现丰富的页面功能。

## 技术栈
## 后端技术
SpringBoot：一种基于Spring的框架，可以简化新Spring应用的初始搭建以及开发过程。它内置了很多第三方库和插件，所以开发者可以更加专注于业务逻辑的开发。 
MyBatis：一款优秀的持久层框架，它支持定制化SQL、存储过程以及高级映射，避免了几乎所有的JDBC代码和手动设置参数以及获取结果集。 
Redis：一个开源的内存数据库，数据的读写速度非常快，常常被用作缓存。 
HTTPClient：是Apache Jakarta Common下的子项目，用来提供高效的、最新的、功能丰富的支持HTTP协议的客户端编程工具包，并且它支持HTTP协议最新的版本和建议。 
Lombok：一个Java库，能通过简单的注解形式来帮助我们简化消除一些必须有但显得很臃肿的Java代码。 
Mysql：一个关系型数据库，使用SQL作为查询语言，用于存储各种类型的数据，从简单的文本到复杂的二进制文件等。 
阿里云数据库：阿里云提供的数据库服务，提供了包括备份恢复、故障切换、性能优化在内的一站式服务。 
## 前端技术
Vue.js：一种轻量级的框架，可以帮助开发者以更简洁的语法进行Web页面的开发，使得代码更易维护，同时也提高了页面的加载速度。
Node.js：一个基于Chrome V8引擎的JavaScript运行环境。Node.js 使用了一个事件驱动、非阻塞式 I/O 的模型，使其轻量又高效。
Axios：一个基于promise的HTTP库，可以用于浏览器和node.js，提供了丰富的HTTP请求API，可满足多种需求。
Ant Design Vue：是一套基于Vue.js的高质量UI组件库，用于快速构建企业级中后台产品界面。
Webpack：一款模块打包工具，能将许多分散的模块按照依赖关系进行打包，生成优化后的静态资源。
##软件架构
该项目基于Springboot+Vue3开发模式，主要模拟实现电子书平台系统。使用Interceptor过滤器进行登录校验，允许已登录用户管理书籍。用户可进行点赞，通过websocket实现点赞通知，设置定时任务定时更新点赞和阅读数。利用axio+json与后端数据交互，通过Echarts图表显示分析后的数据，使读者可以清晰地看到30天内的用户访问曲线图。

## 项目特点
代码结构：代码结构清晰，注释丰富，方便阅读和二次开发。
前后端分离：前后端分离，通过Redis+token进行数据交互，提高系统的安全性和效率。
页面交互：页面交互使用Vue3.x，提高了开发效率。
防抖策略：前端使用防抖策略，提高性能，减少不必要的sql访问。
代码生成：有完善的代码生成机制，可在线生成domain、xml、dao、service、vue、sql代码，大大减少开发任务。
定时任务：引入quartz定时任务，可动态完成书本的点赞、阅读数、文档功能。
实时更新：利用websocket实时更新数据，提升用户体验。
社交功能：支持发布评论、回复评论、收藏书本等社交功能。
日志管理：新增AOP注解实现日志管理，方便问题定位和解决。
开发规范：代码遵循RestFul风格，阿里巴巴开发规范，易于理解和学习。
技术选型
核心框架：Spring Boot 2.4.0
持久层框架：MyBatis 3.5
定时器：SpringJob
数据缓存：Redis
日志管理：Logback
消息队列：RocketMq
页面交互：Vue3.x
图表：Echarts
前端框架：Ant Design Vue
路由：Vuex

## 项目截图
#### 欢迎界面  
![image](https://user-images.githubusercontent.com/116629035/199486607-e2c9e021-bc6f-4b20-9ad7-59bf6de522cb.png)  
#### 登录后可以进行电子书管理 ，还可以进行富文本编辑
![image](https://user-images.githubusercontent.com/116629035/199486009-8d8b12cd-37f8-4245-a2d2-6509765d80b1.png)

#### 用户如果觉得书本好，可以给书本进行点赞
![image](https://user-images.githubusercontent.com/116629035/199486423-8b4b8176-fe0e-4a02-b970-b13ddd197dc5.png)

#### 可以进行管理页面，展示到封面上
![image](https://user-images.githubusercontent.com/116629035/199486696-710e1cbb-9310-4d39-8ce3-4f825b4f2d40.png)


